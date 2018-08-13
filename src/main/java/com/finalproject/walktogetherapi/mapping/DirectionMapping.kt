package com.finalproject.walktogetherapi.mapping

import com.finalproject.walktogetherapi.util.Constant
import org.springframework.web.client.RestTemplate
import java.util.ArrayList

class DirectionMapping {

    fun getDirection(list: HashMap<String, Any>): String {
        val originHashMap = list["origin"] as HashMap<*, *>
        val destinationHashMap = list["destination"] as HashMap<*, *>
        val wayPointHashMap = list["wayPoint"] as ArrayList<java.util.HashMap<String, Any>>

        val originLatitude = originHashMap["latitude"].toString()
        val originLongitude = originHashMap["longitude"].toString()

        val destinationLatitude = destinationHashMap["latitude"].toString()
        val destinationLongitude = destinationHashMap["longitude"].toString()

        val wayPoint = wayPointHashMap.map { "${it["latitude"]},${it["longitude"]}" }

        val url = "https://maps.googleapis.com/maps/api/directions/json?" +
                "mode=walking&origin=$originLatitude,$originLongitude" +
                "&destination=$destinationLatitude,$destinationLongitude" +
                "&waypoints=${wayPoint.joinToString(separator = "|")}" +
                "&key=${Constant.GOOGLE_API_DIRECTION_KEY}"
        val restTemplate = RestTemplate()
        return restTemplate.getForObject(url, String::class.java)
    }

    companion object {

        private var instance: DirectionMapping? = null

        fun getInstance(): DirectionMapping {
            if (instance == null) {
                instance = DirectionMapping()
            }
            return instance as DirectionMapping
        }
    }
}
