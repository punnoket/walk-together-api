package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.Log;
import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.repository.LogRepository;
import com.finalproject.walktogetherapi.repository.MatchingRepository;
import com.finalproject.walktogetherapi.service.LogService;
import com.finalproject.walktogetherapi.service.MatchingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {
    private LogRepository logRepository;

    @Autowired
    public LogServiceImpl(LogRepository logRepository) {
        this.logRepository = logRepository;
    }

    @Override
    public List<Log> findAll() {
        return this.logRepository.findAll();
    }

    @Override
    public Log create(Log log) {
        return logRepository.saveAndFlush(log);
    }

    @Override
    public List<Log> findLogLimit() {
        return logRepository.findLogLimit();
    }

    @Override
    public void delete() {
        logRepository.deleteAll();
    }
}
