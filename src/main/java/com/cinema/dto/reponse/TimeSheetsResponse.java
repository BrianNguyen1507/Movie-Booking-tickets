package com.cinema.dto.reponse;

import lombok.*;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TimeSheetsResponse {
    EmployeeResponse employee;
    String timeIn;
    String timeOut;
    String date;
    String status;
}
