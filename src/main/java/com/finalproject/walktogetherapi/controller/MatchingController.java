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
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, matchingService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, matchingService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
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
                        HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
    }

    @PostMapping("add-patient")
    public ResponseEntity addPatient(@RequestBody HashMap<String, Object> data) {
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
    }

    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody Matching matching) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, matchingService.update(id, matching), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, matchingService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
