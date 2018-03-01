package com.finalproject.walktogetherapi.entities.mission;
import javax.persistence.*;

@Entity
@Table(name = "Mission")
public class Mission {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private double latitude;
    private double longitude;
    private int score;

    @ManyToOne
    @JoinColumn(name = "cognitiveCategory")
    private CognitiveCategory cognitiveCategory;

    @ManyToOne
    @JoinColumn(name = "map")
    private Map map;

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

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public CognitiveCategory getCognitiveCategory() {
        return cognitiveCategory;
    }

    public void setCognitiveCategory(CognitiveCategory cognitiveCategory) {
        this.cognitiveCategory = cognitiveCategory;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }
}
