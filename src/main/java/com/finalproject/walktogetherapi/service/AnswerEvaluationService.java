package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.evaluation.AnswerEvaluation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AnswerEvaluationService {

    List<AnswerEvaluation> findAll();

    AnswerEvaluation findById(Long id);

    AnswerEvaluation create(AnswerEvaluation answerEvaluation);

    AnswerEvaluation update(Long id, AnswerEvaluation answerEvaluation);

    AnswerEvaluation delete(Long id);
}
