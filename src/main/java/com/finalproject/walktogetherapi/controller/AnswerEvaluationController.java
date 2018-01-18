package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.AnswerEvaluation;
import com.finalproject.walktogetherapi.entities.EvaluationCategory;
import com.finalproject.walktogetherapi.entities.QuestionEvaluation;
import com.finalproject.walktogetherapi.service.AnswerEvaluationService;
import com.finalproject.walktogetherapi.service.EvaluationCategoryService;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/answer-evaluation")
public class AnswerEvaluationController {

    private AnswerEvaluationService answerEvaluationService;
    private QuestionEvaluationService questionEvaluationService;


    @Autowired
    public AnswerEvaluationController(AnswerEvaluationService answerEvaluationService,
                                      QuestionEvaluationService questionEvaluationService) {
        this.answerEvaluationService = answerEvaluationService;
        this.questionEvaluationService = questionEvaluationService;

    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, answerEvaluationService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, answerEvaluationService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> data) {
        AnswerEvaluation result = new AnswerEvaluation();
        QuestionEvaluation questionEvaluation = questionEvaluationService.findById(Long.parseLong(data.get("questionEvaluationId").toString()));
        result.setAnswer(data.get("answer").toString());
        result.setQuestionEvaluation(questionEvaluation);
        return new ResponseEntity<>(ApiResponse.getInstance()
                .response(HttpStatus.CREATED,
                        answerEvaluationService.create(result),
                        HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
    }
    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody AnswerEvaluation answerEvaluation) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, answerEvaluationService.update(id, answerEvaluation), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, answerEvaluationService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
