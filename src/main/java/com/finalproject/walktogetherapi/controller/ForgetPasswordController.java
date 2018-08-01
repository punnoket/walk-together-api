package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.mapping.PatientMapping;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.HistoryEvaluationTestService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.master.DistrictServices;
import com.finalproject.walktogetherapi.service.master.ProvinceServices;
import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.service.master.SubDistrictServices;
import com.finalproject.walktogetherapi.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.regex.Pattern;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/forget-password")
public class ForgetPasswordController {
    private PatientService patientService;
    private CaretakerService caretakerService;
    @Autowired
    private JavaMailSender sender;
    private BCryptPasswordEncoder encoder;

    @Autowired
    public ForgetPasswordController(PatientService patientService,
                                    CaretakerService caretakerService,
                                    JavaMailSender sender) {
        this.patientService = patientService;
        this.caretakerService = caretakerService;
        this.sender = sender;
        this.encoder = new BCryptPasswordEncoder();
    }

    @PostMapping("")
    public ResponseEntity forgetPasswordEmail(@RequestBody HashMap<String, Object> data) {
        if (isEmailValid(data.get("contact").toString())) {
            Patient patient = patientService.findByEmail(data.get("contact").toString());
            if (patient != null) {
                return EmailSender.getInstance().sendMail(patient.getEmail(), patient.getPassword(), sender);
            } else {
                Caretaker caretaker = caretakerService.findByEmail(data.get("contact").toString());
                if (caretaker != null) {
                    return EmailSender.getInstance().sendMail(caretaker.getEmail(), caretaker.getPassword(), sender);
                } else {
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.NOT_FOUND,
                                    null,
                                    MessageUtil.INCORRECT_EMAIL), HttpStatus.OK);
                }

            }
        } else {
            Patient patient = patientService.findByTell(data.get("contact").toString());
            if (patient != null) {
                String newPassword = RandomNumberUser.getInstance().resetPassword();
                patient.setPassword(encoder.encode(newPassword));
                patientService.update(patient.getId(), patient);
                return SmsSender.getInstance().sendSMSSimple(patient.getTell(), newPassword);
            } else {
                Caretaker caretaker = caretakerService.findByTell(data.get("contact").toString());
                if (caretaker != null) {
                    String newPassword = RandomNumberUser.getInstance().resetPassword();
                    caretaker.setPassword(encoder.encode(newPassword));
                    caretakerService.update(caretaker.getId(), caretaker);
                    return SmsSender.getInstance().sendSMSSimple(caretaker.getTell(), newPassword);

                } else {
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.NOT_FOUND,
                                    null,
                                    MessageUtil.INCORRECT_TELL), HttpStatus.OK);
                }
            }
        }
    }

    private static boolean isEmailValid(String email) {
        final Pattern EMAIL_REGEX = Pattern.compile("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", Pattern.CASE_INSENSITIVE);
        return EMAIL_REGEX.matcher(email).matches();
    }
}
