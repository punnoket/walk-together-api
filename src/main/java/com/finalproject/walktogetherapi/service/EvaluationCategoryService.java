package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationCategory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface EvaluationCategoryService {

    List<EvaluationCategory> findAll();

    EvaluationCategory findById(Long id);

    EvaluationCategory create(EvaluationCategory evaluationCategory);

    EvaluationCategory update(Long id, EvaluationCategory evaluationCategory);

    EvaluationCategory delete(Long id);

    List<EvaluationCategory> findAllByOrderByIdAsc();
}
