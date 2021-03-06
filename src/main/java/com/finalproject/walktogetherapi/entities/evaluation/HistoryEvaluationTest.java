package com.finalproject.walktogetherapi.entities.evaluation;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.finalproject.walktogetherapi.entities.Patient;

import javax.persistence.*;

@Entity
@Table(name = "HistoryEvaluationTest")
public class HistoryEvaluationTest {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "patient")
    private Patient patient;

    @ManyToOne
    private EvaluationTest evaluationTest;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @JsonIgnore
    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public EvaluationTest getEvaluationTest() {
        return evaluationTest;
    }

    public void setEvaluationTest(EvaluationTest evaluationTest) {
        this.evaluationTest = evaluationTest;
    }
}
