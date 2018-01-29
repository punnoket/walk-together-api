package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationCategory;
import com.finalproject.walktogetherapi.entities.evaluation.ImageQuestionEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageQuestionEvaluationRepository extends JpaRepository<ImageQuestionEvaluation, Long> {
}
