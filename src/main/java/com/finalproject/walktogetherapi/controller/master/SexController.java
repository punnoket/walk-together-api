package com.finalproject.walktogetherapi.controller.master;

import com.finalproject.walktogetherapi.service.master.SexServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/sex")
public class SexController {
    private SexServices sexServices;

    @Autowired
    public SexController(SexServices sexServices) {
        this.sexServices = sexServices;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, sexServices.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }
}
