package com.cinema.services.impl;

import com.cinema.entity.EmployeesEntity;
import com.cinema.entity.TimeSheetsEntity;
import com.cinema.repository.AccountRepository;
import com.cinema.repository.TimeSheetsRepository;
import com.cinema.services.ITimeSheetsSerVice;
import com.cinema.util.DateFormatter;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class TimeSheetService implements ITimeSheetsSerVice {

    AccountRepository accountRepository;

    TimeSheetsRepository timeSheetsRepository;

    @Override
    public boolean CheckIn(String userName) {
        Calendar calendar = Calendar.getInstance();
        EmployeesEntity employees = accountRepository.findByUserName(userName).getEmployees();

        TimeSheetsEntity entityChecked = timeSheetsRepository.checkDuplicateDate(
                employees.getId()
                ,calendar.get(Calendar.YEAR)
                ,calendar.get(Calendar.MONTH)+1
                ,calendar.get(Calendar.DAY_OF_MONTH)
                );
        if (entityChecked==null){
            TimeSheetsEntity timesheetsEntity = new TimeSheetsEntity();
            timesheetsEntity.setTimeIn(new Date());
            timesheetsEntity.setStatus("waiting");
            timesheetsEntity.setEmployee(employees);
            timesheetsEntity.setSalary(27000);
            timesheetsEntity.setDate(new Date());
            timeSheetsRepository.save(timesheetsEntity);
            return true;
        }
        return false;
    }

    @Override
    public boolean CheckOut(String userName) {
        Calendar calendar = Calendar.getInstance();
        EmployeesEntity employees = accountRepository.findByUserName(userName).getEmployees();

        TimeSheetsEntity entityChecked = timeSheetsRepository.checkDuplicateDate(
                employees.getId()
                ,calendar.get(Calendar.YEAR)
                ,calendar.get(Calendar.MONTH)+1
                ,calendar.get(Calendar.DAY_OF_MONTH)
        );
        if (entityChecked!=null){
            if (entityChecked.getTimeOut()!=null){
                TimeSheetsEntity timesheetsEntity = timeSheetsRepository.getReferenceById(entityChecked.getId());
                timesheetsEntity.setTimeOut(new Date());
                timeSheetsRepository.save(timesheetsEntity);
                return true;
            }
            return false;
        }
        return false;
    }
}
