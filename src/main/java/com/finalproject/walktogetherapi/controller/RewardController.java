package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.Reward;
import com.finalproject.walktogetherapi.entities.Test;
import com.finalproject.walktogetherapi.mapping.CollectionMapping;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.RewardService;
import com.finalproject.walktogetherapi.service.TestService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.hibernate.mapping.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/v1/reward")
public class RewardController {
    private RewardService rewardService;
    private PatientService patientService;

    @Autowired
    public RewardController(RewardService rewardService,
                            PatientService patientService) {
        this.rewardService = rewardService;
        this.patientService = patientService;
    }

    @GetMapping("")
    public ResponseEntity getRewardAll() {
        List<Reward> rewardList = rewardService.findAll();
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, rewardList, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("getById/{id}")
    public ResponseEntity getRewardId(@PathVariable Long id) {
        Reward reward = rewardService.findById(id);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, reward, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> data) {
        Reward reward = new Reward();
        reward.setRewardName(data.get("rewardName").toString());
        reward.setDetail(data.get("detail").toString());
        reward.setLevel(Integer.parseInt(data.get("level").toString()));

        Reward result = rewardService.create(reward);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("deleteId/{id}")
    public ResponseEntity deleteId(@PathVariable Long id) {
        Reward result = rewardService.delete(id);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);

    }

    @PatchMapping("updateTest/{id}")
    public ResponseEntity update(@RequestBody HashMap<String, Object> data, @PathVariable Long id) {
        Reward reward = rewardService.findById(id);

        if (data.get("rewardName") != null) {
            reward.setRewardName(data.get("rewardName").toString());
        }
        if (data.get("detail") != null) {
            reward.setDetail(data.get("detail").toString());
        }
        if (data.get("level") != null) {
            reward.setLevel(Integer.parseInt(data.get("level").toString()));
        }

        Reward result = rewardService.create(reward);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }
}
