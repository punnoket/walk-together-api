package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Test;
import com.finalproject.walktogetherapi.entities.evaluation.HistoryEvaluationTest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestRepository extends JpaRepository<Test, Long> {

    @Query("select t from Test t where t.username = ?1")
    List<Test> findByUsername(String username);
}
