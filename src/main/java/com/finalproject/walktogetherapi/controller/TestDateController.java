package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.DateTHFormat;
import com.finalproject.walktogetherapi.util.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.HashMap;

import static com.finalproject.walktogetherapi.util.Constant.PATH_AUDIO_QUESTION;


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
        date.put("full",DateTHFormat.getInstance().fullDateFormat(new Date()));
        date.put("day",DateTHFormat.getInstance().getDay());
        date.put("month",DateTHFormat.getInstance().getMonth());
        date.put("dayOfWeek",DateTHFormat.getInstance().getDayName());
        date.put("date",new Date().toString());
        date.put("time",DateTHFormat.getInstance().timeStringFormat("16:00").toString());
        date.put("currentTime",DateTHFormat.getInstance().getCurrentTime().toString());
        date.put("isDuration",DateTHFormat.getInstance().isDurationDay("เช้ามืด"));
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, date, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
    }

}
