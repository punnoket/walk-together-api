package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.HistoryEvaluationTest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface HistoryEvaluationTestService {

    List<HistoryEvaluationTest> findAll();

    HistoryEvaluationTest findById(Long id);

    HistoryEvaluationTest create(HistoryEvaluationTest historyEvaluationTest);

    HistoryEvaluationTest update(Long id, HistoryEvaluationTest historyEvaluationTest);

    HistoryEvaluationTest delete(Long id);

    List<HistoryEvaluationTest> findByPatientId(Long id);

}
