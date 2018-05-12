package com.finalproject.walktogetherapi.util

import com.google.gson.Gson
import com.google.gson.JsonObject
import org.apache.commons.io.FilenameUtils
import org.json.simple.JSONObject
import org.springframework.http.HttpEntity
import org.springframework.http.HttpHeaders
import org.springframework.web.client.RestTemplate
import org.springframework.web.multipart.MultipartFile

import java.io.IOException
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

class DistanceUtil {

    fun distance(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
        val theta = lon1 - lon2
        var dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + (Math.cos(deg2rad(lat1))
                * Math.cos(deg2rad(lat2))
                * Math.cos(deg2rad(theta)))
        dist = Math.acos(dist)
        dist = dist * 180.0 / Math.PI
        dist *= 60.0 * 1.1515 * 1000.0
        return dist
    }

    private fun deg2rad(deg: Double): Double {
        return deg * Math.PI / 180.0
    }

    fun calculateDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Int {
        val restTemplate = RestTemplate()
        return try {
            val response = restTemplate.getForObject("https://maps.googleapis.com/maps/api/distancematrix/json?mode=walking&origins=$lat1,$lon1&destinations=$lat2,$lon2&key=${Constant.GOOGLE_API_KEY}", String::class.java)
            val responseJsonObject = Gson().fromJson(response, JsonObject::class.java)
            responseJsonObject.getAsJsonArray("rows").get(0).asJsonObject.getAsJsonArray("elements").get(0).asJsonObject.get("distance").asJsonObject.get("value").asInt
        } catch (e: Exception) {
            0
        }
    }

    companion object {

        private var instance: DistanceUtil? = null

        fun getInstance(): DistanceUtil {
            if (instance == null) {
                instance = DistanceUtil()
            }
            return instance as DistanceUtil
        }
    }
}

