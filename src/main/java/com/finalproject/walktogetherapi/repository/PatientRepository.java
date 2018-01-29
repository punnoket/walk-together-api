package com.finalproject.walktogetherapi.repository;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
    @Query("select p from Patient p where p.userName = ?1")
    Patient findByUserName(String username);

    @Query("select p from Patient p where p.email = ?1")
    Patient findByEmail(String email);

    @Query("select p from Patient p where p.tell = ?1")
    Patient findByTell(String tell);

    @Query("select p from Patient p where p.patientNumber = ?1")
    Patient findByNumberPatient(String number);
}
