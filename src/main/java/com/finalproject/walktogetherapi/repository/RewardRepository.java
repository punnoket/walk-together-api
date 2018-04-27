package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Reward;
import com.finalproject.walktogetherapi.entities.Test;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RewardRepository extends JpaRepository<Reward, Long> {

}
