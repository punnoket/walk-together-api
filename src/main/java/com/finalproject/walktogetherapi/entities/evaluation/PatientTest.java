package com.finalproject.walktogetherapi.entities.evaluation;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.finalproject.walktogetherapi.entities.evaluation.AnswerEvaluation;
import com.finalproject.walktogetherapi.entities.evaluation.EvaluationTest;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;

import javax.persistence.*;

@Entity
@Table(name = "PatientTest")
public class PatientTest {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private QuestionEvaluation questionEvaluation;
    @ManyToOne
    private AnswerEvaluation answerEvaluation;
    private String answer;
    private String score;
    private String evaluationCategory;

    @ManyToOne
    @JoinColumn(name = "evaluationTest")
    private EvaluationTest evaluationTest;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public QuestionEvaluation getQuestionEvaluation() {
        return questionEvaluation;
    }

    public void setQuestionEvaluation(QuestionEvaluation questionEvaluation) {
        this.questionEvaluation = questionEvaluation;
    }

    @JsonIgnore
    public AnswerEvaluation getAnswerEvaluation() {
        return answerEvaluation;
    }

    public void setAnswerEvaluation(AnswerEvaluation answerEvaluation) {
        this.answerEvaluation = answerEvaluation;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getScore() {
        return score;
    }

    @JsonIgnore
    public EvaluationTest getEvaluationTest() {
        return evaluationTest;
    }

    public void setEvaluationTest(EvaluationTest evaluationTest) {
        this.evaluationTest = evaluationTest;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAnswer() {
        return answer;
    }

    public String getEvaluationCategory() {
        return evaluationCategory;
    }

    public void setEvaluationCategory(String evaluationCategory) {
        this.evaluationCategory = evaluationCategory;
    }
}
