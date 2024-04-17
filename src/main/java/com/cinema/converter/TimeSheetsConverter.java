package com.cinema.converter;

import com.cinema.dto.reponse.EmployeeResponse;
import com.cinema.dto.reponse.TimeSheetsResponse;
import com.cinema.entity.TimeSheetsEntity;
import com.cinema.util.DateFormatter;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class TimeSheetsConverter {
    public TimeSheetsResponse toTimeSheetsResponse(TimeSheetsEntity timeSheetsEntity,long id, String name){
        TimeSheetsResponse response = new TimeSheetsResponse();

        response.setTimeIn(DateFormatter.parseTime(timeSheetsEntity.getTimeIn()));
        response.setTimeOut(DateFormatter.parseTime(timeSheetsEntity.getTimeIn()));
        response.setStatus(timeSheetsEntity.getStatus());
        response.setDate(DateFormatter.toStringDate(timeSheetsEntity.getDate()));
        EmployeeResponse employeeResponse = new EmployeeResponse();
        employeeResponse.setId(id);
        employeeResponse.setName(name);
        response.setEmployee(employeeResponse);

        return response;
    }
}
