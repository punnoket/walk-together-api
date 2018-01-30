package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.EvaluationTest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface EvaluationTestService {

    List<EvaluationTest> findAll();

    EvaluationTest findById(Long id);

    EvaluationTest create(EvaluationTest evaluationTest);

    EvaluationTest update(Long id, EvaluationTest evaluationTest);

    EvaluationTest delete(Long id);

}
