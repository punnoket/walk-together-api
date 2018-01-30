package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.PatientTest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PatientTestService {

    List<PatientTest> findAll();

    PatientTest findById(Long id);

    PatientTest create(PatientTest patientTest);

    PatientTest update(Long id, PatientTest patientTest);

    PatientTest delete(Long id);

}
