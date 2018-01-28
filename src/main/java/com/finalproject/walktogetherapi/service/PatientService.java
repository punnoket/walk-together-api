package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PatientService {

    List<Patient> findAll();

    Patient findById(Long id);

    Patient create(Patient patient);

    Patient update(Long id, Patient patient);

    Patient delete(Long id);

    Patient findByUserName(String userName);

    Patient findByEmail(String email);

    Patient findByTell(String tell);
}
