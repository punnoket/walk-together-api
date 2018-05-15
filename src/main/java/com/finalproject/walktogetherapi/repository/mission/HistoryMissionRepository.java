package com.finalproject.walktogetherapi.repository.mission;

import com.finalproject.walktogetherapi.entities.mission.CognitiveCategory;
import com.finalproject.walktogetherapi.entities.mission.HistoryMission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryMissionRepository extends JpaRepository<HistoryMission, Long> {
    @Query("select h from HistoryMission h where h.patient.id = ?1 order by h.historyDate desc ")
    List<HistoryMission> findHistoryMissionByIdPatient(Long id);
}
