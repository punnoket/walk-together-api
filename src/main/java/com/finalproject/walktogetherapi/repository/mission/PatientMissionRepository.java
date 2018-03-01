package com.finalproject.walktogetherapi.repository.mission;

import com.finalproject.walktogetherapi.entities.mission.Mission;
import com.finalproject.walktogetherapi.entities.mission.PatientMission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientMissionRepository extends JpaRepository<PatientMission, Long> {
}
