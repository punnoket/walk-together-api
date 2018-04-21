package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.mission.*;
import com.finalproject.walktogetherapi.service.mission.*;
import com.finalproject.walktogetherapi.util.Constant;
import com.finalproject.walktogetherapi.util.DateTimeManager;

import java.util.*;

public class MissionMapping {

    private static MissionMapping instance;

    public static MissionMapping getInstance() {
        if (instance == null) {
            instance = new MissionMapping();
        }
        return instance;
    }

    private Position randomPosition(List<Position> positions) {
        int random = new Random().nextInt(positions.size());
        return positions.get(random);
    }

    private List<Mission> randomMission(List<Mission> missions) {
        Collections.shuffle(missions);
        missions = missions.subList(0, 4);
        return missions;
    }

    public List<HashMap<String, Object>> getMissionByIdMap(Long id, MissionService missionService, PositionService positionService) {
        List<HashMap<String, Object>> response = new ArrayList<>();
        List<Position> positions = positionService.findByMapId(id);
        HashMap<String, Object> map;
        List<Mission> missions = missionService.findAll();
        missions = randomMission(missions);

        map = new HashMap<>();
        List<Position> positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_1)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", missions.get(0));
        response.add(map);

        map = new HashMap<>();
        positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_2)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", missions.get(1));
        response.add(map);

        map = new HashMap<>();
        positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_3)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", missions.get(2));
        response.add(map);

        map = new HashMap<>();
        positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_4)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", missions.get(3));
        response.add(map);

        return response;
    }


    public Mission createMission(HashMap<String, Object> data, CognitiveCategoryService cognitiveCategoryService) {
        Mission mission = new Mission();
        mission.setCognitiveCategory(cognitiveCategoryService.findById(Long.parseLong(data.get("idCognitiveCategory").toString())));
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
                                        PositionService positionService,
                                        Patient patient) {

        int resultScore = 0;
        HistoryMission historyMission = new HistoryMission();
        PatientGame patientGame = patientGameService.create(new PatientGame());
        List<PatientMission> patientMissions = new ArrayList<>();
        patientGame.setMap(mapService.findById(Long.parseLong(data.get("mapId").toString())));
        ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) data.get("mission");

        for (HashMap<String, Object> mission : list) {
            PatientMission patientMission = new PatientMission();
            patientMission.setMission(missionService.findById(Long.parseLong(mission.get("idMission").toString())));
            patientMission.setPosition(positionService.findById(Long.parseLong(mission.get("idPosition").toString())));
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
