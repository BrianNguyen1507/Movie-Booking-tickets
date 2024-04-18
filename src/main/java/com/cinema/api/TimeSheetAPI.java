package com.cinema.api;

import com.cinema.dto.reponse.DateResponse;
import com.cinema.dto.reponse.RevenueOrderResponse;
import com.cinema.dto.reponse.TimeSheetsResponse;
import com.cinema.services.impl.TimeSheetService;
import com.cinema.util.DateFormatter;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/cinema")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class TimeSheetAPI {
    static final String STATUS_PENDING = "pending";
    static final String STATUS_APPROVED = "approved";
    TimeSheetService timeSheetService;

    @GetMapping(value = "/checkin")
    boolean checkIn() {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        return timeSheetService.CheckIn(userName);
    }

    @GetMapping(value = "/checkout")
    boolean checkOut() {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        return timeSheetService.CheckOut(userName);
    }

    @PostMapping(value = "/getAllTimeSheetByDate")
    List<TimeSheetsResponse> getAllTimeSheetByDay(@RequestBody DateResponse dateString) throws ParseException {
        Date date = DateFormatter.parse(dateString.getDate());
        return timeSheetService.getAllTimeSheet(date);
    }

    @PostMapping(value = "/getAllTimeSheetByStatusAndDate")
    List<TimeSheetsResponse> getAllTimeSheetByStatusAndDate(@RequestBody DateResponse dateResponse) throws ParseException {
        Date date = DateFormatter.parse(dateResponse.getDate());

        return timeSheetService.getAllTimeSheetByStatusAndDate(date, dateResponse.isStatus());
    }

    @GetMapping(value = "/approvedCheckIn")
    boolean approvedCheckIn(@RequestParam("id") long id) {
        return timeSheetService.approvedCheckIn(id);
    }



}
