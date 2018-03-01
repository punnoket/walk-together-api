package com.finalproject.walktogetherapi.service.mission;

import com.finalproject.walktogetherapi.entities.mission.HistoryMission;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HistoryMissionService {

    List<HistoryMission> findAll();

    HistoryMission findById(Long id);

    HistoryMission create(HistoryMission data);

    HistoryMission update(Long id, HistoryMission data);

    HistoryMission delete(Long id);
}
