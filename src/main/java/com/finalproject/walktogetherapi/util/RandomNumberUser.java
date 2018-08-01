package com.finalproject.walktogetherapi.util;

import java.util.Random;
import java.util.UUID;

public class RandomNumberUser {

    private static RandomNumberUser instance;

    public static RandomNumberUser getInstance() {
        if (instance == null) {
            instance = new RandomNumberUser();
        }
        return instance;
    }

    public String getNumberPatient() {
        final String characters = "1234567890";
        StringBuilder result = new StringBuilder();
        int length = 6;
        while (length > 0) {
            Random rand = new Random();
            result.append(characters.charAt(rand.nextInt(characters.length())));
            length--;
        }
        return "P" + result.toString();

    }

    public String getNumberCaretaker() {
        final String characters = "1234567890";
        StringBuilder result = new StringBuilder();
        int length = 6;
        while (length > 0) {
            Random rand = new Random();
            result.append(characters.charAt(rand.nextInt(characters.length())));
            length--;
        }
        return "C" + result.toString();
    }

    public String resetPassword() {
        String password = UUID.randomUUID().toString();
        return password.split("-")[0].substring(2);
    }
}

