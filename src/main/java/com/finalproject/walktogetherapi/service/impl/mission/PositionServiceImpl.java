package com.finalproject.walktogetherapi.service.impl.mission;

import com.finalproject.walktogetherapi.entities.mission.Position;
import com.finalproject.walktogetherapi.repository.mission.PositionRepository;
import com.finalproject.walktogetherapi.service.mission.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {
    private PositionRepository repository;

    @Autowired
    public PositionServiceImpl(PositionRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<Position> findAll() {
        return repository.findAll();
    }

    @Override
    public Position findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public Position create(Position data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public Position update(Long id, Position data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public Position delete(Long id) {
        Position result = repository.findOne(id);
        repository.delete(id);
        return result;
    }

    @Override
    public List<Position> findByMapId(Long id) {
        return repository.findByMapId(id);
    }
}
