package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.EvaluationTest;
import com.finalproject.walktogetherapi.entities.PatientTest;
import com.finalproject.walktogetherapi.repository.EvaluationTestRepository;
import com.finalproject.walktogetherapi.repository.PatientTestRepository;
import com.finalproject.walktogetherapi.service.EvaluationTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluationTestServiceImpl implements EvaluationTestService {
    private EvaluationTestRepository evaluationTestRepository;

    @Autowired
    public EvaluationTestServiceImpl(EvaluationTestRepository evaluationTestRepository) {
        this.evaluationTestRepository = evaluationTestRepository;
    }

    @Override
    public List<EvaluationTest> findAll() {
        return this.evaluationTestRepository.findAll();
    }

    @Override
    public EvaluationTest findById(Long id) {
        return evaluationTestRepository.findOne(id);
    }

    @Override
    public EvaluationTest create(EvaluationTest evaluationTest) {
        return evaluationTestRepository.saveAndFlush(evaluationTest);
    }

    @Override
    public EvaluationTest update(Long id, EvaluationTest evaluationTest) {
        return evaluationTestRepository.saveAndFlush(evaluationTest);
    }

    @Override
    public EvaluationTest delete(Long id) {
        EvaluationTest result = evaluationTestRepository.findOne(id);
        evaluationTestRepository.delete(id);
        return result;
    }
}
