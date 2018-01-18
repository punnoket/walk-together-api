package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.NumberEvaluation;
import com.finalproject.walktogetherapi.entities.QuestionEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NumberEvaluationRepository extends JpaRepository<NumberEvaluation, Long> {

}

