package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.EvaluationTest;
import com.finalproject.walktogetherapi.entities.PatientTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EvaluationTestRepository extends JpaRepository<EvaluationTest, Long> {
}
