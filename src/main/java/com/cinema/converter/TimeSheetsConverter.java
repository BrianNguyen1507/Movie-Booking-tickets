package com.cinema.converter;

import com.cinema.dto.reponse.EmployeeResponse;
import com.cinema.dto.reponse.SalaryTotalResponse;
import com.cinema.dto.reponse.TimeSheetsResponse;
import com.cinema.entity.TimeSheetsEntity;
import com.cinema.util.DateFormatter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.Duration;
import java.util.Calendar;
import java.util.List;

@Component
@RequiredArgsConstructor
public class TimeSheetsConverter {
    static final String STATUS_APPROVED = "approved";

    public TimeSheetsResponse toTimeSheetsResponse(TimeSheetsEntity timeSheetsEntity, long id, String name) {
        TimeSheetsResponse response = new TimeSheetsResponse();

        response.setId(timeSheetsEntity.getId());
        response.setTimeIn(DateFormatter.parseTime(timeSheetsEntity.getTimeIn()));
        if (timeSheetsEntity.getTimeOut() == null) {
            response.setTimeOut("Not yet");
        } else {
            response.setTimeOut(DateFormatter.parseTime(timeSheetsEntity.getTimeOut()));
        }
        response.setStatus(timeSheetsEntity.getStatus());
        response.setDate(DateFormatter.toStringDate(timeSheetsEntity.getDate()));
        EmployeeResponse employeeResponse = new EmployeeResponse();
        employeeResponse.setId(id);
        employeeResponse.setName(name);
        response.setEmployee(employeeResponse);

        return response;
    }

    public SalaryTotalResponse toSalaryTotalResponse(List<TimeSheetsEntity> timeSheetsEntities) {
        SalaryTotalResponse response = new SalaryTotalResponse();

        response.setId(timeSheetsEntities.getFirst().getEmployee().getId());
        response.setSalary(timeSheetsEntities.getFirst().getSalary());
        Calendar timeIn = Calendar.getInstance();
        int totalHour = 0;
        for (TimeSheetsEntity entity : timeSheetsEntities) {
            timeIn.setTime(entity.getTimeIn());
            Calendar timeOut = Calendar.getInstance();
            if (entity.getTimeOut()!=null){
                timeOut.setTime(entity.getTimeOut());
                long totalDate =  entity.getTimeOut().getTime()-entity.getTimeIn().getTime();
                int hourDay = (int)(totalDate / (1000 * 60 * 60)) ;
                if (entity.getStatus().equals(STATUS_APPROVED)) {
                    totalHour += Math.min(hourDay, 8);
                }
            }
        }
        response.setHourWorking(totalHour);
        response.setName(timeSheetsEntities.getFirst().getEmployee().getAccount().getCustomer().getName());
        return response;
    }
}
