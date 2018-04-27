package com.finalproject.walktogetherapi.service;

import com.finalproject.walktogetherapi.entities.Reward;
import com.finalproject.walktogetherapi.entities.Test;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RewardService {

    List<Reward> findAll();

    Reward findById(Long id);

    Reward create(Reward reward);

    Reward update(Long id, Reward reward);

    Reward delete(Long id);



}
