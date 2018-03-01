package com.finalproject.walktogetherapi.service.mission;
import com.finalproject.walktogetherapi.entities.mission.Map;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MapService {

    List<Map> findAll();

    Map findById(Long id);

    Map create(Map data);

    Map update(Long id, Map data);

    Map delete(Long id);
}
