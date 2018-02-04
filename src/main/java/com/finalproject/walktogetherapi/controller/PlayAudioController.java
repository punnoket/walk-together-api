package com.finalproject.walktogetherapi.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static com.finalproject.walktogetherapi.util.Constant.PATH_AUDIO_QUESTION;
import static com.finalproject.walktogetherapi.util.Constant.PATH_IMAGE_QUESTION;


@CrossOrigin
@RestController
@RequestMapping("audio")
public class PlayAudioController {

    @Autowired
    public PlayAudioController() {
    }

    @GetMapping("/question/{category}/{number}/{id}/{fileName:.+}")
    public ResponseEntity<InputStreamResource> viewImageQuestion(@PathVariable String category,
                                                                 @PathVariable String number,
                                                                 @PathVariable String id,
                                                                 @PathVariable String fileName,
                                                                 HttpServletResponse response) throws IOException {

        String pathString = PATH_AUDIO_QUESTION
                + "/"
                + category
                + "/"
                + number
                + "/"
                + id
                + "/"
                + fileName;

        FileSystemResource file = new FileSystemResource(pathString);
        return ResponseEntity
                .ok()
                .contentLength(file.contentLength())
                .contentType(
                        MediaType.parseMediaType("audio/mpeg"))
                .body(new InputStreamResource(file.getInputStream()));
    }

   /* @GetMapping("/question/{category}/{number}/{id}/{fileName:.+}")
    public ResponseEntity<byte[]>  viewImageQuestion(@PathVariable String category,
                                                                 @PathVariable String number,
                                                                 @PathVariable String id,
                                                                 @PathVariable String fileName) throws IOException {

        String pathString = PATH_AUDIO_QUESTION
                + "/"
                + category
                + "/"
                + number
                + "/"
                + id
                + "/"
                + fileName;

        Path pathXLS = Paths.get(pathString);
        byte[] dataBytes = Files.readAllBytes(pathXLS);
        HttpHeaders headers = new HttpHeaders();
        headers.set("charset", "utf-8");
        headers.setContentType(MediaType.valueOf("audio/wave"));
        headers.setContentLength(dataBytes.length);
        headers.set("Content-disposition", "attachment; filename=" + number + ".wav");

        return new ResponseEntity<>(dataBytes, headers, HttpStatus.OK);
    }*/
}