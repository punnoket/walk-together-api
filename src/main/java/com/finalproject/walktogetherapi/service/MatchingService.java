package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.entities.Patient;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MatchingService {

    List<Matching> findAll();

    Matching findById(Long id);

    Matching create(Matching matching);

    Matching update(Long id, Matching matching);

    Matching delete(Long id);

    List<Matching> findByPatientNumber(String patientNumber);

    List<Matching> findByCaretakerNumber(String caretakerNumber);
}
