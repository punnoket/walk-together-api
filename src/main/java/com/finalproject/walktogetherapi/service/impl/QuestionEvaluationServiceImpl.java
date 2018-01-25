package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.repository.QuestionEvaluationRepository;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionEvaluationServiceImpl implements QuestionEvaluationService {
    private QuestionEvaluationRepository questionEvaluationRepository;

    @Autowired
    public QuestionEvaluationServiceImpl(QuestionEvaluationRepository questionEvaluationRepository) {
        this.questionEvaluationRepository = questionEvaluationRepository;
    }


    @Override
    public List<QuestionEvaluation> findAll() {
        return this.questionEvaluationRepository.findAll();
    }

    @Override
    public QuestionEvaluation findById(Long id) {
        return questionEvaluationRepository.findOne(id);
    }

    @Override
    public QuestionEvaluation create(QuestionEvaluation questionEvaluation) {
        return questionEvaluationRepository.saveAndFlush(questionEvaluation);
    }

    @Override
    public QuestionEvaluation update(Long id, QuestionEvaluation questionEvaluation) {
        return questionEvaluationRepository.saveAndFlush(questionEvaluation);
    }

    @Override
    public QuestionEvaluation delete(Long id) {
        QuestionEvaluation result = questionEvaluationRepository.findOne(id);
        questionEvaluationRepository.delete(id);
        return result;
    }

    @Override
    public List<QuestionEvaluation> findByEvaluationCategoryId(Long id) {
        return questionEvaluationRepository.findByNumberCategoryId(id);
    }
}
