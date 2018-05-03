package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.*;
import com.finalproject.walktogetherapi.service.CollectionService;
import com.finalproject.walktogetherapi.service.RewardService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

public class CollectionMapping {

    private static CollectionMapping instance;

    public static CollectionMapping getInstance() {
        if (instance == null) {
            instance = new CollectionMapping();
        }
        return instance;
    }

    public List<HashMap<String, Object>> getRewardList(List<Collection> collectionList) {
        List<HashMap<String, Object>> map = new ArrayList<>();
        for (Collection collection : collectionList) {
            HashMap<String, Object> objectHashMap = new HashMap<>();
            objectHashMap.put("reward", collection.getReward());
            objectHashMap.put("isReceive", collection.isReceive());
            objectHashMap.put("isLock", collection.isLock());
            map.add(objectHashMap);
        }
        return map;
    }

    public Reward randomReward(int level, List<Reward> rewardList) {
        List<Reward> result = new ArrayList<>();
        for (Reward reward : rewardList) {
            if (reward.getLevel() <= level)
                result.add(reward);
        }
        return result.get(new Random().nextInt(result.size()));
    }

    public void addCollection(RewardService rewardService, CollectionService collectionService, Patient patient) {
        List<Reward> rewardList = rewardService.findAll();
        for (Reward reward : rewardList) {
                Collection collection = new Collection();
                collection.setReceive(false);
                collection.setLock(true);
                collection.setPatient(patient);
                collection.setReward(reward);
                collectionService.create(collection);
            }
    }

    public void unlockReward(CollectionService collectionService, Patient patient) {
        List<Collection> collectionList = collectionService.findByPatientId(patient.getId());
        for (Collection collection : collectionList) {
            collection.setLock(false);
            collectionService.update(collection.getId(), collection);
        }
    }
}
