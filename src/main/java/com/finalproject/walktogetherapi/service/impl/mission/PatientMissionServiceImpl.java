package com.finalproject.walktogetherapi.service.impl.mission;

import com.finalproject.walktogetherapi.entities.mission.PatientMission;
import com.finalproject.walktogetherapi.repository.mission.PatientMissionRepository;
import com.finalproject.walktogetherapi.service.mission.PatientMissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientMissionServiceImpl implements PatientMissionService {
    private PatientMissionRepository repository;

    @Autowired
    public PatientMissionServiceImpl(PatientMissionRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<PatientMission> findAll() {
        return this.repository.findAll();
    }

    @Override
    public PatientMission findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public PatientMission create(PatientMission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public PatientMission update(Long id, PatientMission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public PatientMission delete(Long id) {
        PatientMission result = repository.findOne(id);
        repository.delete(id);
        return result;
    }

}
