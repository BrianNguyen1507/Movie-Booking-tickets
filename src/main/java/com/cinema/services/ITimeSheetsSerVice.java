package com.cinema.services;

import com.cinema.dto.reponse.TimeSheetsResponse;

import java.util.Date;
import java.util.List;

public interface ITimeSheetsSerVice {
    boolean CheckIn(String userName);
    boolean CheckOut(String userName);

    List<TimeSheetsResponse> getAllTimeSheet(Date date);
    List<TimeSheetsResponse> getAllTimeSheetByStatusAndDate(Date date,boolean status);

    boolean approvedCheckIn(long id);
}
