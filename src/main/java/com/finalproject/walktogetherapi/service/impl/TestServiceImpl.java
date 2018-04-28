package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.Test;
import com.finalproject.walktogetherapi.repository.TestRepository;
import com.finalproject.walktogetherapi.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl implements TestService {
    private TestRepository testRepository;

    @Autowired
    public TestServiceImpl(TestRepository testRepository) {
        this.testRepository = testRepository;
    }

    @Override
    public List<Test> findAll() {
        return testRepository.findAll();
    }

    @Override
    public Test findById(Long id) {
        return testRepository.findOne(id);
    }

    @Override
    public Test create(Test data) {
        return testRepository.saveAndFlush(data);
    }

    @Override
    public Test update(Long id, Test data) {
        return testRepository.saveAndFlush(data);
    }

    @Override
    public Test delete(Long id) {
        Test result = testRepository.findOne(id);
        testRepository.delete(id);
        return result;
    }

    @Override
    public List<Test> findByUsername(String username) {
        return testRepository.findByUsername(username);
    }
}
