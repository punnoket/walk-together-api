package com.finalproject.walktogetherapi.service.mission;

import com.finalproject.walktogetherapi.entities.mission.PatientMission;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PatientMissionService {

    List<PatientMission> findAll();

    PatientMission findById(Long id);

    PatientMission create(PatientMission data);

    PatientMission update(Long id, PatientMission data);

    PatientMission delete(Long id);
}
