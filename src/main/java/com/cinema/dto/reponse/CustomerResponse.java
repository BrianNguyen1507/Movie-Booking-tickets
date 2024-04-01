package com.cinema.dto.reponse;

import com.cinema.dto.request.AccountDTO;
import lombok.Data;

@Data
public class CustomerResponse {
    private String name;
    private String phoneNumber;
    private String level;
    private String gender;
    private String address;
    private String userName;
}
