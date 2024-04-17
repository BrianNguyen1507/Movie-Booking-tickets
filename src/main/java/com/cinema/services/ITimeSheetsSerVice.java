package com.cinema.services;

import com.cinema.dto.reponse.TimeSheetsResponse;

import java.util.List;

public interface ITimeSheetsSerVice {
    boolean CheckIn(String userName);
    boolean CheckOut(String userName);

    List<TimeSheetsResponse> getAllTimeSheet(int day);
}
