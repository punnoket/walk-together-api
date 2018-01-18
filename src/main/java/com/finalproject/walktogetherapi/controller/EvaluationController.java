package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.AnswerEvaluation;
import com.finalproject.walktogetherapi.mapping.EvaluationMapping;
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
@RequestMapping("/api/v1/evaluation")
public class EvaluationController {

    private AnswerEvaluationService answerEvaluationService;
    private QuestionEvaluationService questionEvaluationService;
    private EvaluationCategoryService evaluationCategoryService;


    @Autowired
    public EvaluationController(AnswerEvaluationService answerEvaluationService,
                                QuestionEvaluationService questionEvaluationService,
                                EvaluationCategoryService evaluationCategoryService) {
        this.answerEvaluationService = answerEvaluationService;
        this.questionEvaluationService = questionEvaluationService;
        this.evaluationCategoryService = evaluationCategoryService;

    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, answerEvaluationService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getEvaluationByIdUser(@PathVariable Long id) {
        HashMap<String, Object> data = EvaluationMapping.getInstance().getEvaluationByIdUser(evaluationCategoryService.findAllByOrderByIdAsc());
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, data, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
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
