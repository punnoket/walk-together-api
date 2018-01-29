package com.finalproject.walktogetherapi.util;

import com.finalproject.walktogetherapi.entities.evaluation.QuestionEvaluation;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

public class ImageUpload {

    private static ImageUpload instance;

    public static ImageUpload getInstance() {
        if (instance == null) {
            instance = new ImageUpload();
        }
        return instance;
    }

    public String uploadImage(String pathString, MultipartFile file) {
        try {
            Files.createDirectories(Paths.get(pathString));
            byte[] bytes = file.getBytes();
            Path path = Paths.get(pathString + new Date().getTime() + "." + FilenameUtils.getExtension(file.getOriginalFilename()));
            Files.write(path, bytes);
            return path.toString();

        } catch (IOException e) {
            return null;
        }
    }
}

