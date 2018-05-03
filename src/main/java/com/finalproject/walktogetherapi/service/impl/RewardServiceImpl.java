package com.finalproject.walktogetherapi.service.impl;

import com.finalproject.walktogetherapi.entities.Reward;
import com.finalproject.walktogetherapi.repository.RewardRepository;
import com.finalproject.walktogetherapi.service.RewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RewardServiceImpl implements RewardService {
    private RewardRepository rewardRepository;

    @Autowired
    public RewardServiceImpl(RewardRepository rewardRepository) {
        this.rewardRepository = rewardRepository;
    }

    @Override
    public List<Reward> findAll() {
        return rewardRepository.findAll();
    }

    @Override
    public Reward findById(Long id) {
        return rewardRepository.findOne(id);
    }

    @Override
    public Reward create(Reward reward) {
        return rewardRepository.saveAndFlush(reward);
    }

    @Override
    public Reward update(Long id, Reward reward) {
        return rewardRepository.saveAndFlush(reward);
    }

    @Override
    public Reward delete(Long id) {
        Reward result = rewardRepository.findOne(id);
        rewardRepository.delete(id);
        return result;
    }

    @Override
    public List<Reward> findByLevel(int level) {
        return rewardRepository.findByLevel(level);
    }
}
