package com.finalproject.walktogetherapi.controller.master;

import com.finalproject.walktogetherapi.entities.Reward;
import com.finalproject.walktogetherapi.entities.Test;
import com.finalproject.walktogetherapi.service.RewardService;
import com.finalproject.walktogetherapi.service.TestService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/api/v1/reward")
public class RewardController {
    private RewardService rewardService;

    @Autowired
    public RewardController(RewardService rewardService) {
        this.rewardService = rewardService;
    }

    @GetMapping("")
    public ResponseEntity getRewardAll() {
        List<Reward> rewardList = rewardService.findAll();
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, rewardList, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("getById/{id}")
    public ResponseEntity getTestId(@PathVariable Long id) {
        Reward reward = rewardService.findById(id);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, reward, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }


    @PostMapping("")
    public ResponseEntity createTest(@RequestBody HashMap<String, Object> data) {
        Reward reward = new Reward();
        reward.setMapId(data.get("mapId").toString());
        reward.setRewardName(data.get("rewardname").toString());
        reward.setLevel(data.get("lavel").toString());

        Reward result = rewardService.create(reward);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @DeleteMapping("deleteId/{id}")
    public ResponseEntity deleteId(@PathVariable Long id) {
        Reward result = rewardService.delete(id);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);

    }

    @PatchMapping("updateTest/{id}")
    public ResponseEntity updateTest(@RequestBody HashMap<String, Object> data, @PathVariable Long id) {
        Reward reward = rewardService.findById(id);

        if (data.get("mapId") != null) {
            reward.setMapId(data.get("mapId").toString());
        }
        if (data.get("rewardname") != null) {
            reward.setRewardName(data.get("rewardname").toString());
        }
        if (data.get("lavel") != null) {
            reward.setLevel(data.get("lavel").toString());
        }

        Reward result = rewardService.create(reward);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, result, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }
}
