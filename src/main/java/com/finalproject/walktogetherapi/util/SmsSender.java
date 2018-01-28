package com.finalproject.walktogetherapi.util;

import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static com.finalproject.walktogetherapi.util.Constant.*;

public class SmsSender {

    private static SmsSender instance;
    public static SmsSender getInstance() {
        if (instance == null) {
            instance = new SmsSender();
        }
        return instance;
    }
    public ResponseEntity sendSMS(String tell, String password) {
        try {
            TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

            List<NameValuePair> params = new ArrayList<>();
            params.add(new BasicNameValuePair("Body", MessageUtil.YOUR_PASSWORD+password));
            params.add(new BasicNameValuePair("To", THAILAND_PHONE+tell)); //Add real number here
            params.add(new BasicNameValuePair("From", TWILIO_NUMBER));

            MessageFactory messageFactory = client.getAccount().getMessageFactory();
            Message message = messageFactory.create(params);
            System.out.println(message.getSid());
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, null, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
        }
        catch (TwilioRestException e) {
            System.out.println(e.getErrorMessage());
            return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.NOT_FOUND, null, HttpStatus.NOT_FOUND.getReasonPhrase()), HttpStatus.NOT_FOUND);
        }
    }

    public ResponseEntity sendSMSSimple(String tell, String password) {
        HashMap<String, Object> data = new HashMap<>();
        data.put("tell", tell);
        data.put("password", password);
        return new ResponseEntity<>(ApiResponse.getInstance().response(HttpStatus.OK, data, HttpStatus.OK.getReasonPhrase()), HttpStatus.OK);
    }

}
