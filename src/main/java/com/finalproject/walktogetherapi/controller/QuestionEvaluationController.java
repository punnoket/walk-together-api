package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.AnswerEvaluation;
import com.finalproject.walktogetherapi.entities.EvaluationCategory;
import com.finalproject.walktogetherapi.entities.NumberEvaluation;
import com.finalproject.walktogetherapi.entities.QuestionEvaluation;
import com.finalproject.walktogetherapi.service.AnswerEvaluationService;
import com.finalproject.walktogetherapi.service.EvaluationCategoryService;
import com.finalproject.walktogetherapi.service.NumberEvaluationService;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/question-evaluation")
public class QuestionEvaluationController {

    private QuestionEvaluationService questionEvaluationService;
    private NumberEvaluationService numberEvaluationService;

    @Autowired
    public QuestionEvaluationController(QuestionEvaluationService questionEvaluationService,
                                        NumberEvaluationService numberEvaluationService) {
        this.numberEvaluationService = numberEvaluationService;
        this.questionEvaluationService = questionEvaluationService;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, questionEvaluationService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, questionEvaluationService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> questionEvaluation) {
        QuestionEvaluation result = new QuestionEvaluation();
        NumberEvaluation numberEvaluation = numberEvaluationService.findById(Long.parseLong(questionEvaluation.get("numberEvaluationServiceId").toString()));
        result.setTitle(questionEvaluation.get("title").toString());
        result.setDescription(questionEvaluation.get("description").toString());
        result.setNumberEvaluation(numberEvaluation  );
        return new ResponseEntity<>(ApiResponse.getInstance()
                .response(HttpStatus.CREATED,
                        questionEvaluationService.create(result),
                        HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
    }

    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody QuestionEvaluation questionEvaluation) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, questionEvaluationService.update(id, questionEvaluation), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, questionEvaluationService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
