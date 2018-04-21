package com.finalproject.walktogetherapi.entities.mission;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Mission")
public class Mission {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int score;
    private String type;
    private String question;
    private String image;

    @ManyToOne
    @JoinColumn(name = "cognitiveCategory")
    private CognitiveCategory cognitiveCategory;

    @OneToMany(mappedBy = "mission", cascade = {CascadeType.ALL})
    private List<AnswerMission> answerMissions;


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
