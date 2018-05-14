package com.finalproject.walktogetherapi.mapping

import com.finalproject.walktogetherapi.entities.*
import com.finalproject.walktogetherapi.entities.Collection
import com.finalproject.walktogetherapi.service.CollectionService
import com.finalproject.walktogetherapi.service.RewardService

import java.util.ArrayList
import java.util.HashMap
import java.util.Random

class CollectionMapping {

    fun getAlbum(patient: Patient, collectionService: CollectionService, range: Int): List<HashMap<String, Any>> {
        val map = ArrayList<HashMap<String, Any>>()

        var i = 1
        while (i <= 30 - range) {
            val j = i + range
            val objectHashMap = HashMap<String, Any>()
            val rewardList = collectionService.findByRangeLevel(patient.id, i, j).sortedWith(compareBy({ it.reward.level }))
            objectHashMap["albumName"] = "เลเวล $i-$j"
            objectHashMap["collection"] = rewardList
            objectHashMap["isLock"] = !(patient.level > j || patient.level in i..j)
            objectHashMap["previewImage"] = rewardList.filter {
                it.reward.level == i || it.reward.level == j
            }.take(4)
            map.add(objectHashMap)
            i += (range + 1)
        }
        return map
    }

    fun getRewardList(collectionList: List<Collection>): List<HashMap<String, Any>> {
        val map = ArrayList<HashMap<String, Any>>()
        for (collection in collectionList) {
            val objectHashMap = HashMap<String, Any>()
            objectHashMap["reward"] = collection.reward
            objectHashMap["isReceive"] = collection.isReceive
            objectHashMap["isLock"] = collection.isLock
            map.add(objectHashMap)
        }
        return map
    }


    fun randomReward(level: Int, rewardList: List<Reward>): Reward {
        val result = rewardList.filterTo(ArrayList()) { it.level <= level }
        return result[Random().nextInt(result.size)]
    }

    fun addCollection(rewardService: RewardService, collectionService: CollectionService, patient: Patient) {
        val rewardList = rewardService.findAll()
        for (reward in rewardList) {
            val collection = Collection()
            collection.isReceive = false
            collection.isLock = reward.level != 1
            collection.patient = patient
            collection.reward = reward
            collectionService.create(collection)
        }
    }

    fun receiveReward(collectionService: CollectionService, patient: Patient, reward: Reward) {
        val collection = collectionService.findByRewardId(reward.id, patient.id)
        collection.isReceive = true
        collection.isLock = false
        collectionService.update(collection.id, collection)
    }

    fun unlockReward(collectionService: CollectionService, patient: Patient) {
        val collectionList = collectionService.findByPatientId(patient.id)
        for (collection in collectionList) {
            if (patient.level >= collection.reward.level) {
                collection.isLock = false
                collectionService.update(collection.id, collection)
            }
        }
    }

    companion object {

        private var instance: CollectionMapping? = null

        fun getInstance(): CollectionMapping {
            if (instance == null) {
                instance = CollectionMapping()
            }
            return instance as CollectionMapping
        }
    }
}
