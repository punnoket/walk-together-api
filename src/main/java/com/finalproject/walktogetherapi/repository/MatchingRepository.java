package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.entities.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MatchingRepository extends JpaRepository<Matching, Long> {

    @Query("select m from Matching m WHERE  m.patient.id = ?1")
    List<Matching> findByPatientId(Long id);

    @Query("select m from Matching m WHERE  m.caretaker.id = ?1")
    List<Matching> findByCaretakerId(Long id);

    @Query("select m from Matching m WHERE  m.caretaker.id = ?1 AND m.patient.patientNumber = ?2")
    Matching findByCaretakerIdAndPatientNumber(Long caretakerId, String patientNumber);

    @Query("select m from Matching m WHERE  m.patient.id = ?1 AND m.caretaker.caretakerNumber = ?2")
    Matching findByPatientIdAndCaretakerNumber(Long patientId, String caretakerNumber);

}
