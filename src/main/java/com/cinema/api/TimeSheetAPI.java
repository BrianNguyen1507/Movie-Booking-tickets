package com.cinema.api;

import com.cinema.dto.reponse.TimeSheetsResponse;
import com.cinema.services.impl.TimeSheetService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/cinema")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class TimeSheetAPI {

    TimeSheetService timeSheetService;

    @GetMapping(value = "/checkin")
    boolean checkIn(){
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        return timeSheetService.CheckIn(userName);
    }

    @GetMapping(value = "/checkout")
    boolean checkOut(){
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        return timeSheetService.CheckOut(userName);
    }

    @GetMapping(value = "/getAllTimeSheetByDay")
    List<TimeSheetsResponse> getAllTimeSheetByDay(@RequestParam("day") int day){
        return timeSheetService.getAllTimeSheet(day);
    }

}
