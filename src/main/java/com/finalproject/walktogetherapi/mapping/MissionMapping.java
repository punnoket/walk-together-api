package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.mission.*;
import com.finalproject.walktogetherapi.service.CollectionService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.RewardService;
import com.finalproject.walktogetherapi.service.mission.*;
import com.finalproject.walktogetherapi.util.Constant;
import com.finalproject.walktogetherapi.util.DateTimeManager;

import java.util.*;

import static java.lang.Math.round;

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

        List<Mission> box = missionService.findByType("BOX");
        List<Mission> typeGroup = missionService.findByType("TYPEGROUP");
        List<Mission> emotion = missionService.findByType("EMOTION");
        List<Mission> clock = missionService.findByType("CLOCK");
        List<Mission> proverb = missionService.findByType("PROVERB");
        List<Mission> resultMission = new ArrayList<>();


        Collections.shuffle(box);
        Collections.shuffle(typeGroup);
        Collections.shuffle(emotion);
        Collections.shuffle(clock);
        Collections.shuffle(proverb);

        resultMission.add(box.get(0));
        resultMission.add(typeGroup.get(0));
        resultMission.add(emotion.get(0));
        resultMission.add(clock.get(0));
        resultMission.add(proverb.get(0));

        Collections.shuffle(resultMission);

        missions = randomMission(missions);

        map = new HashMap<>();
        List<Position> positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_1)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", resultMission.get(0));
        response.add(map);

        map = new HashMap<>();
        positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_2)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", resultMission.get(1));
        response.add(map);

        map = new HashMap<>();
        positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_3)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", resultMission.get(2));
        response.add(map);

        map = new HashMap<>();
        positionTemp = new ArrayList<>();
        for (Position position : positions) {
            if (position.getPosition().equalsIgnoreCase(Constant.POSITION_4)) {
                positionTemp.add(position);
            }
        }
        map.put("position", randomPosition(positionTemp));
        map.put("missionDetail", resultMission.get(3));
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
                                        PatientService patientService,
                                        PositionService positionService,
                                        RewardService rewardService,
                                        CollectionService collectionService,
                                        Patient patient) {

        double resultScore = 0;
        HistoryMission historyMission = new HistoryMission();
        PatientGame patientGame = patientGameService.create(new PatientGame());
        List<PatientMission> patientMissions = new ArrayList<>();
        patientGame.setMap(mapService.findById(Long.parseLong(data.get("mapId").toString())));
        ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) data.get("mission");

        for (HashMap<String, Object> mission : list) {
            PatientMission patientMission = new PatientMission();
            patientMission.setMission(missionService.findById(Long.parseLong(mission.get("idMission").toString())));
            patientMission.setPosition(positionService.findById(Long.parseLong(mission.get("idPosition").toString())));
            patientMission.setScore(Double.parseDouble(mission.get("score").toString()));
            patientMission.setPatientGame(patientGame);
            patientMissions.add(patientMissionService.create(patientMission));
            resultScore += Double.parseDouble(mission.get("score").toString());
        }

        patientGame.setPatientMissionList(patientMissions);
        patientGame.setResultScore(resultScore);
        patientGame.setRoute(data.get("route").toString());
        patientGame.setDistance(Integer.parseInt(data.get("distance").toString()));
        patientGame.setTime(Long.parseLong(data.get("time").toString()));

        historyMission.setHistoryDate(DateTimeManager.getInstance().fullDateFormat(new Date()));
        historyMission.setPatientGame(patientGameService.update(patientGame.getId(), patientGame));
        historyMission.setPatient(patient);
        calculateLevel(patientService, resultScore, patient, rewardService, collectionService);
        return historyMissionService.create(historyMission);
    }

    private void calculateLevel(PatientService patientService, double score, Patient patient, RewardService rewardService, CollectionService collectionService) {
        int level = patient.getLevel();
        double oldExp = patient.getExp();
        long totalExp = nextLevel(level);
        double exp = (score * 0.05);
        exp = exp + oldExp;
        if (exp < totalExp) {
            patient.setLevelUp(false);
        } else if (exp > totalExp) {
            patient.setLevelUp(true);
            while (exp > totalExp) {
                exp = exp - totalExp;
                level = level + 1;
                totalExp = nextLevel(level);

            }
        } else {
            level = level + 1;
            exp = 0;
            patient.setLevelUp(true);
        }
        patient.setExpPercent((exp * 100) / totalExp);
        patient.setLevel(level);
        patient.setExp(exp);
        CollectionMapping.Companion.getInstance().unlockReward(collectionService, patient);
        patientService.update(patient.getId(), patient);
    }

    private long nextLevel(int level) {
        long nextExp = Math.round(0.04 * (Math.pow(level, 3)) + 0.8 * (Math.pow(level, 2)) + 2 * level);
        return nextExp;
    }

}
