package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Log;
import com.finalproject.walktogetherapi.entities.Matching;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogRepository extends JpaRepository<Log, Long> {

    @Query("select l from Log l order by l.date desc")
    List<Log> findLogLimit();
}
