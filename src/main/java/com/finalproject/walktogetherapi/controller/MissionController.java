package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Log;
import com.finalproject.walktogetherapi.entities.mission.Mission;
import com.finalproject.walktogetherapi.mapping.MissionMapping;
import com.finalproject.walktogetherapi.service.LogService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.mission.*;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

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

    @Autowired
    public MissionController(MissionService missionService,
                             CognitiveCategoryService cognitiveCategoryService,
                             HistoryMissionService historyMissionService,
                             PatientService patientService,
                             MapService mapService,
                             LogService logService,
                             PatientGameService patientGameService,
                             PatientMissionService patientMissionService) {
        this.missionService = missionService;
        this.cognitiveCategoryService = cognitiveCategoryService;
        this.historyMissionService = historyMissionService;
        this.patientService = patientService;
        this.mapService = mapService;
        this.patientGameService = patientGameService;
        this.patientMissionService = patientMissionService;
        this.logService = logService;
    }

    @GetMapping("/all-map")
    public ResponseEntity getAllMap() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, mapService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("/history-by-id/{id}")
    public ResponseEntity getHistoryMission(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.findById(id).getHistoryMissions(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity getMission(HttpServletRequest request, @PathVariable Long id) {
        LogUtil.getInstance().saveLog(request, "", logService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, MissionMapping.getInstance().getMissionByIdMap(id, missionService), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(HttpServletRequest request, @RequestBody HashMap<String, Object> data) {
        LogUtil.getInstance().saveLog(request, data.toString(), logService);
        Mission mission = MissionMapping.getInstance().createMission(data, mapService, cognitiveCategoryService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, missionService.create(mission), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
