package com.finalproject.walktogetherapi.mapping;

import com.finalproject.walktogetherapi.entities.*;

import java.util.ArrayList;
import java.util.List;

public class CollectionMapping {

    private static CollectionMapping instance;

    public static CollectionMapping getInstance() {
        if (instance == null) {
            instance = new CollectionMapping();
        }
        return instance;
    }

    public Collection acceptMatching(Reward reward,
                                     Patient patient) {

        Collection collection = new Collection();
        collection.setPatient(patient);
        collection.setReward(reward);
        return collection;
    }

    public List<Reward> getRewardList(List<Collection> collectionList) {
        List<Reward> rewardList = new ArrayList<>();
        for (Collection collection : collectionList) {
            rewardList.add(collection.getReward()); }
        return rewardList;
    }

}
