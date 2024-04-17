package com.cinema.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateFormatter {

    private static final SimpleDateFormat sdfyMd = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat sdfdMy = new SimpleDateFormat("dd-MM-yyyy");
    private static final SimpleDateFormat sdfyMdTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final SimpleDateFormat sdfdMyTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

    private static final SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");

    public static Date parse(String date) throws ParseException {
        return sdfyMd.parse(sdfyMd.format(sdfdMy.parse(date)));
    }

    public static Date parseYMDTime(String date) {
        try {
            Date d = sdfdMyTime.parse(date);
            return sdfyMdTime.parse(sdfyMdTime.format(d));
        } catch (ParseException e) {
            return null;
        }

    }


    public static Date parsedMyTime(String date) {
        try {
            return sdfdMyTime.parse(date);
        } catch (ParseException e) {
            return null;
        }
    }

    public static String toStringDateTime(Date date) {
        return sdfdMyTime.format(date);
    }

    public static String toStringDate(Date date) {
        return sdfdMy.format(date);
    }

    public static Date datetoDatedMy(Date date) {
        try {
            return sdfdMyTime.parse(sdfdMyTime.format(date));
        } catch (ParseException e) {
            return null;
        }
    }

    public static String parseTime(Date date){
        return time.format(date);
    }

}
