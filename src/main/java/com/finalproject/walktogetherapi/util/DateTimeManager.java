package com.finalproject.walktogetherapi.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class DateTimeManager {

    private static DateTimeManager instance;

    public static DateTimeManager getInstance() {
        if (instance == null) {
            instance = new DateTimeManager();
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

    public Date timeStringFormat(String input) {
        Calendar currentTime = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
        currentTime.set(Calendar.ZONE_OFFSET, TimeZone.getTimeZone("GMT+7").getRawOffset());
        Calendar calendar = Calendar.getInstance();
        String[] date = input.split(":");
        calendar.set(Calendar.HOUR_OF_DAY, Integer.parseInt(date[0]));
        calendar.set(Calendar.MINUTE, Integer.parseInt(date[1]));
        calendar.set(Calendar.MILLISECOND, 0);
        calendar.set(Calendar.DATE, currentTime.get(Calendar.DATE));
        calendar.set(Calendar.MONTH, currentTime.get(Calendar.MONTH));
        calendar.set(Calendar.YEAR, currentTime.get(Calendar.YEAR));
        return calendar.getTime();
    }

    public Date getCurrentTime() {
        Calendar currentTime = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
        currentTime.set(Calendar.ZONE_OFFSET, TimeZone.getTimeZone("GMT+7").getRawOffset());
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, currentTime.get(Calendar.HOUR_OF_DAY));
        calendar.set(Calendar.MINUTE, currentTime.get(Calendar.MINUTE));
        calendar.set(Calendar.MILLISECOND, currentTime.get(Calendar.MILLISECOND));
        calendar.set(Calendar.DATE, currentTime.get(Calendar.DATE));
        calendar.set(Calendar.MONTH, currentTime.get(Calendar.MONTH));
        calendar.set(Calendar.YEAR, currentTime.get(Calendar.YEAR));
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
        return date;
    }

    public boolean isDurationDay(String duration) {
        if (duration.equalsIgnoreCase("เช้ามืด")) {
            if (getCurrentTime().after(timeStringFormat("04:00")) &&
                    getCurrentTime().before(timeStringFormat("06:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("เช้า")) {
            if (getCurrentTime().after(timeStringFormat("06:00")) &&
                    getCurrentTime().before(timeStringFormat("09:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("สาย")) {
            if (getCurrentTime().after(timeStringFormat("09:00")) &&
                    getCurrentTime().before(timeStringFormat("12:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("เที่ยง")) {
            if (getCurrentTime().after(timeStringFormat("12:00")) &&
                    getCurrentTime().before(timeStringFormat("13:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("บ่าย")) {
            if (getCurrentTime().after(timeStringFormat("13:00")) &&
                    getCurrentTime().before(timeStringFormat("16:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("เย็น")) {
            if (getCurrentTime().after(timeStringFormat("16:00")) &&
                    getCurrentTime().before(timeStringFormat("18:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("หัวค่ำ")) {
            if (getCurrentTime().after(timeStringFormat("18:00")) &&
                    getCurrentTime().before(timeStringFormat("20:00"))) {
                return true;
            }
        } else if (duration.equalsIgnoreCase("กลางคืน")) {
            if (getCurrentTime().after(timeStringFormat("20:00")) &&
                    getCurrentTime().before(timeStringFormat("04:00"))) {
                return true;
            }
        } else {
            return false;
        }
        return false;
    }

    public boolean isTestEvaluation(Date lastDate) {
        Calendar currentTime = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
        currentTime.set(Calendar.ZONE_OFFSET, TimeZone.getTimeZone("GMT+7").getRawOffset());
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(lastDate);
        calendar.add(Calendar.DATE, 3);
        System.out.print(fullDateFormat(calendar.getTime())+" "+fullDateFormat(getCurrentTime()));
        return calendar.after(getCurrentTime());
    }
}
