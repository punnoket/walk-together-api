package com.finalproject.walktogetherapi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static com.finalproject.walktogetherapi.util.Constant.*;


@CrossOrigin
@RestController
@RequestMapping("image")
public class ViewImageController {

    @Autowired
    public ViewImageController() {
    }

    @GetMapping("/question/{category}/{number}/{id}/{fileName:.+}")
    public ResponseEntity<byte[]> viewImageQuestion(@PathVariable String category,
                                                    @PathVariable String number,
                                                    @PathVariable String id,
                                                    @PathVariable String fileName) throws IOException {

        String pathString = PATH_IMAGE_QUESTION
                + "/"
                + category
                + "/"
                + number
                + "/"
                + id
                + "/"
                + fileName;

        Path path = Paths.get(pathString);
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(data);

    }

    @GetMapping("/{type}/{id}/{fileName:.+}")
    public ResponseEntity<byte[]> viewImageProfile(@PathVariable String type,
                                                   @PathVariable String id,
                                                   @PathVariable String fileName) throws IOException {

        String pathString = "image"
                + "/"
                + type
                + "/"
                + id
                + "/"
                + fileName;

        Path path = Paths.get(pathString);
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(data);
    }

    @GetMapping("/{type}/qrcode/{number}/{fileName:.+}")
    public ResponseEntity<byte[]> viewQrCode(@PathVariable String type,
                                                   @PathVariable String number,
                                                   @PathVariable String fileName) throws IOException {

        String pathString = "image"
                + "/"
                + type
                + "/"
                + "qrcode"
                + "/"
                + number
                + "/"
                + fileName;

        Path path = Paths.get(pathString);
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(data);
    }

}
