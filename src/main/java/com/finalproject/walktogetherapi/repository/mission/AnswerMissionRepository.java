package com.finalproject.walktogetherapi.repository.mission;

import com.finalproject.walktogetherapi.entities.mission.AnswerMission;
import com.finalproject.walktogetherapi.entities.mission.Mission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnswerMissionRepository extends JpaRepository<AnswerMission, Long> {
    @Query("select am from AnswerMission am where am.mission.type = ?1 and am.answer != ?2")
    List<AnswerMission> findByMissionType(String type, String answer);
}
