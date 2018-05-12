package com.finalproject.walktogetherapi.mapping

import com.finalproject.walktogetherapi.entities.mission.Map
import com.finalproject.walktogetherapi.util.DistanceUtil

class MapMissionMapping {

    fun getMapNearPatient(mapList: List<Map>, lat: Double, long: Double): List<Map> {
        for (map in mapList) {
            var dist = DistanceUtil.getInstance().calculateDistance(lat, long, map.latitude, map.longitude)
            if (dist != 0)
                map.dist = dist.toDouble()
            else {
                print("reject")
                for (m in mapList) {
                    dist = DistanceUtil.getInstance().distance(lat, long, m.latitude, m.longitude).toInt()
                    m.dist = dist.toDouble()
                }
                return mapList.sortedByDescending { it.dist }
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
