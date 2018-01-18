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
@RequestMapping("/api/v1/number-evaluation")
public class NumberEvaluationController {

    private NumberEvaluationService numberEvaluationService;
    private EvaluationCategoryService evaluationCategoryService;

    @Autowired
    public NumberEvaluationController(NumberEvaluationService numberEvaluationService,
                                      EvaluationCategoryService evaluationCategoryService) {
        this.numberEvaluationService = numberEvaluationService;
        this.evaluationCategoryService = evaluationCategoryService;

    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, numberEvaluationService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, numberEvaluationService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> data) {
        NumberEvaluation result = new NumberEvaluation();
        result.setNo(data.get("no").toString());
        result.setScore(data.get("score").toString());
        result.setEvaluationCategory(evaluationCategoryService.findById(Long.parseLong(data.get("evaluationCategoryId").toString())));
        return new ResponseEntity<>(ApiResponse.getInstance()
                .response(HttpStatus.CREATED,
                        numberEvaluationService.create(result),
                        HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
    }

    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody NumberEvaluation numberEvaluation) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, numberEvaluationService.update(id, numberEvaluation), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, numberEvaluationService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
