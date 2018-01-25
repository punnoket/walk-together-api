package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.evaluation.AnswerEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnswerEvaluationRepository extends JpaRepository<AnswerEvaluation, Long> {
}
