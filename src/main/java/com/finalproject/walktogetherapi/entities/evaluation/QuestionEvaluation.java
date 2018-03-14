package com.finalproject.walktogetherapi.entities.evaluation;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.finalproject.walktogetherapi.entities.MyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "QuestionEvaluation")
public class QuestionEvaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title;
    private String description;
    private String image;
    private String audio;

    @OneToMany(mappedBy = "questionEvaluation", cascade = {CascadeType.ALL})
    private List<AnswerEvaluation> answerEvaluations;

    @ManyToOne
    @JoinColumn(name = "numberEvaluation")
    private NumberEvaluation numberEvaluation;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @JsonIgnore
    public List<AnswerEvaluation> getAnswerEvaluations() {
        return answerEvaluations;
    }

    public void setAnswerEvaluations(List<AnswerEvaluation> answerEvaluations) {
        this.answerEvaluations = answerEvaluations;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    @JsonIgnore
    public NumberEvaluation getNumberEvaluation() {
        return numberEvaluation;
    }

    public void setNumberEvaluation(NumberEvaluation numberEvaluation) {
        this.numberEvaluation = numberEvaluation;
    }

    @Override
    public String toString() {
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(QuestionEvaluation.class, new MyTypeAdapter<QuestionEvaluation>())
                .create();
        return gson.toJson(this.getId());
    }
}
