package com.finalproject.walktogetherapi.service.mission;
import com.finalproject.walktogetherapi.entities.mission.Position;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PositionService {

    List<Position> findAll();

    Position findById(Long id);

    Position create(Position data);

    Position update(Long id, Position data);

    Position delete(Long id);

    List<Position> findByMapId(Long id);
}
