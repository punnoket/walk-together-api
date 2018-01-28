package com.finalproject.walktogetherapi.util;

import java.sql.Timestamp;
import java.text.Format;
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

    public String setDateFormat(Date date) {
        Format formatter = new SimpleDateFormat("EEEE ที่ dd เดือน MMMM พ.ศ. yyyy", new Locale("th", "TH"));
        return formatter.format(date);
    }

    public String reportDateFormat(Long start, Long end) {
        Timestamp startTimestamp = new Timestamp(start);
        Timestamp endTimestamp = new Timestamp(end);
        SimpleDateFormat formatter = new SimpleDateFormat("dd MMMM yyyy", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("UTC"));
        return formatter.format(startTimestamp) + " ถึง " + formatter.format(endTimestamp);
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
}
