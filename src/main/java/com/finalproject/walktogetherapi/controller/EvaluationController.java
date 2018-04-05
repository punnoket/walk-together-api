package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.evaluation.EvaluationTest;
import com.finalproject.walktogetherapi.entities.evaluation.HistoryEvaluationTest;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.evaluation.PatientTest;
import com.finalproject.walktogetherapi.entities.evaluation.AnswerEvaluation;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.mapping.EvaluationMapping;
import com.finalproject.walktogetherapi.mapping.PatientMapping;
import com.finalproject.walktogetherapi.service.*;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.DateTimeManager;
import com.finalproject.walktogetherapi.util.LogUtil;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
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
    private LogService logService;

    @Autowired
    public EvaluationController(EvaluationCategoryService evaluationCategoryService,
                                PatientService patientService,
                                QuestionEvaluationService questionEvaluationService,
                                HistoryEvaluationTestService historyEvaluationTestService,
                                LogService logService,
                                EvaluationTestService evaluationTestService,
                                PatientTestService patientTestService) {

        this.evaluationCategoryService = evaluationCategoryService;
        this.questionEvaluationService = questionEvaluationService;
        this.patientService = patientService;
        this.historyEvaluationTestService = historyEvaluationTestService;
        this.evaluationTestService = evaluationTestService;
        this.patientTestService = patientTestService;
        this.logService = logService;
    }

    @GetMapping("random")
    public ResponseEntity getEvaluationByIdUser(HttpServletRequest request) {
        List<HashMap<String, Object>> data = EvaluationMapping.getInstance().getEvaluation(evaluationCategoryService.findAllByOrderByIdAsc());
        LogUtil.getInstance().saveLog(request, data, logService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, data, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("check-evaluation/{id}")
    public ResponseEntity checkEvaluation(HttpServletRequest request, @RequestBody HashMap<String, HashMap<String, Object>> data, @PathVariable Long id) {
        JSONObject jsonObject = new JSONObject(data);
        LogUtil.getInstance().saveLogJson(request, jsonObject, logService);
        int score = 0;
        List<PatientTest> patientTestList = new ArrayList<>();
        EvaluationTest evaluationTest = evaluationTestService.create(new EvaluationTest());
        HistoryEvaluationTest historyEvaluationTest = new HistoryEvaluationTest();
        QuestionEvaluation questionEvaluation;
        Patient patient;

        if (id == 0) {
            patient = patientService.create(PatientMapping.getInstance().createPatient(new Patient()));
        } else {
            patient = patientService.findById(id);
        }

        HashMap<String, Object> map;
        for (int i = 1; i < 20; i++) {

            PatientTest patientTest = new PatientTest();

            if (i == 1) {
                map = data.get("no1");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (map.get("answer").toString().equalsIgnoreCase(DateTimeManager.getInstance().getDayName())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 2) {
                map = data.get("no2");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (map.get("answer").toString().equalsIgnoreCase(DateTimeManager.getInstance().getDay())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 3) {
                map = data.get("no3");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (map.get("answer").toString().equalsIgnoreCase(DateTimeManager.getInstance().getMonth())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 4) {
                map = data.get("no4");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (DateTimeManager.getInstance().isDurationDay(map.get("answer").toString())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 5) {
                map = data.get("no5");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (Boolean.valueOf(map.get("answer").toString())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 6) {
                map = data.get("no6");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 7) {
                map = data.get("no7");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 8) {
                map = data.get("no8");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (Boolean.valueOf(map.get("answer").toString())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 9) {
                map = data.get("no9");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                score += Integer.parseInt(map.get("answer").toString());
                patientTest.setScore(map.get("answer").toString());
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 12) {
                map = data.get("no12");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 13) {
                map = data.get("no13");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 14) {
                map = data.get("no14");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 15) {
                map = data.get("no15");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (Boolean.valueOf(map.get("answer").toString())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 16) {
                map = data.get("no16");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 17) {
                map = data.get("no17");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                if (Boolean.valueOf(map.get("answer").toString())) {
                    score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 18) {
                map = data.get("no18");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }

            if (i == 19) {
                map = data.get("no19");
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("idRef").toString()));
                String answer = map.get("answer").toString();
                boolean isCorrect = false;
                for (AnswerEvaluation answerEvaluation : questionEvaluation.getAnswerEvaluations()) {
                    if (answer.equalsIgnoreCase(answerEvaluation.getAnswer())) {
                        score += Integer.parseInt(questionEvaluation.getNumberEvaluation().getScore());
                        isCorrect = true;
                        break;
                    }
                }
                if (isCorrect) {
                    patientTest.setScore(questionEvaluation.getNumberEvaluation().getScore());
                } else {
                    patientTest.setScore(String.valueOf(0));
                }
                questionEvaluation = questionEvaluationService.findById(Long.parseLong(map.get("id").toString()));
                patientTest.setQuestionEvaluation(questionEvaluation);
                patientTest.setAnswer(map.get("answer").toString());
                patientTest.setEvaluationCategory(questionEvaluation.getNumberEvaluation().getEvaluationCategory().getEvaluationCategoryName());
                patientTest.setEvaluationTest(evaluationTest);
                patientTestList.add(patientTestService.create(patientTest));
            }
        }

        evaluationTest.setPatientTests(patientTestList);
        evaluationTest.setResultScore(String.valueOf(score));
        evaluationTest.setTestDate(DateTimeManager.getInstance().getCurrentTime());
        evaluationTest.setFrequencyPatient(patient.getFrequency());

        historyEvaluationTest.setEvaluationTest(evaluationTestService.update(evaluationTest.getId(), evaluationTest));
        historyEvaluationTest.setPatient(patient);
        HistoryEvaluationTest resultHistoryEvaluationTest = historyEvaluationTestService.create(historyEvaluationTest);

        if (patient.getHistoryEvaluationTests() != null) {
            List<HistoryEvaluationTest> historyEvaluationTestList = patient.getHistoryEvaluationTests();
            historyEvaluationTestList.add(resultHistoryEvaluationTest);
            patient.setHistoryEvaluationTests(historyEvaluationTestList);
        } else {
            List<HistoryEvaluationTest> historyEvaluationTestList = new ArrayList<>();
            historyEvaluationTestList.add(resultHistoryEvaluationTest);
            patient.setHistoryEvaluationTests(historyEvaluationTestList);
        }

        patientService.update(id, patient);

        if (score < 23) {
            if (patient.getUserName() == null) {
                historyEvaluationTestService.delete(resultHistoryEvaluationTest.getId());
                patientService.delete(patient.getId());
                System.out.println(patient.getQrCode()+" "+new File(patient.getQrCode()).delete());
            }
        }

        HashMap<String, Object> result = new HashMap<>();
        result.put("isPass", score >= 23);
        result.put("score", score);
        result.put("idPatient", patient.getId());
        LogUtil.getInstance().responseAPI(request, result, logService);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
