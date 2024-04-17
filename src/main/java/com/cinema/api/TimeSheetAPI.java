package com.cinema.api;

import com.cinema.services.impl.TimeSheetService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
}
