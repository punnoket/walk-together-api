package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.evaluation.ImageQuestionEvaluation;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ImageQuestionEvaluationService {

    List<ImageQuestionEvaluation> findAll();

    ImageQuestionEvaluation findById(Long id);

    ImageQuestionEvaluation create(ImageQuestionEvaluation imageQuestionEvaluation);

    ImageQuestionEvaluation update(Long id, ImageQuestionEvaluation imageQuestionEvaluation);

    ImageQuestionEvaluation delete(Long id);
}
