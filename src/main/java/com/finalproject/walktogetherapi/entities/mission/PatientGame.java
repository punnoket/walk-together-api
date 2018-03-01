package com.finalproject.walktogetherapi.entities.mission;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "PatientGame")
public class PatientGame {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int resultScore;

    @ManyToOne
    private Map map;

    @OneToMany(mappedBy = "patientGame", cascade = {CascadeType.ALL})
    private List<PatientMission> patientMissionList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getResultScore() {
        return resultScore;
    }

    public void setResultScore(int resultScore) {
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
}
