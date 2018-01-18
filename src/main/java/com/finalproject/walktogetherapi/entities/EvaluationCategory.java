package com.finalproject.walktogetherapi.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "EvaluationCategory")
public class EvaluationCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String evaluationCategoryName;

    @OneToMany(mappedBy = "evaluationCategory", cascade = {CascadeType.ALL})
    private List<NumberEvaluation> numberEvaluations;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEvaluationCategoryName() {
        return evaluationCategoryName;
    }

    public void setEvaluationCategoryName(String evaluationCategoryName) {
        this.evaluationCategoryName = evaluationCategoryName;
    }

    public void setNumberEvaluations(List<NumberEvaluation> numberEvaluations) {
        this.numberEvaluations = numberEvaluations;
    }

    public List<NumberEvaluation> getNumberEvaluations() {
        return numberEvaluations;
    }
}
