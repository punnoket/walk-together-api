package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.evaluation.AnswerEvaluation;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.mapping.EvaluationMapping;
import com.finalproject.walktogetherapi.service.EvaluationCategoryService;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/evaluation")
public class EvaluationController {
    private EvaluationCategoryService evaluationCategoryService;
    private QuestionEvaluationService questionEvaluationService;


    @Autowired
    public EvaluationController(EvaluationCategoryService evaluationCategoryService,
                                QuestionEvaluationService questionEvaluationService) {
        this.evaluationCategoryService = evaluationCategoryService;
        this.questionEvaluationService = questionEvaluationService;
    }

    @GetMapping("{id}")
    public ResponseEntity getEvaluationByIdUser(@PathVariable Long id) {
        List<HashMap<String, Object>> data = EvaluationMapping.getInstance().getEvaluationByIdUser(evaluationCategoryService.findAllByOrderByIdAsc());
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, data, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("check-evaluation/{id}")
    public ResponseEntity checkEvaluation(@RequestBody HashMap<String, HashMap<String, Object>> data, @PathVariable Long id) {
        int score = 0;
        for (int i = 1; i < 14; i++) {
            HashMap<String, Object> map = data.get("no" + i);
            QuestionEvaluation questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
            List<AnswerEvaluation> answerEvaluationList = questionEvaluation.getAnswerEvaluations();
            for (AnswerEvaluation anAnswerEvaluationList : answerEvaluationList) {
                if (map.get("answer").toString().contains(anAnswerEvaluationList.getAnswer())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    break;
                }
            }
        }

        HashMap<String, Object> result = new HashMap<>();
        result.put("isPass", score >= 23);
        result.put("score", score);

        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
