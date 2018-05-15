package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Collection;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.mission.AnswerMission;
import com.finalproject.walktogetherapi.entities.mission.HistoryMission;
import com.finalproject.walktogetherapi.entities.mission.Mission;
import com.finalproject.walktogetherapi.mapping.MapMissionMapping;
import com.finalproject.walktogetherapi.mapping.MissionMapping;
import com.finalproject.walktogetherapi.mapping.PatientMapping;
import com.finalproject.walktogetherapi.service.CollectionService;
import com.finalproject.walktogetherapi.service.LogService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.RewardService;
import com.finalproject.walktogetherapi.service.mission.*;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/mission")
public class MissionController {
    private MissionService missionService;
    private CognitiveCategoryService cognitiveCategoryService;
    private HistoryMissionService historyMissionService;
    private PatientService patientService;
    private MapService mapService;
    private PatientGameService patientGameService;
    private PatientMissionService patientMissionService;
    private LogService logService;
    private PositionService positionService;
    private RewardService rewardService;
    private CollectionService collectionService;
    private AnswerMissionService answerMissionService;

    @Autowired
    public MissionController(MissionService missionService,
                             CognitiveCategoryService cognitiveCategoryService,
                             HistoryMissionService historyMissionService,
                             PatientService patientService,
                             MapService mapService,
                             LogService logService,
                             PositionService positionService,
                             AnswerMissionService answerMissionService,
                             PatientGameService patientGameService,
                             PatientMissionService patientMissionService,
                             RewardService rewardService,
                             CollectionService collectionService) {
        this.missionService = missionService;
        this.cognitiveCategoryService = cognitiveCategoryService;
        this.historyMissionService = historyMissionService;
        this.patientService = patientService;
        this.mapService = mapService;
        this.patientGameService = patientGameService;
        this.patientMissionService = patientMissionService;
        this.logService = logService;
        this.positionService = positionService;
        this.rewardService = rewardService;
        this.collectionService = collectionService;
        this.answerMissionService = answerMissionService;
    }

    @GetMapping("/all-map")
    public ResponseEntity getAllMap() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, mapService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("/all-map/nearness")
    public ResponseEntity getAllMapNearness(HttpServletRequest request,
                                            @RequestParam(required = false, defaultValue = "0", value = "lat") double lat,
                                            @RequestParam(required = false, defaultValue = "0", value = "lng") double lng) {
        LogUtil.getInstance().saveLog(request, "", "?lat=" + lat + "&lng=" + lng, logService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, MapMissionMapping.Companion.getInstance().getMapNearPatient(mapService.findAll(), lat, lng), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("/history-by-id/{id}")
    public ResponseEntity getHistoryMission(HttpServletRequest request, @PathVariable Long id) {
        LogUtil.getInstance().saveLog(request, "", logService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, historyMissionService.findHistoryMissionByIdPatient(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity getMission(HttpServletRequest request, @PathVariable Long id) {
        LogUtil.getInstance().saveLog(request, "", logService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, MissionMapping.getInstance().getMissionByIdMap(id, missionService, positionService), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("/by-id/{id}")
    public ResponseEntity getMissionById(HttpServletRequest request, @PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, missionService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("/answer-by-type/{id}")
    public ResponseEntity getAnswerByType(HttpServletRequest request, @PathVariable Long id) {
        AnswerMission answerMission = answerMissionService.findById(id);
        List<AnswerMission> answerMissions = answerMissionService.findByMissionType(answerMission.getMission().getType(), answerMission.getAnswer());
        Collections.shuffle(answerMissions);
        answerMissions = answerMissions.subList(0, 2);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, answerMissions, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(HttpServletRequest request, @RequestBody HashMap<String, Object> data) {
        LogUtil.getInstance().saveLog(request, data, logService);
        Mission mission = MissionMapping.getInstance().createMission(data, cognitiveCategoryService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, missionService.create(mission), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("send/{id}")
    public ResponseEntity sendMission(HttpServletRequest request, @RequestBody HashMap<String, Object> data, @PathVariable Long id) {
        LogUtil.getInstance().saveLog(request, data, logService);
        Patient patient = patientService.findById(id);
        HistoryMission historyMission = MissionMapping.getInstance().createHistory(data,
                historyMissionService,
                missionService,
                patientMissionService,
                patientGameService,
                mapService,
                patientService,
                positionService,
                rewardService,
                collectionService,
                patient);
        patient.setFrequency(PatientMapping.getInstance().increaseFrequency(patient.getFrequency()));
        if (patient.getHistoryMissions() != null) {
            List<HistoryMission> patientHistoryMissions = patient.getHistoryMissions();
            patientHistoryMissions.add(historyMissionService.create(historyMission));
            patient.setHistoryMissions(patientHistoryMissions);
        } else {
            List<HistoryMission> patientHistoryMissions = new ArrayList<>();
            patientHistoryMissions.add(historyMissionService.create(historyMission));
            patient.setHistoryMissions(patientHistoryMissions);
        }
        patientService.update(patient.getId(), patient);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, historyMission, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
