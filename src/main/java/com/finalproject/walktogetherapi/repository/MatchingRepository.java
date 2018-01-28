package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.entities.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MatchingRepository extends JpaRepository<Matching, Long> {

    @Query("select m from Matching m WHERE  m.patient.patientNumber = ?1")
    List<Matching> findByPatientNumber(String patientNumber);

    @Query("select m from Matching m WHERE  m.caretaker.caretakerNumber = ?1")
    List<Matching> findByCaretakerNumber(String caretakerNumber);
}
