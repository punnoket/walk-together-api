package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.repository.PatientRepository;
import com.finalproject.walktogetherapi.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientServiceImpl implements PatientService {
    private PatientRepository patientRepository;

    @Autowired
    public PatientServiceImpl(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    @Override
    public List<Patient> findAll() {
        return this.patientRepository.findAll();
    }

    @Override
    public Patient findById(Long id) {
        return patientRepository.findOne(id);
    }

    @Override
    public Patient create(Patient patient) {
        return patientRepository.saveAndFlush(patient);
    }

    @Override
    public Patient update(Long id, Patient patient) {
        return patientRepository.saveAndFlush(patient);
    }

    @Override
    public Patient delete(Long id) {
        Patient result = patientRepository.findOne(id);
        patientRepository.delete(id);
        return result;
    }

    @Override
    public Patient findByUserName(String userName) {
        return patientRepository.findByUserName(userName);
    }

    @Override
    public Patient findByEmail(String email) {
        return patientRepository.findByEmail(email);
    }

    @Override
    public Patient findByTell(String tell) {
        return patientRepository.findByTell(tell);
    }

}
