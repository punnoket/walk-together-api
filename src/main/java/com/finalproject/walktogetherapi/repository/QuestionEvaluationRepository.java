package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionEvaluationRepository extends JpaRepository<QuestionEvaluation, Long> {

    @Query("select q from QuestionEvaluation q where q.numberEvaluation.id = ?1")
    List<QuestionEvaluation> findByNumberCategoryId(Long id);
}
