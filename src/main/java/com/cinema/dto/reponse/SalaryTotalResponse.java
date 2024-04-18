package com.cinema.dto.reponse;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SalaryTotalResponse {
    long id;
    String name;
    int hourWorking;
    String date;
    double salary;
}
