package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Log;
import com.finalproject.walktogetherapi.service.LogService;
import org.codehaus.jettison.json.JSONException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/log")
public class LogController {
    private LogService logService;

    @Autowired
    public LogController(LogService logService) {
        this.logService = logService;
    }

    @GetMapping("")
    public ResponseEntity loginPatient() {
        List<Log> logList = logService.findLogLimit();
        return new ResponseEntity<>(logList, HttpStatus.OK);

    }

    @GetMapping("test")
    public void test() {
        String androidFcmKey="AAAAt1XelqE:APA91bEFgM9QMvstMrdyhSHGozVV4jGu5dE6MMAXuEqxm7ayv7I9K3luF5I7Fwvfqu4tUlNmrjXe6j0qbeVHaoi6gQLbu188VI774SkxMV9kbfW0vQv-eM2UfZeOH3k21A0PaNpt4CKb";
        String androidFcmUrl="https://fcm.googleapis.com/fcm/send";

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.set("Authorization", "key=" + androidFcmKey);
        httpHeaders.set("Content-Type", "application/json");
        JSONObject msg = new JSONObject();
        JSONObject json = new JSONObject();

        msg.put("title", "Title");
        msg.put("body", "Message");
        msg.put("notificationType", "Test");

        json.put("data", msg);
        json.put("to", "cdNZCwcMl3g:APA91bHA2ojxwQN9nVS7xLI2dGq-JNQdrAhDm45r0b2j6wzAVt9WeEIiBFgTFWz5Rj9rtV8LIf6_WKfMhIMyJQ9lM6ZhZWbbiZZI2DJTA-TZv7NZTnPREIU-Tf9bolB7xQ5qNbSJI2Ui");

        HttpEntity<String> httpEntity = new HttpEntity<String>(json.toString(),httpHeaders);
        String response = restTemplate.postForObject(androidFcmUrl,httpEntity,String.class);
        System.out.println(response);

    }

    @GetMapping("/web/log.html")
    public ResponseEntity<byte[]> web() throws IOException {
        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("templates/log.html").getFile());
        Path path = Paths.get(file.getPath());
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.TEXT_HTML).body(data);
    }

    @GetMapping("/web/bubbly.html")
    public ResponseEntity<byte[]> bubbly() throws IOException {
        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("templates/Bubbly.html").getFile());
        Path path = Paths.get(file.getPath());
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.TEXT_HTML).body(data);
    }

}
