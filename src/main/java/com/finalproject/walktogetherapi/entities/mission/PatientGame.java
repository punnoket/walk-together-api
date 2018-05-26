package com.finalproject.walktogetherapi.entities.mission;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "PatientGame")
public class PatientGame {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private double resultScore;

    @ManyToOne
    private Map map;

    @OneToMany(mappedBy = "patientGame", cascade = {CascadeType.ALL})
    private List<PatientMission> patientMissionList;

    @Column(columnDefinition = "TEXT")
    private String route;

    @Column(name="distance",columnDefinition = "int default 0")
    private int distance;
    private Long time;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getResultScore() {
        return resultScore;
    }

    public void setResultScore(double resultScore) {
        this.resultScore = resultScore;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public List<PatientMission> getPatientMissionList() {
        return patientMissionList;
    }

    public void setPatientMissionList(List<PatientMission> patientMissionList) {
        this.patientMissionList = patientMissionList;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }
}
