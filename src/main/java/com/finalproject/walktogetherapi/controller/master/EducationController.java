package com.finalproject.walktogetherapi.controller.master;

import com.finalproject.walktogetherapi.service.master.EducationServices;
import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/education")
public class EducationController {
    private EducationServices educationServices;

    @Autowired
    public EducationController(EducationServices educationServices) {
        this.educationServices = educationServices;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, educationServices.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }
}
