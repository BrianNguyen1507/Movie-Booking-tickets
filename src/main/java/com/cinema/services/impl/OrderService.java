package com.cinema.services.impl;

import com.cinema.converter.OrderConverter;
import com.cinema.dto.reponse.RevenueOrderResponse;
import com.cinema.dto.request.OrderDTO;
import com.cinema.dto.request.PaymentDTO;
import com.cinema.entity.*;
import com.cinema.repository.AccountRepository;
import com.cinema.repository.CustomerRepository;
import com.cinema.repository.MovieThreaterRepository;
import com.cinema.repository.OrderRepository;
import com.cinema.services.IOrderService;
import com.cinema.util.DateFormatter;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class OrderService implements IOrderService {


    AccountRepository accountRepository;

    CustomerRepository customerRepository;

    MovieThreaterRepository movieThreaterRepository;

    OrderConverter orderConverter;

    OrderRepository orderRepository;

    @Override
    public PaymentDTO createPayment(PaymentDTO model, String userName) {
        AccountEntity accountEntity = accountRepository.findOneByUserName(userName);
        CustomerEntity customerEntity = Objects.requireNonNull(accountRepository.findById(accountEntity.getId()).orElse(null)).getCustomer();
        OrderEntity orderEntity = orderConverter.PaymentDTOtoEntity(model);
        orderEntity.setCustomer(customerEntity);
        List<TicketEntity> tickets = new ArrayList<>();
        for (int i = 0; i < model.getQuantityTicket(); i++) {
            TicketEntity ticketEntity = new TicketEntity();
            ticketEntity.setDate(model.getDatetime());
            Date date = DateFormatter.parseYMDTime(model.getDateMovieThreater());
            ticketEntity.setMovieThreater(
                    movieThreaterRepository.findOneByTimeAndNumberThreater(date, model.getNumberThreater()));
            MovieThreaterEntity movieThreaterEntity = ticketEntity.getMovieThreater();
            if (movieThreaterEntity.setSeatOrder(model.getSeat()[i])) {
                ticketEntity.setSeat(model.getSeat()[i]);
                ticketEntity.setOrder(orderEntity);
                ticketEntity.setTicketCode(Calendar.getInstance().get(Calendar.YEAR) + ""
                        + Calendar.getInstance().get(Calendar.MONTH)
                        + Calendar.getInstance().get(Calendar.DATE)
                        + Calendar.getInstance().get(Calendar.HOUR)
                        + Calendar.getInstance().get(Calendar.MINUTE)
                        + Calendar.getInstance().get(Calendar.SECOND) + i);
                tickets.add(ticketEntity);
            } else {
                return null;
            }
        }
        orderEntity.setTicket(tickets);
        orderEntity = orderRepository.save(orderEntity);
        return model;
    }

    @Override
    public List<OrderDTO> getlistOrderDTO(String userName) {
        List<OrderDTO> listOrderDTO = new ArrayList<>();
        AccountEntity accountEntity = accountRepository.findOneByUserName(userName);
        if (accountEntity == null) {
            return null;
        }
        CustomerEntity customerEntity = customerRepository.findById(accountEntity.getCustomer().getId()).orElse(null);
        assert customerEntity != null;
        List<OrderEntity> listOrderEntities = orderRepository.findAllByCustomerId(customerEntity.getId());
        if (listOrderEntities == null) return null;
        for (OrderEntity entity : listOrderEntities) {
            OrderDTO dto = orderConverter.toDTO(entity);
            listOrderDTO.add(dto);
        }

        return listOrderDTO;
    }

    @Override
    public List<RevenueOrderResponse> getSumRevenueOrderByDate(int month, int year) {
        List<RevenueOrderResponse> revenueOrderResponses = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        for(int i=1;i<=calendar.getActualMaximum(Calendar.DAY_OF_MONTH);i++){
            RevenueOrderResponse response = new RevenueOrderResponse();
            calendar.set(year,month-1,i);
            String sumTotalDay = orderRepository.sumTotalByDay(year,month,i);
            if(sumTotalDay==null){
                sumTotalDay="0";
            }
            response.setTime(DateFormatter.toStringDate(calendar.getTime()));
            response.setRevenue(Double.parseDouble(sumTotalDay));
            revenueOrderResponses.add(response);
        }
        return revenueOrderResponses;
    }

    @Override
    public List<RevenueOrderResponse> getSumRevenueOrderByMonth(int year) {
        List<RevenueOrderResponse> revenueOrderResponses = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        for(int i=1;i<=calendar.getActualMaximum(Calendar.MONTH)+1;i++){
            RevenueOrderResponse response = new RevenueOrderResponse();
            calendar.set(year,i-1,1);
            String sumTotalDay = orderRepository.sumTotalByMonth(year,i);
            if(sumTotalDay==null){
                sumTotalDay="0";
            }
            response.setTime(DateFormatter.toStringMY(calendar.getTime()));
            response.setRevenue(Double.parseDouble(sumTotalDay));
            revenueOrderResponses.add(response);
        }
        return revenueOrderResponses;
    }

}

