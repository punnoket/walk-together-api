package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Matching;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.mapping.MatchingMapping;
import com.finalproject.walktogetherapi.service.*;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/matching")
public class MatchingController {
    private PatientService patientService;
    private CaretakerService caretakerService;
    private MatchingService matchingService;

    @Autowired
    public MatchingController(CaretakerService caretakerService,
                              PatientService patientService,
                              MatchingService matchingService) {
        this.patientService = patientService;
        this.caretakerService = caretakerService;
        this.matchingService = matchingService;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                matchingService.findAll(),
                HttpStatus.OK.getReasonPhrase()),
                HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                matchingService.findById(id),
                HttpStatus.OK.getReasonPhrase()),
                HttpStatus.OK);
    }

    @GetMapping("caretaker-by-patient/{id}")
    public ResponseEntity getCaretakerByIdPatient(@PathVariable Long id) {
        List<Matching> matchingList = matchingService.findByCaretakerId(id);
        if (matchingList != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    MatchingMapping.getInstance().getCaretakerList(matchingService.findByPatientId(id)),
                    HttpStatus.OK.getReasonPhrase()),
                    HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    null,
                    MessageUtil.NOT_FOUND_CARETAKER),
                    HttpStatus.OK);    }

    @GetMapping("patient-by-caretaker/{id}")
    public ResponseEntity getPatientByIdCaretaker(@PathVariable Long id) {
        List<Matching> matchingList = matchingService.findByCaretakerId(id);
        if (matchingList != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    MatchingMapping.getInstance().getPatientList(matchingService.findByCaretakerId(id)),
                    HttpStatus.OK.getReasonPhrase()),
                    HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    null,
                    MessageUtil.NOT_FOUND_PATIENT),
                    HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> data) {
        Matching matching = new Matching();
        Patient patient = patientService.findById(Long.parseLong(data.get("idPatient").toString()));
        Caretaker caretaker = caretakerService.findById(Long.parseLong(data.get("idCaretaker").toString()));
        matching.setPatient(patient);
        matching.setCaretaker(caretaker);
        return new ResponseEntity<>(ApiResponse.getInstance()
                .response(HttpStatus.CREATED,
                        matchingService.create(matching),
                        HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
    }

    @PostMapping("add-caretaker")
    public ResponseEntity addCaretaker(@RequestBody HashMap<String, Object> data) {
        Matching matching = matchingService.findByPatientIdAndCaretakerNumber(Long.parseLong(data.get("idPatient").toString()),
                data.get("caretakerNumber").toString());

        if (matching == null) {
            Patient patient = patientService.findById(Long.parseLong(data.get("idPatient").toString()));
            if (patient == null)
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND, null,
                                MessageUtil.NOT_FOUND_PATIENT), HttpStatus.NOT_FOUND);

            Caretaker caretaker = caretakerService.findByNumberCaretaker(data.get("caretakerNumber").toString());
            if (caretaker == null)
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND, null,
                                MessageUtil.NOT_FOUND_CARETAKER), HttpStatus.NOT_FOUND);
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.CREATED,
                            matchingService.create(MatchingMapping.getInstance().acceptMatching(caretaker, patient)),
                            MessageUtil.SUCCESS_CARETAKER), HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND, null,
                            MessageUtil.DUPLICATE_CARETAKER), HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("add-patient")
    public ResponseEntity addPatient(@RequestBody HashMap<String, Object> data) {
        Matching matching = matchingService.findByCaretakerIdAndPatientNumber(Long.parseLong(data.get("idCaretaker").toString()),
                data.get("patientNumber").toString());

        if (matching == null) {
            Caretaker caretaker = caretakerService.findById(Long.parseLong(data.get("idCaretaker").toString()));
            if (caretaker == null)
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND, null,
                                MessageUtil.NOT_FOUND_CARETAKER), HttpStatus.NOT_FOUND);
            Patient patient = patientService.findByNumberPatient(data.get("patientNumber").toString());
            if (patient == null)
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND, null,
                                MessageUtil.NOT_FOUND_PATIENT), HttpStatus.NOT_FOUND);

            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.OK,
                            matchingService.create(MatchingMapping.getInstance().acceptMatching(caretaker, patient)),
                            MessageUtil.SUCCESS_PATIENT), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND, null,
                            MessageUtil.DUPLICATE_PATIENT), HttpStatus.NOT_FOUND);
        }
    }

    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody Matching matching) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, matchingService.update(id, matching), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("remove-patient/{id}")
    public ResponseEntity removePatient(@PathVariable Long id,
                                 @RequestParam(value = "patientNumber") String patientNumber) {

        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, matchingService.delete(matchingService.findByCaretakerIdAndPatientNumber(id, patientNumber).getId()), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("remove-caretaker/{id}")
    public ResponseEntity removeCaretaker(@PathVariable Long id,
                                 @RequestParam(value = "caretakerNumber") String caretakerNumber) {

        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, matchingService.delete(matchingService.findByPatientIdAndCaretakerNumber(id, caretakerNumber).getId()), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
