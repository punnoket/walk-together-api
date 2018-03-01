package com.finalproject.walktogetherapi.repository.mission;

import com.finalproject.walktogetherapi.entities.mission.CognitiveCategory;
import com.finalproject.walktogetherapi.entities.mission.HistoryMission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HistoryMissionRepository extends JpaRepository<HistoryMission, Long> {
}
