package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.EvaluationCategory;
import com.finalproject.walktogetherapi.repository.EvaluationCategoryRepository;
import com.finalproject.walktogetherapi.service.EvaluationCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EvaluationCategoryServiceImpl implements EvaluationCategoryService {
    private EvaluationCategoryRepository evaluationCategoryRepository;

    @Autowired
    public EvaluationCategoryServiceImpl(EvaluationCategoryRepository evaluationCategoryRepository) {
        this.evaluationCategoryRepository = evaluationCategoryRepository;
    }


    @Override
    public List<EvaluationCategory> findAll() {
        return this.evaluationCategoryRepository.findAll();
    }

    @Override
    public EvaluationCategory findById(Long id) {
        return evaluationCategoryRepository.findOne(id);
    }

    @Override
    public EvaluationCategory create(EvaluationCategory evaluationCategory) {
        return evaluationCategoryRepository.saveAndFlush(evaluationCategory);
    }

    @Override
    public EvaluationCategory update(Long id, EvaluationCategory evaluationCategory) {
        EvaluationCategory result = new EvaluationCategory();
        if (evaluationCategory.getEvaluationCategoryName() != null)
            result.setEvaluationCategoryName(evaluationCategory.getEvaluationCategoryName());
        return evaluationCategoryRepository.saveAndFlush(result);
    }

    @Override
    public EvaluationCategory delete(Long id) {
        EvaluationCategory result = evaluationCategoryRepository.findOne(id);
        evaluationCategoryRepository.delete(id);
        return result;
    }

    @Override
    public List<EvaluationCategory>  findAllByOrderByIdAsc() {
        return evaluationCategoryRepository.findAllByOrderByIdAsc();
    }
}
