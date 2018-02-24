package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.EvaluationTest;
import com.finalproject.walktogetherapi.entities.HistoryEvaluationTest;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.PatientTest;
import com.finalproject.walktogetherapi.entities.evaluation.AnswerEvaluation;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.mapping.EvaluationMapping;
import com.finalproject.walktogetherapi.service.*;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.DateTHFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/evaluation")
public class EvaluationController {
    private EvaluationCategoryService evaluationCategoryService;
    private QuestionEvaluationService questionEvaluationService;
    private PatientService patientService;
    private HistoryEvaluationTestService historyEvaluationTestService;
    private EvaluationTestService evaluationTestService;
    private PatientTestService patientTestService;


    @Autowired
    public EvaluationController(EvaluationCategoryService evaluationCategoryService,
                                PatientService patientService,
                                QuestionEvaluationService questionEvaluationService,
                                HistoryEvaluationTestService historyEvaluationTestService,
                                EvaluationTestService evaluationTestService,
                                PatientTestService patientTestService) {

        this.evaluationCategoryService = evaluationCategoryService;
        this.questionEvaluationService = questionEvaluationService;
        this.patientService = patientService;
        this.historyEvaluationTestService = historyEvaluationTestService;
        this.evaluationTestService = evaluationTestService;
        this.patientTestService = patientTestService;
    }

    @GetMapping("random")
    public ResponseEntity getEvaluationByIdUser() {
        List<HashMap<String, Object>> data = EvaluationMapping.getInstance().getEvaluation(evaluationCategoryService.findAllByOrderByIdAsc());
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, data, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("check-evaluation/{id}")
    public ResponseEntity checkEvaluation(@RequestBody HashMap<String, HashMap<String, Object>> data, @PathVariable Long id) {
        int score = 0;
        List<PatientTest> patientTestList = new ArrayList<>();
        EvaluationTest evaluationTest = evaluationTestService.create(new EvaluationTest());
        HistoryEvaluationTest historyEvaluationTest = new HistoryEvaluationTest();
        QuestionEvaluation questionEvaluation = new QuestionEvaluation();
        HashMap<String, Object> map ;
        for (int i = 1; i < 4; i++) {

            PatientTest patientTest = new PatientTest();

            if (i == 1) {
                map = data.get("no1");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (map.get("answer").toString().equalsIgnoreCase(DateTHFormat.getInstance().getDayName())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(String.valueOf(score));
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 2) {
                map = data.get("no2");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (map.get("answer").toString().equalsIgnoreCase(DateTHFormat.getInstance().getDay())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(String.valueOf(score));
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 3) {
                map = data.get("no3");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (map.get("answer").toString().equalsIgnoreCase(DateTHFormat.getInstance().getMonth())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(String.valueOf(score));
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }


        }
        Patient patient = patientService.findById(id);

        evaluationTest.setPatientTests(patientTestList);
        evaluationTest.setResultScore(String.valueOf(score));
        evaluationTest.setTestDate(new Date());
        evaluationTest.setFrequencyPatient(patient.getFrequency());

        historyEvaluationTest.setEvaluationTest(evaluationTestService.update(evaluationTest.getId(), evaluationTest));
        historyEvaluationTest.setPatient(patient);

        if (patient.getHistoryEvaluationTests() != null) {
            List<HistoryEvaluationTest> historyEvaluationTestList = patient.getHistoryEvaluationTests();
            historyEvaluationTestList.add(historyEvaluationTestService.create(historyEvaluationTest));
            patient.setHistoryEvaluationTests(historyEvaluationTestList);
        } else {
            List<HistoryEvaluationTest> historyEvaluationTestList = new ArrayList<>();
            historyEvaluationTestList.add(historyEvaluationTestService.create(historyEvaluationTest));
            patient.setHistoryEvaluationTests(historyEvaluationTestList);
        }

        patientService.update(id, patient);

        HashMap<String, Object> result = new HashMap<>();
        result.put("isPass", score >= 23);
        result.put("score", score);

        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
