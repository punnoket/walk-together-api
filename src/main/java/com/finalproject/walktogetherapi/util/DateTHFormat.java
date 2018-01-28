package com.finalproject.walktogetherapi.util;

import java.sql.Timestamp;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class DateTHFormat {

    private static DateTHFormat instance;

    public static DateTHFormat getInstance() {
        if (instance == null) {
            instance = new DateTHFormat();
        }
        return instance;
    }


    public String normalDateFormat(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd MMMM yyyy", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("UTC"));
        return formatter.format(date);
    }

    public String reportInformDateFormat(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy", new Locale("th", "TH"));
        return formatter.format(date);
    }

    public String reportInformTimeFormat(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm", new Locale("th", "TH"));
        return formatter.format(date);
    }

    public String birthDayToAge(String input) {
        Date birthDay = stringToDate(input);
        Date dateNow = new Date();
        Long dateTime = dateNow.getTime() - birthDay.getTime();
        Long year = Math.abs(dateTime / 1000 / 60 / 60 / 24);
        return String.valueOf(year / 365);
    }

    public String birthDayMissingDayToAgeMissing(Date birthDay, Date missingDate) {
        Long dateTime = missingDate.getTime() - birthDay.getTime();
        Long year = Math.abs(dateTime / 1000 / 60 / 60 / 24);
        return String.valueOf(year / 365);
    }

    private Date stringToDate(String dateString) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd MMMM yyyy", new Locale("th", "TH"));
        try {
            return formatter.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return new Date();
    }
}
