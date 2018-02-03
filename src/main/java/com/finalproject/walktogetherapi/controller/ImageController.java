package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import static com.finalproject.walktogetherapi.util.Constant.PATH_IMAGE_CARETAKER;
import static com.finalproject.walktogetherapi.util.Constant.PATH_IMAGE_PATIENT;
import static com.finalproject.walktogetherapi.util.Constant.PATH_IMAGE_QUESTION;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/upload-image")
public class ImageController {
    private PatientService patientService;
    private CaretakerService caretakerService;
    private QuestionEvaluationService questionEvaluationService;


    @Autowired
    public ImageController(PatientService patientService,
                           CaretakerService caretakerService,
                           QuestionEvaluationService questionEvaluationService) {
        this.questionEvaluationService = questionEvaluationService;
        this.patientService = patientService;
        this.caretakerService = caretakerService;
    }

    @PostMapping("question-evaluation")
    public ResponseEntity uploadImageQuestion(@RequestParam("file") MultipartFile file,
                                              @RequestParam("id") Long id) {

        QuestionEvaluation questionEvaluation = questionEvaluationService.findById(id);
        String pathString = PATH_IMAGE_QUESTION
                + "/"
                + questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName().toLowerCase()
                + "/"
                + questionEvaluation.getNumberEvaluation().getNo()
                + "/"
                + questionEvaluation.getId()
                + "/";

        if (file.isEmpty())
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);

        String resultPathImage = UploadUtil.getInstance().upload(pathString, file);
        if (resultPathImage != null) {
            questionEvaluation.setImage(resultPathImage);
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.CREATED, questionEvaluationService.update(id, questionEvaluation), HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);

        } else {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("patient")
    public ResponseEntity uploadPatientImage(@RequestParam("file") MultipartFile file,
                                             @RequestParam("id") Long id) {

        Patient patient = patientService.findById(id);
        String pathString = PATH_IMAGE_PATIENT
                + "/"
                + patient.getId()
                + "/";

        if (file.isEmpty())
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);

        String resultPathImage = UploadUtil.getInstance().upload(pathString, file);
        if (resultPathImage != null) {
            patient.setImage(resultPathImage);
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.CREATED, patientService.update(id, patient), HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);

        } else {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("caretaker")
    public ResponseEntity uploadCaretakerImage(@RequestParam("file") MultipartFile file,
                                             @RequestParam("id") Long id) {

        Caretaker caretaker = caretakerService.findById(id);
        String pathString = PATH_IMAGE_CARETAKER
                + "/"
                + caretaker.getId()
                + "/";

        if (file.isEmpty())
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);

        String resultPathImage = UploadUtil.getInstance().upload(pathString, file);
        if (resultPathImage != null) {
            caretaker.setImage(resultPathImage);
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.CREATED, caretakerService.update(id, caretaker), HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);

        } else {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
        }
    }

}
