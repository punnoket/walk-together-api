package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.mission.HistoryMission;
import com.finalproject.walktogetherapi.entities.mission.Mission;
import com.finalproject.walktogetherapi.entities.mission.PatientGame;
import com.finalproject.walktogetherapi.entities.mission.PatientMission;
import com.finalproject.walktogetherapi.service.mission.*;
import com.finalproject.walktogetherapi.util.DateTimeManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

public class MissionMapping {

    private static MissionMapping instance;

    public static MissionMapping getInstance() {
        if (instance == null) {
            instance = new MissionMapping();
        }
        return instance;
    }

    public List<Mission> getMissionByIdMap(Long id, MissionService missionService) {
        List<Mission> missions = missionService.findByMapId(id);
        Collections.shuffle(missions);
        missions = missions.subList(0, 4);
        return missions;
    }

    public Mission createMission(HashMap<String, Object> data, MapService mapService, CognitiveCategoryService cognitiveCategoryService) {
        Mission mission = new Mission();
        mission.setCognitiveCategory(cognitiveCategoryService.findById(Long.parseLong(data.get("idCognitiveCategory").toString())));
        mission.setMap(mapService.findById(Long.parseLong(data.get("idMap").toString())));
        mission.setLatitude(Double.parseDouble(data.get("latitude").toString()));
        mission.setLongitude(Double.parseDouble(data.get("longitude").toString()));
        mission.setScore(Integer.parseInt(data.get("score").toString()));
        mission.setType(data.get("type").toString());
        return mission;
    }

    public HistoryMission createHistory(HashMap<String, Object> data,
                                        HistoryMissionService historyMissionService,
                                        MissionService missionService,
                                        PatientMissionService patientMissionService,
                                        PatientGameService patientGameService,
                                        MapService mapService,
                                        Patient patient) {

        int resultScore = 0;
        HistoryMission historyMission = new HistoryMission();
        PatientGame patientGame = patientGameService.create(new PatientGame());
        List<PatientMission> patientMissions = new ArrayList<>();
        patientGame.setMap(mapService.findById(Long.parseLong(data.get("mapId").toString())));
        ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) data.get("mission");

        for (HashMap<String, Object> mission : list) {
            PatientMission patientMission = new PatientMission();
            patientMission.setMission(missionService.findById(Long.parseLong(mission.get("id").toString())));
            patientMission.setScore(Integer.parseInt(mission.get("score").toString()));
            patientMission.setPatientGame(patientGame);
            patientMissions.add(patientMissionService.create(patientMission));
            resultScore += Integer.parseInt(mission.get("score").toString());
        }
        patientGame.setPatientMissionList(patientMissions);
        patientGame.setResultScore(resultScore);
        patientGame.setRoute(data.get("route").toString());

        historyMission.setHistoryDate(DateTimeManager.getInstance().fullDateFormat(DateTimeManager.getInstance().getCurrentTime()));
        historyMission.setPatientGame(patientGameService.update(patientGame.getId(), patientGame));
        historyMission.setPatient(patient);
        return historyMissionService.create(historyMission);
    }
}
