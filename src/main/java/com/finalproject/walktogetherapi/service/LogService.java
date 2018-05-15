package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Log;
import com.finalproject.walktogetherapi.entities.Matching;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface LogService {

    List<Log> findAll();

    Log create(Log log);

    List<Log> findLogLimit();

    void delete();
}
