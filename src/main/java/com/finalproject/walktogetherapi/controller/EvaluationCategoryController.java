package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationCategory;
import com.finalproject.walktogetherapi.service.EvaluationCategoryService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/evaluation-category")
public class EvaluationCategoryController {

    private EvaluationCategoryService evaluationCategoryService;

    @Autowired
    public EvaluationCategoryController(EvaluationCategoryService evaluationCategoryService) {
        this.evaluationCategoryService = evaluationCategoryService;

    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, evaluationCategoryService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, evaluationCategoryService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody EvaluationCategory evaluationCategory) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.CREATED, evaluationCategoryService.create(evaluationCategory), HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
    }

    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody EvaluationCategory evaluationCategory) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, evaluationCategoryService.update(id, evaluationCategory), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, evaluationCategoryService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
