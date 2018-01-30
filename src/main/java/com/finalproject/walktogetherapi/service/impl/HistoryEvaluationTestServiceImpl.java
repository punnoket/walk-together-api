package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.HistoryEvaluationTest;
import com.finalproject.walktogetherapi.repository.HistoryEvaluationTestRepository;
import com.finalproject.walktogetherapi.service.HistoryEvaluationTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryEvaluationTestServiceImpl implements HistoryEvaluationTestService {
    private HistoryEvaluationTestRepository historyEvaluationTestRepository;

    @Autowired
    public HistoryEvaluationTestServiceImpl(HistoryEvaluationTestRepository historyEvaluationTestRepository) {
        this.historyEvaluationTestRepository = historyEvaluationTestRepository;
    }

    @Override
    public List<HistoryEvaluationTest> findAll() {
        return this.historyEvaluationTestRepository.findAll();
    }

    @Override
    public HistoryEvaluationTest findById(Long id) {
        return historyEvaluationTestRepository.findOne(id);
    }

    @Override
    public HistoryEvaluationTest create(HistoryEvaluationTest historyEvaluationTest) {
        return historyEvaluationTestRepository.saveAndFlush(historyEvaluationTest);
    }

    @Override
    public HistoryEvaluationTest update(Long id, HistoryEvaluationTest historyEvaluationTest) {
        return historyEvaluationTestRepository.saveAndFlush(historyEvaluationTest);
    }

    @Override
    public HistoryEvaluationTest delete(Long id) {
        HistoryEvaluationTest result = historyEvaluationTestRepository.findOne(id);
        historyEvaluationTestRepository.delete(id);
        return result;
    }

    @Override
    public List<HistoryEvaluationTest> findByPatientId(Long id) {
       return historyEvaluationTestRepository.findByPatientId(id);
    }
}
