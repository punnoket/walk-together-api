package com.finalproject.walktogetherapi.entities.mission;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Map")
public class Map {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private double latitude;
    private double longitude;
    private String namePlace;
    private String image;

    @OneToMany(mappedBy = "map", cascade = {CascadeType.ALL})
    private List<Mission> missions;

    @OneToMany(mappedBy = "map", cascade = {CascadeType.ALL})
    private List<Position> positions;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getNamePlace() {
        return namePlace;
    }

    public void setNamePlace(String namePlace) {
        this.namePlace = namePlace;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @JsonIgnore
    public List<Mission> getMissions() {
        return missions;
    }

    public void setMissions(List<Mission> missions) {
        this.missions = missions;
    }

    public void setPositions(List<Position> positions) {
        this.positions = positions;
    }

    @JsonIgnore
    public List<Position> getPositions() {
        return positions;
    }
}
