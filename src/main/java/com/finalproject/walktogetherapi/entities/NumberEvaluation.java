package com.finalproject.walktogetherapi.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "NumberEvaluation")
public class NumberEvaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String no;
    private String score;

    @OneToMany(mappedBy = "numberEvaluation", cascade = {CascadeType.ALL})
    private List<QuestionEvaluation> questionEvaluations;

    @ManyToOne
    @JoinColumn(name = "evaluationCategory")
    private EvaluationCategory evaluationCategory;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public List<QuestionEvaluation> getQuestionEvaluations() {
        return questionEvaluations;
    }

    public void setQuestionEvaluations(List<QuestionEvaluation> questionEvaluations) {
        this.questionEvaluations = questionEvaluations;
    }

    @JsonIgnore
    public EvaluationCategory getEvaluationCategory() {
        return evaluationCategory;
    }

    public void setEvaluationCategory(EvaluationCategory evaluationCategory) {
        this.evaluationCategory = evaluationCategory;
    }
}