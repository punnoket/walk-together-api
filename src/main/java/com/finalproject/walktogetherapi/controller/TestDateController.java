package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.DateTimeManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/test-date")
public class TestDateController {

    @Autowired
    public TestDateController() {
    }

    @GetMapping("")
    public ResponseEntity uploadImageQuestion() {
        HashMap<String, Object> date = new HashMap<>();
        date.put("fullDateFormat", DateTimeManager.getInstance().fullDateFormat(new Date()));
        date.put("getDay", DateTimeManager.getInstance().getDay());
        date.put("getMonth", DateTimeManager.getInstance().getMonth());
        date.put("getDayName", DateTimeManager.getInstance().getDayName());
        date.put("newDate",new Date().toString());
        date.put("timeStringFormat16:00", DateTimeManager.getInstance().timeStringFormat("16:00").toString());
        date.put("getCurrentTime", DateTimeManager.getInstance().getCurrentTime().toString());
        date.put("isDuration", DateTimeManager.getInstance().isDurationDay("เช้ามืด"));
        date.put("isTest", DateTimeManager.getInstance().isTestEvaluation(DateTimeManager.getInstance().getCurrentTime()));
        date.put("log", DateTimeManager.getInstance().logDateFormat(DateTimeManager.getInstance().getCurrentTime()));
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, date, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
    }

}
