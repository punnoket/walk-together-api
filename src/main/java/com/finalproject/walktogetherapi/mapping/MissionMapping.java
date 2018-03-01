package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.mission.Mission;
import com.finalproject.walktogetherapi.service.mission.CognitiveCategoryService;
import com.finalproject.walktogetherapi.service.mission.MapService;
import com.finalproject.walktogetherapi.service.mission.MissionService;

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
        missions = missions.subList(0, 3);
        return missions;
    }

    public Mission createMission(HashMap<String, Object> data, MapService mapService, CognitiveCategoryService cognitiveCategoryService) {
        Mission mission = new Mission();
        mission.setCognitiveCategory(cognitiveCategoryService.findById(Long.parseLong(data.get("idCognitiveCategory").toString())));
        mission.setMap(mapService.findById(Long.parseLong(data.get("idMap").toString())));
        mission.setLatitude(Double.parseDouble(data.get("latitude").toString()));
        mission.setLongitude(Double.parseDouble(data.get("longitude").toString()));
        mission.setScore(Integer.parseInt(data.get("score").toString()));
        return mission;
    }
}
