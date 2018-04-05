package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.evaluation.PatientTest;
import com.finalproject.walktogetherapi.repository.PatientTestRepository;
import com.finalproject.walktogetherapi.service.PatientTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientTestServiceImpl implements PatientTestService {
    private PatientTestRepository patientTestRepository;

    @Autowired
    public PatientTestServiceImpl(PatientTestRepository patientTestRepository) {
        this.patientTestRepository = patientTestRepository;
    }

    @Override
    public List<PatientTest> findAll() {
        return this.patientTestRepository.findAll();
    }

    @Override
    public PatientTest findById(Long id) {
        return patientTestRepository.findOne(id);
    }

    @Override
    public PatientTest create(PatientTest patient) {
        return patientTestRepository.saveAndFlush(patient);
    }

    @Override
    public PatientTest update(Long id, PatientTest patient) {
        return patientTestRepository.saveAndFlush(patient);
    }

    @Override
    public PatientTest delete(Long id) {
        PatientTest result = patientTestRepository.findOne(id);
        patientTestRepository.delete(id);
        return result;
    }
}
