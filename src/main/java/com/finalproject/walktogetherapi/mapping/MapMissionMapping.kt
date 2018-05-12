package com.finalproject.walktogetherapi.mapping

import com.finalproject.walktogetherapi.entities.mission.Map
import com.finalproject.walktogetherapi.util.DistanceUtil

class MapMissionMapping {

    fun getMapNearPatient(mapList: List<Map>, lat: Double, long: Double): List<Map> {
        for (map in mapList) {
            map.dist = DistanceUtil.getInstance().calculateDistance(lat, long, map.latitude, map.longitude).toDouble()
        }
        val result = mapList.sortedBy { it.dist }
        result.forEach {
            if (it.dist.toInt() == 0) {
                for (map in mapList) {
                    map.dist = DistanceUtil.getInstance().distance(lat, long, map.latitude, map.longitude)
                }
                return@forEach
            }
        }
        return mapList.sortedBy { it.dist }
    }

    companion object {

        private var instance: MapMissionMapping? = null

        fun getInstance(): MapMissionMapping {
            if (instance == null) {
                instance = MapMissionMapping()
            }
            return instance as MapMissionMapping
        }
    }
}
