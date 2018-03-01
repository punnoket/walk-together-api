package com.finalproject.walktogetherapi.service.impl.mission;

import com.finalproject.walktogetherapi.entities.mission.PatientGame;
import com.finalproject.walktogetherapi.repository.mission.PatientGameRepository;
import com.finalproject.walktogetherapi.service.mission.PatientGameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientGameServiceImpl implements PatientGameService {
    private PatientGameRepository repository;

    @Autowired
    public PatientGameServiceImpl(PatientGameRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<PatientGame> findAll() {
        return this.repository.findAll();
    }

    @Override
    public PatientGame findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public PatientGame create(PatientGame data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public PatientGame update(Long id, PatientGame data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public PatientGame delete(Long id) {
        PatientGame result = repository.findOne(id);
        repository.delete(id);
        return result;
    }

}
