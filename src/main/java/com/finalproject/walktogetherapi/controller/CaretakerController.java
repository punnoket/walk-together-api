package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.mapping.CaretakerMapping;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.LogService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.master.*;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.LogUtil;
import com.finalproject.walktogetherapi.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/caretaker")
public class CaretakerController {
    private CaretakerService caretakerService;
    private PatientService patientService;
    private SexServices sexServices;
    private ProvinceServices provinceServices;
    private DistrictServices districtServices;
    private SubDistrictServices subDistrictServices;
    private EducationServices educationServices;
    private LogService logService;

    @Autowired
    public CaretakerController(CaretakerService caretakerService,
                               PatientService patientService,
                               SexServices sexServices,
                               ProvinceServices provinceServices,
                               DistrictServices districtServices,
                               LogService logService,
                               EducationServices educationServices,
                               SubDistrictServices subDistrictServices) {
        this.caretakerService = caretakerService;
        this.patientService = patientService;
        this.sexServices = sexServices;
        this.provinceServices = provinceServices;
        this.districtServices = districtServices;
        this.subDistrictServices = subDistrictServices;
        this.educationServices = educationServices;
        this.logService = logService;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, caretakerService.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, caretakerService.findById(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("by-caretaker-number/{caretakerNumber}")
    public ResponseEntity getByCaretakerNumber(@PathVariable String caretakerNumber) {
        Caretaker caretaker = caretakerService.findByNumberCaretaker(caretakerNumber);
        if (caretaker != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, caretaker, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, null, MessageUtil.NOT_FOUND_CARETAKER), HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(HttpServletRequest request, @RequestBody HashMap<String, Object> data) {
        LogUtil.getInstance().saveLog(request, data.toString(), logService);
        Caretaker caretaker = CaretakerMapping.getInstance().getCaretaker(data, caretakerService, patientService, sexServices, provinceServices, districtServices, subDistrictServices, new Caretaker(), educationServices, true);
        if (caretaker.getUserName() != null) {
            if (caretaker.getEmail() != null) {
                if (caretaker.getTell() != null)
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.CREATED,
                                    caretakerService.create(caretaker),
                                    HttpStatus.CREATED.getReasonPhrase()), HttpStatus.OK);
                else
                    return new ResponseEntity<>(ApiResponse.getInstance()
                            .response(HttpStatus.NOT_FOUND,
                                    null,
                                    MessageUtil.DUPLICATE_TELL), HttpStatus.OK);

            } else
                return new ResponseEntity<>(ApiResponse.getInstance()
                        .response(HttpStatus.NOT_FOUND,
                                null,
                                MessageUtil.DUPLICATE_EMAIL), HttpStatus.OK);

        } else
            return new ResponseEntity<>(ApiResponse.getInstance()
                    .response(HttpStatus.NOT_FOUND,
                            null,
                            MessageUtil.DUPLICATE_USERNAME), HttpStatus.OK);
    }

    @PatchMapping("{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody HashMap<String, Object> data) {
        Caretaker caretaker = CaretakerMapping.getInstance().getCaretaker(data, caretakerService, patientService, sexServices, provinceServices, districtServices, subDistrictServices, new Caretaker(), educationServices, false);
        return new ResponseEntity<>(ApiResponse.getInstance()
                .response(HttpStatus.CREATED,
                        caretakerService.update(id, caretaker),
                        HttpStatus.CREATED.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("{id}")
    public ResponseEntity delete(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, caretakerService.delete(id), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


}
