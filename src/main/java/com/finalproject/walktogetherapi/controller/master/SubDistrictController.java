package com.finalproject.walktogetherapi.controller.master;

import com.finalproject.walktogetherapi.entities.master.SubDistrict;
import com.finalproject.walktogetherapi.service.master.SubDistrictServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/sub-district")
public class SubDistrictController {
    private SubDistrictServices subDistrictServices;

    @Autowired
    public SubDistrictController(SubDistrictServices subDistrictServices) {
        this.subDistrictServices = subDistrictServices;
    }

    @GetMapping("/by-id-district/{id}")
    public ResponseEntity getByDistrictId(@PathVariable Long id) {
        List<SubDistrict> subDistricts = subDistrictServices.findByDistrictId(id);
        if (subDistricts != null) {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, subDistricts, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.OK);
        }

    }
}
