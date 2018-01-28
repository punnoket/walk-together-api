package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.mapping.PatientMapping;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.master.DistrictServices;
import com.finalproject.walktogetherapi.service.master.ProvinceServices;
import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.service.master.SubDistrictServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.EmailSender;
import com.finalproject.walktogetherapi.util.MessageUtil;
import com.finalproject.walktogetherapi.util.SmsSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.mail.javamail.JavaMailSender;

import java.util.HashMap;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/patient")
public class PatientController {
    private PatientService patientService;
    private SexServices sexServices;
    private ProvinceServices provinceServices;
    private DistrictServices districtServices;
    private SubDistrictServices subDistrictServices;
    @Autowired
    private JavaMailSender sender;

    @Autowired
    public PatientController(PatientService patientService,
                             SexServices sexServices,
                             ProvinceServices provinceServices,
                             DistrictServices districtServices,
                             SubDistrictServices subDistrictServices,
                             JavaMailSender sender) {
        this.patientService = patientService;
        this.sexServices = sexServices;
        this.provinceServices = provinceServices;
        this.districtServices = districtServices;
        this.subDistrictServices = subDistrictServices;
        this.sender = sender;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("caretaker/{id}")
    public ResponseEntity getCaretakerById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("forget-password-email")
    public ResponseEntity forgetPasswordEmail(@RequestBody HashMap < String, Object > data) {
        Patient patient = patientService.findByEmail(data.get("email").toString());
        if (patient == null) {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND,
                            null,
                            MessageUtil.INCORRECT_EMAIL), HttpStatus.NOT_FOUND);
        } else {
            return EmailSender.getInstance().sendMail(patient.getEmail(), patient.getPassword(), sender);

        }
    }

    @PostMapping("forget-password-tell")
    public ResponseEntity forgetPasswordPhone(@RequestBody HashMap < String, Object > data) {
        Patient patient = patientService.findByTell(data.get("tell").toString());
        if (patient == null) {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND,
                            null,
                            MessageUtil.INCORRECT_TELL), HttpStatus.NOT_FOUND);
        } else {
            return SmsSender.getInstance().sendSMSSimple(patient.getTell(), patient.getPassword());

        }
    }

        @PostMapping("")
        public ResponseEntity create (@RequestBody HashMap < String, Object > data){
            Patient patient = PatientMapping.getInstance().getPatient(data, patientService, sexServices, provinceServices, districtServices, subDistrictServices, new Patient(), true);
            if (patient != null) {
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.CREATED,
                                patientService.create(patient),
                                MessageUtil.EMAIL_SEND_SUCCESS), HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND,
                                null,
                                MessageUtil.DUPLICATE_USERNAME), HttpStatus.NOT_FOUND);
            }
        }

        @PatchMapping("{id}")
        public ResponseEntity update (@PathVariable Long id, @RequestBody HashMap < String, Object > data){
            Patient patient = PatientMapping.getInstance().getPatient(data, patientService, sexServices, provinceServices, districtServices, subDistrictServices, patientService.findById(id), false);
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.CREATED,
                            patientService.update(id, patient),
                            HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
        }

        @DeleteMapping("{id}")
        public ResponseEntity delete (@PathVariable Long id){
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, patientService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        }


    }
