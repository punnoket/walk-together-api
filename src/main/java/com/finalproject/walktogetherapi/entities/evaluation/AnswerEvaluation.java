package com.finalproject.walktogetherapi.entities.evaluation;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.finalproject.walktogetherapi.entities.MyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.persistence.*;

@Entity
@Table(name = "AnswerEvaluation")
public class AnswerEvaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String answer;

    @ManyToOne
    @JoinColumn(name = "questionEvaluation_id")
    private QuestionEvaluation questionEvaluation;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @JsonIgnore
    public QuestionEvaluation getQuestionEvaluation() {
        return questionEvaluation;
    }

    public void setQuestionEvaluation(QuestionEvaluation questionEvaluation) {
        this.questionEvaluation = questionEvaluation;
    }

    @Override
    public String toString() {
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(AnswerEvaluation.class, new MyTypeAdapter<AnswerEvaluation>())
                .create();
        return gson.toJson(this.getId());
    }
}
