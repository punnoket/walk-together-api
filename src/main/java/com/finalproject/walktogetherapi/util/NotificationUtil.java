package com.finalproject.walktogetherapi.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.web.client.RestTemplate;

public class NotificationUtil {

    private static NotificationUtil instance;

    public static NotificationUtil getInstance() {
        if (instance == null) {
            instance = new NotificationUtil();
        }
        return instance;
    }

    public int sendNotification(String to, String message) {
        String androidFcmKey = Constant.NOTIFICATION_API_KEY;
        String androidFcmUrl = Constant.FCM_URL;

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", "key=" + androidFcmKey);
        httpHeaders.set("Content-Type", "application/json;charset=UTF-8");
        JSONObject msg = new JSONObject();
        JSONObject json = new JSONObject();

        msg.put("title", "การแจ้งเตือน");
        msg.put("body", message);
        msg.put("notificationType", "Test");

        json.put("data", msg);
        json.put("to", to);
        json.put("priority", "high");

        try {
            HttpEntity<String> httpEntity = new HttpEntity<>(json.toString(), httpHeaders);
            String response = restTemplate.postForObject(androidFcmUrl, httpEntity, String.class);
            JsonObject responseJsonObject = new Gson().fromJson(response, JsonObject.class);
            return responseJsonObject.get("success").getAsInt();
        } catch (Exception e) {
            return 0;
        }
    }
}
