package com.finalproject.walktogetherapi.service.impl.mission;

import com.finalproject.walktogetherapi.entities.mission.Map;
import com.finalproject.walktogetherapi.repository.mission.MapRepository;
import com.finalproject.walktogetherapi.service.mission.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MapServiceImpl implements MapService {
    private MapRepository repository;

    @Autowired
    public MapServiceImpl(MapRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<Map> findAll() {
        return this.repository.findAll();
    }

    @Override
    public Map findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public Map create(Map data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public Map update(Long id, Map data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public Map delete(Long id) {
        Map result = repository.findOne(id);
        repository.delete(id);
        return result;
    }

}
