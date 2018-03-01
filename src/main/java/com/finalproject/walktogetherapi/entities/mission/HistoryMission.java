package com.finalproject.walktogetherapi.entities.mission;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.finalproject.walktogetherapi.entities.Patient;

import javax.persistence.*;

@Entity
@Table(name = "HistoryMission")
public class HistoryMission {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int score;

    @ManyToOne
    @JoinColumn(name = "patient")
    private Patient patient;
    @ManyToOne
    private PatientGame patientGame;
    private String historyDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @JsonIgnore
    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public PatientGame getPatientGame() {
        return patientGame;
    }

    public void setPatientGame(PatientGame patientGame) {
        this.patientGame = patientGame;
    }

    public String getHistoryDate() {
        return historyDate;
    }

    public void setHistoryDate(String historyDate) {
        this.historyDate = historyDate;
    }
}
