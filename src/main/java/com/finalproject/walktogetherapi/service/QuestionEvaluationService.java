package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionEvaluationService {

    List<QuestionEvaluation> findAll();

    QuestionEvaluation findById(Long id);

    QuestionEvaluation create(QuestionEvaluation questionEvaluation);

    QuestionEvaluation update(Long id, QuestionEvaluation questionEvaluation);

    QuestionEvaluation delete(Long id);

    List<QuestionEvaluation> findByEvaluationCategoryId(Long id);

}
