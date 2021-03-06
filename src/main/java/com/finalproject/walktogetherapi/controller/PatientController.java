package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.mapping.CollectionMapping;
import com.finalproject.walktogetherapi.mapping.PatientMapping;
import com.finalproject.walktogetherapi.service.*;
import com.finalproject.walktogetherapi.service.master.*;
import com.finalproject.walktogetherapi.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

import static com.finalproject.walktogetherapi.util.MessageUtil.PASSWORD_INVALID;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/patient")
public class PatientController {
    private PatientService patientService;
    private CaretakerService caretakerService;
    private SexServices sexServices;
    private ProvinceServices provinceServices;
    private DistrictServices districtServices;
    private SubDistrictServices subDistrictServices;
    private HistoryEvaluationTestService historyEvaluationTestService;
    private EducationServices educationServices;
    private CollectionService collectionService;
    private RewardService rewardService;
    private LogService logService;
    private BCryptPasswordEncoder encoder;

    @Autowired
    public PatientController(PatientService patientService,
                             CaretakerService caretakerService,
                             SexServices sexServices,
                             ProvinceServices provinceServices,
                             DistrictServices districtServices,
                             SubDistrictServices subDistrictServices,
                             CollectionService collectionService,
                             RewardService rewardService,
                             LogService logService,
                             EducationServices educationServices,
                             HistoryEvaluationTestService historyEvaluationTestService) {
        this.patientService = patientService;
        this.sexServices = sexServices;
        this.caretakerService = caretakerService;
        this.provinceServices = provinceServices;
        this.districtServices = districtServices;
        this.rewardService = rewardService;
        this.collectionService = collectionService;
        this.subDistrictServices = subDistrictServices;
        this.historyEvaluationTestService = historyEvaluationTestService;
        this.educationServices = educationServices;
        this.logService = logService;
        this.encoder = new BCryptPasswordEncoder();
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(HttpServletRequest request, @PathVariable Long id) {
        Patient patient = patientService.findById(id);
        HashMap<String, Object> responseMap = ApiResponse
                .getInstance()
                .response(HttpStatus.OK, patient, HttpStatus.OK.getReasonPhrase());
        responseMap.put("isTestEvaluation", DateTimeManager.getInstance().
                isTestEvaluation(patient
                        .getHistoryEvaluationTests()
                        .get(patient
                                .getHistoryEvaluationTests()
                                .size() - 1)
                        .getEvaluationTest()
                        .getTestDate()));
        LogUtil.getInstance().responseAPI(request, responseMap, logService);
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
    }

    @GetMapping("by-patient-number/{patientNumber}")
    public ResponseEntity getByPatientNumber(@PathVariable String patientNumber) {
        Patient patient = patientService.findByNumberPatient(patientNumber);
        if (patient != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patient, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, MessageUtil.NOT_FOUND_PATIENT), HttpStatus.OK);
    }

    @GetMapping("history-evaluation/{id}")
    public ResponseEntity getHistoryEvaluationById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, historyEvaluationTestService.findByPatientId(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(HttpServletRequest request, @RequestBody HashMap<String, Object> data) {
        LogUtil.getInstance().saveLog(request, data, logService);
        Patient patient = PatientMapping.getInstance().getPatient(data, caretakerService, patientService, sexServices, provinceServices, districtServices, subDistrictServices, educationServices, patientService.findById(Long.parseLong(data.get("idPatient").toString())), false, encoder);
        if (patient.getUserName() != null) {
            if (patient.getEmail() != null) {
                if (patient.getTell() != null) {
                    CollectionMapping.Companion.getInstance().addCollection(rewardService, collectionService, patient);
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.CREATED,
                                    patientService.update(Long.parseLong(data.get("idPatient").toString()), patient),
                                    HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
                } else {
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.NOT_FOUND,
                                    null,
                                    MessageUtil.DUPLICATE_TELL), HttpStatus.CREATED);
                }

            } else {
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND,
                                null,
                                MessageUtil.DUPLICATE_EMAIL), HttpStatus.CREATED);
            }

        } else {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND,
                            null,
                            MessageUtil.DUPLICATE_USERNAME), HttpStatus.CREATED);
        }
    }

    @PatchMapping("{id}")
    public ResponseEntity update(HttpServletRequest request, @PathVariable Long id, @RequestBody HashMap<String, Object> data) {
        Patient patient = PatientMapping.getInstance().getPatient(data, caretakerService, patientService, sexServices, provinceServices, districtServices, subDistrictServices, educationServices, patientService.findById(id), false, encoder);
        if (patient.getUserName() != null) {
            if (patient.getEmail() != null) {
                if (patient.getTell() != null) {
                    LogUtil.getInstance().responseAPI(request, data, logService);
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.CREATED,
                                    patientService.update(id, patient),
                                    HttpStatus.CREATED.getReasonPhrase()), HttpStatus.OK);
                } else {
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.NOT_FOUND,
                                    null,
                                    MessageUtil.DUPLICATE_TELL), HttpStatus.OK);
                }

            } else {
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND,
                                null,
                                MessageUtil.DUPLICATE_EMAIL), HttpStatus.OK);
            }

        } else {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND,
                            null,
                            MessageUtil.DUPLICATE_USERNAME), HttpStatus.OK);
        }
    }

    @PatchMapping("change-password/{id}")
    public ResponseEntity changePassword(HttpServletRequest request, @PathVariable Long id, @RequestBody HashMap<String, Object> data) {
        Patient patient = patientService.findById(id);
        if (encoder.matches(data.get("oldPassword").toString(), patient.getPassword())) {
            patient.setPassword(encoder.encode(data.get("newPassword").toString()));
            patientService.update(patient.getId(), patient);
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patient, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, PASSWORD_INVALID), HttpStatus.OK);
        }
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
