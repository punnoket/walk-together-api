package com.finalproject.walktogetherapi.entities.evaluation;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "EvaluationTest")
public class EvaluationTest {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToMany(mappedBy = "evaluationTest", cascade = {CascadeType.ALL})
    private List<PatientTest> patientTests;
    private Date testDate;
    private String resultScore;
    private String frequencyPatient;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<PatientTest> getPatientTests() {
        return patientTests;
    }

    public void setPatientTests(List<PatientTest> patientTests) {
        this.patientTests = patientTests;
    }

    public Date getTestDate() {
        return testDate;
    }

    public void setTestDate(Date testDate) {
        this.testDate = testDate;
    }

    public String getResultScore() {
        return resultScore;
    }

    public void setResultScore(String resultScore) {
        this.resultScore = resultScore;
    }

    public void setFrequencyPatient(String frequencyPatient) {
        this.frequencyPatient = frequencyPatient;
    }

    public String getFrequencyPatient() {
        return frequencyPatient;
    }
}
