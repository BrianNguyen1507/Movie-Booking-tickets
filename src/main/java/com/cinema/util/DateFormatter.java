package com.cinema.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DateFormatter {

	private static SimpleDateFormat sdfyMd = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdfdMy = new SimpleDateFormat("dd-MM-yyyy");
	private static SimpleDateFormat sdfyMdTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	private static SimpleDateFormat sdfdMyTime = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss"); 
	
	public static Date parse(String date) throws ParseException {
		return sdfyMd.parse(sdfyMd.format(sdfdMy.parse(date)));
	}
	public static Date parseYMDTime(String date) {
		try {
			Date d = sdfdMyTime.parse(date);
			return sdfyMdTime.parse(sdfyMdTime.format(d));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static Date parseTime(String date) {
		try {
			return sdfdMyTime.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
