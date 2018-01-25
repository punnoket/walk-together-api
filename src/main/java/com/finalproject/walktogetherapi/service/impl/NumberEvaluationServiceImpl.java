package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.evaluation.NumberEvaluation;
import com.finalproject.walktogetherapi.repository.NumberEvaluationRepository;
import com.finalproject.walktogetherapi.service.NumberEvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NumberEvaluationServiceImpl implements NumberEvaluationService {
    private NumberEvaluationRepository numberEvaluationRepository;

    @Autowired
    public NumberEvaluationServiceImpl(NumberEvaluationRepository numberEvaluationRepository) {
        this.numberEvaluationRepository = numberEvaluationRepository;
    }


    @Override
    public List<NumberEvaluation> findAll() {
        return this.numberEvaluationRepository.findAll();
    }

    @Override
    public NumberEvaluation findById(Long id) {
        return numberEvaluationRepository.findOne(id);
    }

    @Override
    public NumberEvaluation create(NumberEvaluation questionEvaluation) {
        return numberEvaluationRepository.saveAndFlush(questionEvaluation);
    }

    @Override
    public NumberEvaluation update(Long id, NumberEvaluation data) {
        return numberEvaluationRepository.saveAndFlush(data);
    }

    @Override
    public NumberEvaluation delete(Long id) {
        NumberEvaluation result = numberEvaluationRepository.findOne(id);
        numberEvaluationRepository.delete(id);
        return result;
    }

}
