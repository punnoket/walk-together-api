package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.mapping.PatientMapping;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.HistoryEvaluationTestService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.master.DistrictServices;
import com.finalproject.walktogetherapi.service.master.ProvinceServices;
import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.service.master.SubDistrictServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


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

    @Autowired
    public PatientController(PatientService patientService,
                             CaretakerService caretakerService,
                             SexServices sexServices,
                             ProvinceServices provinceServices,
                             DistrictServices districtServices,
                             SubDistrictServices subDistrictServices,
                             HistoryEvaluationTestService historyEvaluationTestService) {
        this.patientService = patientService;
        this.sexServices = sexServices;
        this.caretakerService = caretakerService;
        this.provinceServices = provinceServices;
        this.districtServices = districtServices;
        this.subDistrictServices = subDistrictServices;
        this.historyEvaluationTestService = historyEvaluationTestService;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("by-patient-number/{patientNumber}")
    public ResponseEntity getByPatientNumber(@PathVariable String patientNumber) {
        Patient patient = patientService.findByNumberPatient(patientNumber);
        if (patient != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patient, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, null, MessageUtil.NOT_FOUND_PATIENT), HttpStatus.OK);
    }

    @GetMapping("history-evaluation/{id}")
    public ResponseEntity getHistoryEvaluationById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, historyEvaluationTestService.findByPatientId(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> data) {
        Patient patient = PatientMapping.getInstance().getPatient(data, caretakerService, patientService, sexServices, provinceServices, districtServices, subDistrictServices, patientService.findById(Long.parseLong(data.get("idPatient").toString())),false);
        if (patient.getUserName() != null) {
            if (patient.getEmail() != null) {
                if (patient.getTell() != null) {
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
    public ResponseEntity update(@PathVariable Long id, @RequestBody HashMap<String, Object> data) {
        Patient patient = PatientMapping.getInstance().getPatient(data, caretakerService, patientService, sexServices, provinceServices, districtServices, subDistrictServices, patientService.findById(id),false);
        if (patient.getUserName() != null) {
            if (patient.getEmail() != null) {
                if (patient.getTell() != null) {
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

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
