package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.evaluation.AnswerEvaluation;
import com.finalproject.walktogetherapi.repository.AnswerEvaluationRepository;
import com.finalproject.walktogetherapi.service.AnswerEvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerEvaluationServiceImpl implements AnswerEvaluationService {
    private AnswerEvaluationRepository answerEvaluationRepository;

    @Autowired
    public AnswerEvaluationServiceImpl(AnswerEvaluationRepository answerEvaluationRepository) {
        this.answerEvaluationRepository = answerEvaluationRepository;
    }


    @Override
    public List<AnswerEvaluation> findAll() {
        return this.answerEvaluationRepository.findAll();
    }

    @Override
    public AnswerEvaluation findById(Long id) {
        return answerEvaluationRepository.findOne(id);
    }

    @Override
    public AnswerEvaluation create(AnswerEvaluation answerEvaluation) {
        return answerEvaluationRepository.saveAndFlush(answerEvaluation);
    }

    @Override
    public AnswerEvaluation update(Long id, AnswerEvaluation evaluationCategory) {
        return answerEvaluationRepository.saveAndFlush(evaluationCategory);
    }

    @Override
    public AnswerEvaluation delete(Long id) {
        AnswerEvaluation result = answerEvaluationRepository.findOne(id);
        answerEvaluationRepository.delete(id);
        return result;
    }
}
