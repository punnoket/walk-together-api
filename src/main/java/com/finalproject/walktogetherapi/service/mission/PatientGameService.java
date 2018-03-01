package com.finalproject.walktogetherapi.service.mission;

import com.finalproject.walktogetherapi.entities.mission.PatientGame;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public interface PatientGameService {

    List<PatientGame> findAll();

    PatientGame findById(Long id);

    PatientGame create(PatientGame data);

    PatientGame update(Long id, PatientGame data);

    PatientGame delete(Long id);
}
