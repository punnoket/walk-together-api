package com.finalproject.walktogetherapi.controller.master;

import com.finalproject.walktogetherapi.entities.master.District;
import com.finalproject.walktogetherapi.service.master.DistrictServices;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/district")
public class DistrictController {

    private DistrictServices districtServices;

    @Autowired
    public DistrictController(DistrictServices districtServices) {
        this.districtServices = districtServices;
    }

    @GetMapping("/by-id-province/{id}")
    public ResponseEntity getByDistrictId(@PathVariable Long id) {
        List<District> districtList = districtServices.findByProvinceId(id);
        if (districtList != null) {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, districtList, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.OK);
        }

    }

}
