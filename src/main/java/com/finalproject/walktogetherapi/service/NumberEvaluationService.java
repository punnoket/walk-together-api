package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.evaluation.NumberEvaluation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NumberEvaluationService {

    List<NumberEvaluation> findAll();

    NumberEvaluation findById(Long id);

    NumberEvaluation create(NumberEvaluation data);

    NumberEvaluation update(Long id, NumberEvaluation data);

    NumberEvaluation delete(Long id);

}
