package com.finalproject.walktogetherapi.service.impl.mission;

import com.finalproject.walktogetherapi.entities.mission.AnswerMission;
import com.finalproject.walktogetherapi.repository.mission.AnswerMissionRepository;
import com.finalproject.walktogetherapi.service.mission.AnswerMissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerMissionServiceImpl implements AnswerMissionService {
    private AnswerMissionRepository repository;

    @Autowired
    public AnswerMissionServiceImpl(AnswerMissionRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<AnswerMission> findAll() {
        return this.repository.findAll();
    }

    @Override
    public List<AnswerMission> findByMissionType(String type, String answer) {
        return repository.findByMissionType(type, answer);
    }

    @Override
    public AnswerMission findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public AnswerMission create(AnswerMission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public AnswerMission update(Long id, AnswerMission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public AnswerMission delete(Long id) {
        AnswerMission result = repository.findOne(id);
        repository.delete(id);
        return result;
    }
}
