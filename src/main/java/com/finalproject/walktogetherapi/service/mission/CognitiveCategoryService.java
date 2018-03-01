package com.finalproject.walktogetherapi.service.mission;

import com.finalproject.walktogetherapi.entities.mission.CognitiveCategory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CognitiveCategoryService {

    List<CognitiveCategory> findAll();

    CognitiveCategory findById(Long id);

    CognitiveCategory create(CognitiveCategory data);

    CognitiveCategory update(Long id, CognitiveCategory data);

    CognitiveCategory delete(Long id);
}
