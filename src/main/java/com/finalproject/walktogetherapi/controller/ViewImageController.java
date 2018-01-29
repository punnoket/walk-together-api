package com.finalproject.walktogetherapi.controller;

import com.finalproject.walktogetherapi.entities.Caretaker;
import com.finalproject.walktogetherapi.entities.Patient;
import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import com.finalproject.walktogetherapi.service.CaretakerService;
import com.finalproject.walktogetherapi.service.PatientService;
import com.finalproject.walktogetherapi.service.QuestionEvaluationService;
import com.finalproject.walktogetherapi.util.ApiResponse;
import com.finalproject.walktogetherapi.util.ImageUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.FileTypeMap;
import java.io.File;
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
                + type
                + "/"
                + id
                + "/"
                + fileName;

        Path path = Paths.get(pathString);
        byte[] data = Files.readAllBytes(path);
        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(data);

    }

}
