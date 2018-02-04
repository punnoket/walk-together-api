package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.Constant;
import com.finalproject.walktogetherapi.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@RestController
@RequestMapping("/api/v1/login")
public class LoginController {
    private CaretakerService caretakerService;
    private PatientService patientService;

    @Autowired
    public LoginController(CaretakerService caretakerService,
                           PatientService patientService) {
        this.caretakerService = caretakerService;
        this.patientService = patientService;
    }

    @PostMapping("")
    public ResponseEntity loginPatient(@RequestBody HashMap<String, Object> data) {
        if (data.get("userName").toString() != null && data.get("password").toString() != null) {
            Patient patient = patientService.findByUserName(data.get("userName").toString());
            if (patient != null) {
                if (patient.getPassword().equals(data.get("password").toString())) {
                    HashMap<String, Object> responseMap = ApiResponse
                            .getInstance()
                            .response(HttpStatus.OK, patient, HttpStatus.OK.getReasonPhrase());
                    responseMap.put("type", Constant.TYPE_PATIENT);
                    return new ResponseEntity<>(responseMap, HttpStatus.OK);

                } else
                    return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, MessageUtil.INCORRECT_PASSWORD), HttpStatus.NOT_FOUND);

            } else {
                Caretaker caretaker = caretakerService.findByUserName(data.get("userName").toString());
                if (caretaker != null) {
                    if (caretaker.getPassword().equals(data.get("password").toString())) {
                        HashMap<String, Object> responseMap = ApiResponse
                                .getInstance()
                                .response(HttpStatus.OK, caretaker, HttpStatus.OK.getReasonPhrase());
                        responseMap.put("type", Constant.TYPE_CARETAKER);
                        return new ResponseEntity<>(responseMap, HttpStatus.OK);
                    } else
                        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, MessageUtil.INCORRECT_PASSWORD), HttpStatus.NOT_FOUND);
                } else {
                    return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, MessageUtil.INCORRECT_USERNAME), HttpStatus.NOT_FOUND);
                }
            }
        } else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
    }

}

