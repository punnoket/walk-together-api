package com.finalproject.walktogetherapi.service.mission;
import com.finalproject.walktogetherapi.entities.mission.Mission;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MissionService {

    List<Mission> findAll();

    Mission findById(Long id);

    Mission create(Mission data);

    Mission update(Long id, Mission mission);

    Mission delete(Long id);
}
