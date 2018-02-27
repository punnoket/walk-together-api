package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Log;
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

    @GetMapping("/web/log.html")
    public ResponseEntity<byte[]> web() throws IOException {
        ClassLoader classLoader = getClass().getClassLoader();
        File file = new File(classLoader.getResource("templates/log.html").getFile());
        Path path = Paths.get(file.getPath());
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.TEXT_HTML).body(data);


    }

}
