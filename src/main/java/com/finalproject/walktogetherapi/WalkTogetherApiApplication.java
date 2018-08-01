package com.finalproject.walktogetherapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = "com.finalproject.walktogetherapi")
@SpringBootApplication
public class WalkTogetherApiApplication {

    private static Class applicationClass = WalkTogetherApiApplication.class;

    public static void main(String[] args) {
        SpringApplication.run(WalkTogetherApiApplication.class, args);
    }
}
