package com.finalproject.walktogetherapi.entities.mission;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "PatientMission")
public class PatientMission {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int score;

    @ManyToOne
    private Mission mission;

    @ManyToOne
    private Position position;

    @ManyToOne
    @JoinColumn(name = "patientGame")
    private PatientGame patientGame;

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

    public Mission getMission() {
        return mission;
    }

    public void setMission(Mission mission) {
        this.mission = mission;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    @JsonIgnore
    public PatientGame getPatientGame() {
        return patientGame;
    }

    public void setPatientGame(PatientGame patientGame) {
        this.patientGame = patientGame;
    }
}
