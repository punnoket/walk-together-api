package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EvaluationTestRepository extends JpaRepository<EvaluationTest, Long> {
}
