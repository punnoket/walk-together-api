package com.finalproject.walktogetherapi.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE MMMM yyyy", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return formatter.format(date);
    }

    public String fullDateFormat(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm d EEEE MMMM yyyy", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return formatter.format(date);
    }

    public String slashDateFormat(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yy", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return formatter.format(date);
    }

    public String timeFormat(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return formatter.format(date);
    }

    private Date timeStringFormat(String input) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
        String[] date = input.split(":");
        calendar.set(Calendar.HOUR_OF_DAY,Integer.parseInt(date[0]));
        calendar.set(Calendar.MINUTE,0);
        calendar.set(Calendar.SECOND,0);
        calendar.set(Calendar.MILLISECOND,0);
        return calendar.getTime();
    }

    public Date timeStringFormatTest(String input) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
        String[] date = input.split(":");
        calendar.set(Calendar.HOUR_OF_DAY,Integer.parseInt(date[0]));
        calendar.set(Calendar.MINUTE,0);
        calendar.set(Calendar.SECOND,0);
        calendar.set(Calendar.MILLISECOND,0);
        return calendar.getTime();
    }

    public String birthDayToAge(String input) {
        Date birthDay = stringToDate(input);
        Date dateNow = new Date();
        Long dateTime = dateNow.getTime() - birthDay.getTime();
        Long year = Math.abs(dateTime / 1000 / 60 / 60 / 24);
        return String.valueOf(year / 365);
    }

    private Date stringToDate(String dateString) {
        SimpleDateFormat formatter = new SimpleDateFormat("dd MMMM yyyy", new Locale("th", "TH"));
        try {
            formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
            return formatter.parse(dateString);
        } catch (ParseException e) {
            return new Date();
        }
    }

    public String getDayName() {
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return returnResult(formatter.format(new Date()));
    }

    public String getDay() {
        SimpleDateFormat formatter = new SimpleDateFormat("d", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return returnResult(formatter.format(new Date()));
    }

    public String getMonth() {
        SimpleDateFormat formatter = new SimpleDateFormat("MMMM", new Locale("th", "TH"));
        formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
        return returnResult(formatter.format(new Date()));
    }

    private String returnResult(String date) {
        System.out.print(date);
        return date;
    }

    public boolean isDurationDay(String duration) {
        if (duration.equalsIgnoreCase("เช้ามืด")) {
            if (new Date().after(timeStringFormat("04:00")) &&
                    new Date().before(timeStringFormat("06:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("เช้า")) {
            if (new Date().after(timeStringFormat("06:00")) &&
                    new Date().before(timeStringFormat("09:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("สาย")) {
            if (new Date().after(timeStringFormat("09:00")) &&
                    new Date().before(timeStringFormat("12:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("เที่ยง")) {
            if (new Date().after(timeStringFormat("12:00")) &&
                    new Date().before(timeStringFormat("13:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("บ่าย")) {
            if (new Date().after(timeStringFormat("13:00")) &&
                    new Date().before(timeStringFormat("16:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("เย็น")) {
            if (new Date().after(timeStringFormat("16:00")) &&
                    new Date().before(timeStringFormat("18:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("หัวค่ำ")) {
            if (new Date().after(timeStringFormat("18:00")) &&
                    new Date().before(timeStringFormat("20:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("กลางคืน")) {
            if (new Date().after(timeStringFormat("20:00")) &&
                    new Date().before(timeStringFormat("04:00"))) {
                return true;
            }
        } else {
            return false;
        }
        return false;
    }
}
