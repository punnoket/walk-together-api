package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.HistoryEvaluationTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryEvaluationTestRepository extends JpaRepository<HistoryEvaluationTest, Long> {

    @Query("select hp from HistoryEvaluationTest hp where hp.patient.id = ?1")
    List<HistoryEvaluationTest> findByPatientId(Long id);
}
