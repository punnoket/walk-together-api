package com.finalproject.walktogetherapi.entities.mission;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Mission")
public class Mission {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private double latitude;
    private double longitude;
    private int score;
    private String type;
    private String question;
    private String image;

    @ManyToOne
    @JoinColumn(name = "cognitiveCategory")
    private CognitiveCategory cognitiveCategory;

    @ManyToOne
    @JoinColumn(name = "map")
    private Map map;

    @OneToMany(mappedBy = "mission", cascade = {CascadeType.ALL})
    private List<AnswerMission> answerMissions;


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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setAnswerMissions(List<AnswerMission> answerMissions) {
        this.answerMissions = answerMissions;
    }

    public List<AnswerMission> getAnswerMissions() {
        return answerMissions;
    }
}
