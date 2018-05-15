package com.finalproject.walktogetherapi.service.impl.mission;

import com.finalproject.walktogetherapi.entities.mission.HistoryMission;
import com.finalproject.walktogetherapi.repository.mission.HistoryMissionRepository;
import com.finalproject.walktogetherapi.service.mission.HistoryMissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryMissionServiceImpl implements HistoryMissionService {
    private HistoryMissionRepository repository;

    @Autowired
    public HistoryMissionServiceImpl(HistoryMissionRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<HistoryMission> findAll() {
        return this.repository.findAll();
    }

    @Override
    public HistoryMission findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public HistoryMission create(HistoryMission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public HistoryMission update(Long id, HistoryMission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public HistoryMission delete(Long id) {
        HistoryMission result = repository.findOne(id);
        repository.delete(id);
        return result;
    }

    @Override
    public List<HistoryMission> findHistoryMissionByIdPatient(Long id) {
        return repository.findHistoryMissionByIdPatient(id);
    }

}
