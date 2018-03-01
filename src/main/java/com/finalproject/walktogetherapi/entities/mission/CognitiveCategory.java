package com.finalproject.walktogetherapi.entities.mission;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "CognitiveCategory")
public class CognitiveCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String cognitiveCategoryName;

    @OneToMany(mappedBy = "cognitiveCategory", cascade = {CascadeType.ALL})
    private List<Mission> missions;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCognitiveCategoryName() {
        return cognitiveCategoryName;
    }

    public void setCognitiveCategoryName(String cognitiveCategoryName) {
        this.cognitiveCategoryName = cognitiveCategoryName;
    }

    @JsonIgnore
    public List<Mission> getMissions() {
        return missions;
    }

    public void setMissions(List<Mission> missions) {
        this.missions = missions;
    }
}
