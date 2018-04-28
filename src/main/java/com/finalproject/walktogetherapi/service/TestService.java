package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Test;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TestService {

    List<Test> findAll();

    Test findById(Long id);

    Test create(Test test);

    Test update(Long id, Test test);

    Test delete(Long id);

    List<Test> findByUsername(String username);

}
