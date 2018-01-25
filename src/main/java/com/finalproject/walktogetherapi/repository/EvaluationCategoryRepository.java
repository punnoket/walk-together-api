package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EvaluationCategoryRepository extends JpaRepository<EvaluationCategory, Long> {
    List<EvaluationCategory> findAllByOrderByIdAsc();
}
