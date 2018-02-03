package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import static com.finalproject.walktogetherapi.util.Constant.*;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/upload-audio")
public class AudioController {
    private QuestionEvaluationService questionEvaluationService;


    @Autowired
    public AudioController(QuestionEvaluationService questionEvaluationService) {
        this.questionEvaluationService = questionEvaluationService;
    }

    @PostMapping("question-evaluation")
    public ResponseEntity uploadImageQuestion(@RequestParam("file") MultipartFile file,
                                              @RequestParam("id") Long id) {

        QuestionEvaluation questionEvaluation = questionEvaluationService.findById(id);
        String pathString = PATH_AUDIO_QUESTION
                + "/"
                + questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName().toLowerCase()
                + "/"
                + questionEvaluation.getNumberEvaluation().getNo()
                + "/"
                + questionEvaluation.getId()
                + "/";

        if (file.isEmpty())
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);

        String pathAudio = UploadUtil.getInstance().upload(pathString, file);
        if (pathAudio != null) {
            questionEvaluation.setAudio(pathAudio);
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.CREATED, questionEvaluationService.update(id, questionEvaluation), HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);

        } else {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
        }
    }

}
