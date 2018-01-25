package com.finalproject.walktogetherapi.entities.evaluation;

import com.fasterxml.jackson.annotation.JsonIgnore;

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

    public List<AnswerEvaluation> getAnswerEvaluations() {
        return answerEvaluations;
    }

    public void setAnswerEvaluations(List<AnswerEvaluation> answerEvaluations) {
        this.answerEvaluations = answerEvaluations;
    }

    @JsonIgnore
    public NumberEvaluation getNumberEvaluation() {
        return numberEvaluation;
    }

    public void setNumberEvaluation(NumberEvaluation numberEvaluation) {
        this.numberEvaluation = numberEvaluation;
    }
}
