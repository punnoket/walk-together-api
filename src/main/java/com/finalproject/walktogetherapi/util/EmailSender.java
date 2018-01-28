package com.finalproject.walktogetherapi.util;

import com.finalproject.walktogetherapi.entities.Patient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.HashMap;

public class EmailSender {

    private static EmailSender instance;

    public static EmailSender getInstance() {
        if (instance == null) {
            instance = new EmailSender();
        }
        return instance;
    }

    public ResponseEntity sendMail(String email, String password, JavaMailSender sender) {
        try {
            MimeMessage message = sender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message);

            helper.setTo(email);
            helper.setText(MessageUtil.YOUR_PASSWORD+ password);
            helper.setSubject(MessageUtil.SUBJECT_EMAIL);
            sender.send(message);
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, null, MessageUtil.EMAIL_SEND_SUCCESS), HttpStatus.OK);

        } catch (MessagingException e) {
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
        }
    }
}

