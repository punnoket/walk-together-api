package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.*;
import com.finalproject.walktogetherapi.mapping.CollectionMapping;
import com.finalproject.walktogetherapi.service.*;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/api/v1/collection")
public class CollectionController {
    private PatientService patientService;
    private RewardService rewardService;
    private CollectionService collectionService;
    private LogService logService;

    @Autowired
    public CollectionController(RewardService rewardService,
                                PatientService patientService,
                                LogService logService, CollectionService collectionService) {
        this.patientService = patientService;
        this.rewardService = rewardService;
        this.collectionService = collectionService;
        this.logService = logService;
    }

    @GetMapping("")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                collectionService.findAll(),
                HttpStatus.OK.getReasonPhrase()),
                HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ResponseEntity getById(@PathVariable Long id) {
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                collectionService.findById(id),
                HttpStatus.OK.getReasonPhrase()),
                HttpStatus.OK);
    }

    @PostMapping("")
    public ResponseEntity create(@RequestBody HashMap<String, Object> data) {
        Collection collection = new Collection();
        Patient patient = patientService.findById(Long.parseLong(data.get("idPatient").toString()));
        Reward reward = rewardService.findById(Long.parseLong(data.get("idReward").toString()));
        collection.setPatient(patient);
        collection.setReward(reward);
        return new ResponseEntity<>(ApiResponse.getInstance()
                .response(HttpStatus.OK,
                        collectionService.create(collection),
                        HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

    @GetMapping("reward-by-patient/album/{id}")
    public ResponseEntity getAlbum(HttpServletRequest request, @PathVariable Long id,
                                   @RequestParam(required = false, defaultValue = "2", value = "range") int range) {
        List<Collection> collectionList = collectionService.findByPatientId(id);
        if (collectionList != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    CollectionMapping.Companion.getInstance().getAlbum(patientService.findById(id), collectionService, range),
                    HttpStatus.OK.getReasonPhrase()),
                    HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    null,
                    MessageUtil.NOT_FOUND_CARETAKER),
                    HttpStatus.OK);
    }

    @GetMapping("reward-by-patient/{id}")
    public ResponseEntity getRewardByIdPatient(@PathVariable Long id) {
        List<Collection> collectionList = collectionService.findByPatientId(id);
        if (collectionList != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    CollectionMapping.Companion.getInstance().getRewardList(collectionList),
                    HttpStatus.OK.getReasonPhrase()),
                    HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    null,
                    MessageUtil.NOT_FOUND_CARETAKER),
                    HttpStatus.OK);
    }

    @GetMapping("{id}/{beginId}/{endId}")
    public ResponseEntity get(HttpServletRequest request, @PathVariable Long id, @PathVariable int beginId, @PathVariable int endId) {
        List<Collection> collectionList = collectionService.findByRangeLevel(id, beginId, endId);
        if (collectionList != null)
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    collectionList,
                    HttpStatus.OK.getReasonPhrase()),
                    HttpStatus.OK);
        else
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                    null,
                    MessageUtil.NOT_FOUND_CARETAKER),
                    HttpStatus.OK);
    }

    @GetMapping("reward-by-level/{id}")
    public ResponseEntity getRewardByLevelPatient(HttpServletRequest request, @PathVariable Long id) {
        Patient patient = patientService.findById(id);
        Reward reward = CollectionMapping.Companion.getInstance().randomReward(patient.getLevel(), rewardService.findAll());
        CollectionMapping.Companion.getInstance().receiveReward(collectionService, patient, reward);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK,
                reward,
                HttpStatus.OK.getReasonPhrase()),
                HttpStatus.OK);
    }
}
