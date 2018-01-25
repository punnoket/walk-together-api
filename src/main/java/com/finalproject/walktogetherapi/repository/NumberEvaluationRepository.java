package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.evaluation.NumberEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NumberEvaluationRepository extends JpaRepository<NumberEvaluation, Long> {

}

