package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.repository.MatchingRepository;
import com.finalproject.walktogetherapi.repository.PatientRepository;
import com.finalproject.walktogetherapi.service.MatchingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MatchingServiceImpl implements MatchingService {
    private MatchingRepository matchingRepository;

    @Autowired
    public MatchingServiceImpl(MatchingRepository matchingRepository) {
        this.matchingRepository = matchingRepository;
    }

    @Override
    public List<Matching> findAll() {
        return this.matchingRepository.findAll();
    }

    @Override
    public Matching findById(Long id) {
        return matchingRepository.findOne(id);
    }

    @Override
    public Matching create(Matching matching) {
        return matchingRepository.saveAndFlush(matching);
    }

    @Override
    public Matching update(Long id, Matching matching) {
        return matchingRepository.saveAndFlush(matching);
    }

    @Override
    public Matching delete(Long id) {
        Matching result = matchingRepository.findOne(id);
        matchingRepository.delete(id);
        return result;
    }

    @Override
    public List<Matching> findByPatientId(Long id) {
        return matchingRepository.findByPatientId(id);
    }

    @Override
    public List<Matching> findByCaretakerId(Long id) {
        return matchingRepository.findByCaretakerId(id);
    }

    @Override
    public Matching findByCaretakerIdAndPatientNumber(Long caretakerId, String patientNumber) {
        return matchingRepository.findByCaretakerIdAndPatientNumber(caretakerId, patientNumber);
    }

    @Override
    public Matching findByPatientIdAndCaretakerNumber(Long patientId, String caretakerNumber) {
        return matchingRepository.findByPatientIdAndCaretakerNumber(patientId, caretakerNumber);
    }

}
