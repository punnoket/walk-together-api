package com.finalproject.walktogetherapi.service.impl.mission;

import com.finalproject.walktogetherapi.entities.mission.Mission;
import com.finalproject.walktogetherapi.repository.mission.MissionRepository;
import com.finalproject.walktogetherapi.service.mission.MissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MissionServiceImpl implements MissionService {
    private MissionRepository repository;

    @Autowired
    public MissionServiceImpl(MissionRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<Mission> findAll() {
        return this.repository.findAll();
    }

    @Override
    public Mission findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public Mission create(Mission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public Mission update(Long id, Mission data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public Mission delete(Long id) {
        Mission result = repository.findOne(id);
        repository.delete(id);
        return result;
    }

    @Override
    public List<Mission> findByType(String type) {
        return repository.findByType(type);
    }

}
