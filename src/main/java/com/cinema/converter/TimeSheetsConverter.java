package com.cinema.converter;

import com.cinema.dto.reponse.EmployeeResponse;
import com.cinema.dto.reponse.SalaryTotalResponse;
import com.cinema.dto.reponse.TimeSheetsResponse;
import com.cinema.entity.TimeSheetsEntity;
import com.cinema.util.DateFormatter;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.List;

@Component
@RequiredArgsConstructor
public class TimeSheetsConverter {
    static final String STATUS_APPROVED = "approved";
    public TimeSheetsResponse toTimeSheetsResponse(TimeSheetsEntity timeSheetsEntity,long id, String name){
        TimeSheetsResponse response = new TimeSheetsResponse();

        response.setId(timeSheetsEntity.getId());
        response.setTimeIn(DateFormatter.parseTime(timeSheetsEntity.getTimeIn()));
        response.setTimeOut(DateFormatter.parseTime(timeSheetsEntity.getTimeOut()));
        response.setStatus(timeSheetsEntity.getStatus());
        response.setDate(DateFormatter.toStringDate(timeSheetsEntity.getDate()));
        EmployeeResponse employeeResponse = new EmployeeResponse();
        employeeResponse.setId(id);
        employeeResponse.setName(name);
        response.setEmployee(employeeResponse);

        return response;
    }

    public SalaryTotalResponse toSalaryTotalResponse(List<TimeSheetsEntity> timeSheetsEntities){
        SalaryTotalResponse response = new SalaryTotalResponse();

        response.setId(timeSheetsEntities.getFirst().getEmployee().getId());
        response.setSalary(timeSheetsEntities.getFirst().getSalary());
        Calendar timeIn = Calendar.getInstance();
        int totalHour =0;
        for (TimeSheetsEntity entity : timeSheetsEntities){
            timeIn.setTime(entity.getTimeIn());
            Calendar timeOut = Calendar.getInstance();
            timeOut.setTime(entity.getTimeOut());
            int hourDay = (timeOut.get(Calendar.HOUR_OF_DAY)-timeIn.get(Calendar.HOUR_OF_DAY));
            if(entity.getStatus().equals(STATUS_APPROVED)){
                totalHour += Math.min(hourDay, 8);
            }

        }
        response.setHourWorking(totalHour);
        response.setName(timeSheetsEntities.getFirst().getEmployee().getAccount().getCustomer().getName());

        return response;
    }
}
