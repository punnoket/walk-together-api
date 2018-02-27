package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@CrossOrigin
@RestController
@RequestMapping("/api/v1/log")
public class LogController {
    private LogService logService;
    private ResourceLoader resourceLoader;

    @Autowired
    public LogController(LogService logService, ResourceLoader resourceLoader) {
        this.logService = logService;
        this.resourceLoader = resourceLoader;
    }

    @GetMapping("")
    public ResponseEntity loginPatient() {
        return new ResponseEntity<>(logService.findAll(), HttpStatus.OK);

    }

    @GetMapping("/web/log.html")
    public ResponseEntity<byte[]> web() throws IOException {
        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("templates/log.html").getFile());
        Path path = Paths.get(file.getPath());
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.TEXT_HTML).body(data);


    }

}
