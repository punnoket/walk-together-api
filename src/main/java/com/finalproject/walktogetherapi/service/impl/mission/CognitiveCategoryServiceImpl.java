package com.finalproject.walktogetherapi.service.impl.mission;
import com.finalproject.walktogetherapi.entities.mission.CognitiveCategory;
import com.finalproject.walktogetherapi.repository.mission.CognitiveCategoryRepository;
import com.finalproject.walktogetherapi.service.mission.CognitiveCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CognitiveCategoryServiceImpl implements CognitiveCategoryService {
    private CognitiveCategoryRepository repository;

    @Autowired
    public CognitiveCategoryServiceImpl(CognitiveCategoryRepository repository) {
        this.repository = repository;
    }


    @Override
    public List<CognitiveCategory> findAll() {
        return this.repository.findAll();
    }

    @Override
    public CognitiveCategory findById(Long id) {
        return repository.findOne(id);
    }

    @Override
    public CognitiveCategory create(CognitiveCategory data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public CognitiveCategory update(Long id, CognitiveCategory data) {
        return repository.saveAndFlush(data);
    }

    @Override
    public CognitiveCategory delete(Long id) {
        CognitiveCategory result = repository.findOne(id);
        repository.delete(id);
        return result;
    }

}
