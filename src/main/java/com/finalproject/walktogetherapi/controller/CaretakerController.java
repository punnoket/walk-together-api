package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.mapping.CaretakerMapping;
import com.finalproject.walktogetherapi.mapping.PatientMapping;
import com.finalproject.walktogetherapi.service.CaretakerService;
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
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/caretaker")
public class CaretakerController {
    private CaretakerService caretakerService;
    private SexServices sexServices;
    private ProvinceServices provinceServices;
    private DistrictServices districtServices;
    private SubDistrictServices subDistrictServices;
    @Autowired
    private JavaMailSender sender;

    @Autowired
    public CaretakerController(CaretakerService caretakerService,
                               SexServices sexServices,
                               ProvinceServices provinceServices,
                               DistrictServices districtServices,
                               SubDistrictServices subDistrictServices,
                               JavaMailSender sender) {
        this.caretakerService = caretakerService;
        this.sexServices = sexServices;
        this.provinceServices = provinceServices;
        this.districtServices = districtServices;
        this.subDistrictServices = subDistrictServices;
        this.sender = sender;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, caretakerService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, caretakerService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> data) {
        Caretaker caretaker = CaretakerMapping.getInstance().getCaretaker(data, caretakerService, sexServices, provinceServices, districtServices, subDistrictServices, new Caretaker(), true);
       if (caretaker!=null) {
           return new ResponseEntity<>(ApiResponse.getInstance()
                   .response(HttpStatus.CREATED,
                           caretakerService.create(caretaker),
                           HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
       } else {
           return new ResponseEntity<>(ApiResponse.getInstance()
                   .response(HttpStatus.NOT_FOUND,
                           null,
                           MessageUtil.DUPLICATE_USERNAME), HttpStatus.NOT_FOUND);
       }
    }

    @PostMapping("forget-password-email")
    public ResponseEntity forgetPasswordEmail(@RequestBody HashMap < String, Object > data) {
        Caretaker caretaker = caretakerService.findByEmail(data.get("email").toString());
        if (caretaker == null) {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND,
                            null,
                            MessageUtil.INCORRECT_EMAIL), HttpStatus.NOT_FOUND);
        } else {
            return EmailSender.getInstance().sendMail(caretaker.getEmail(), caretaker.getPassword(), sender);

        }
    }

    @PostMapping("forget-password-tell")
    public ResponseEntity forgetPasswordPhone(@RequestBody HashMap < String, Object > data) {
        Caretaker caretaker = caretakerService.findByTell(data.get("tell").toString());
        if (caretaker == null) {
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND,
                            null,
                            MessageUtil.INCORRECT_TELL), HttpStatus.NOT_FOUND);
        } else {
            return SmsSender.getInstance().sendSMSSimple(caretaker.getTell(), caretaker.getPassword());

        }
    }

    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody HashMap<String, Object> data) {
        Caretaker caretaker = CaretakerMapping.getInstance().getCaretaker(data, caretakerService, sexServices, provinceServices, districtServices, subDistrictServices, new Caretaker(), false);
        return new ResponseEntity<>(ApiResponse.getInstance()
                .response(HttpStatus.CREATED,
                        caretakerService.update(id, caretaker),
                        HttpStatus.CREATED.getReasonPhrase()), HttpStatus.CREATED);
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, caretakerService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
