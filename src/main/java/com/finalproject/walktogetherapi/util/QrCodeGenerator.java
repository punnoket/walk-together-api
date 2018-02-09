package com.finalproject.walktogetherapi.util;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class QrCodeGenerator {

    private static QrCodeGenerator instance;

    public static QrCodeGenerator getInstance() {
        if (instance == null) {
            instance = new QrCodeGenerator();
        }
        return instance;
    }

    public String generatorQrCode(String path, String numberString){
        ByteArrayOutputStream bout =
                QRCode.from(numberString)
                        .withSize(250, 250)
                        .to(ImageType.PNG)
                        .stream();
        try {
            Files.createDirectories(Paths.get(path));
            OutputStream out = new FileOutputStream(path+numberString+".png");
            bout.writeTo(out);
            out.flush();
            out.close();
            return path+numberString+".png";

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }
}
