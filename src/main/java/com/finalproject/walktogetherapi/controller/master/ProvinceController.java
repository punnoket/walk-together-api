package com.finalproject.walktogetherapi.controller.master;

import com.finalproject.walktogetherapi.service.master.ProvinceServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api/v1/province")
public class ProvinceController {

    private ProvinceServices provinceServices;

    @Autowired
    public ProvinceController(ProvinceServices provinceServices) {
        this.provinceServices = provinceServices;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, provinceServices.findAll(), HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
