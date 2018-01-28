package com.finalproject.walktogetherapi.util;

import org.springframework.http.HttpStatus;

import java.util.HashMap;
import java.util.List;

public class ApiResponse {

    private static ApiResponse instance;

    public static ApiResponse getInstance() {
        if (instance == null) {
            instance = new ApiResponse();
        }
        return instance;
    }

    public HashMap<String, Object> response(HttpStatus status, Object o, String message) {
        return this.mappingJsonResponse(status.value(), o, message);
    }

    private HashMap<String, Object> mappingJsonResponse(int status, Object o, String message) {
        HashMap<String, Object> response = new HashMap<>();
        response.put("status", status);
        response.put("data", o);
        response.put("message", message);
        return response;
    }
}

