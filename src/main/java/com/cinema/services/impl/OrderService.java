package com.cinema.services.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.converter.OrderConverter;
import com.cinema.dto.request.OrderDTO;
import com.cinema.dto.request.PaymentDTO;
import com.cinema.entity.AccountEntity;
import com.cinema.entity.CustomerEntity;
import com.cinema.entity.MovieThreaterEntity;
import com.cinema.entity.OrderEntity;
import com.cinema.entity.TicketEntity;
import com.cinema.repository.AccountRepository;
import com.cinema.repository.CustomerRepository;
import com.cinema.repository.FilmRepository;
import com.cinema.repository.MovieThreaterRepository;
import com.cinema.repository.OrderRepository;
import com.cinema.repository.TicketRepository;
import com.cinema.services.IOrderService;
import com.cinema.util.DateFormatter;

@Service
public class OrderService implements IOrderService {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    FilmRepository filmRepository;

    @Autowired
    MovieThreaterRepository movieThreaterRepository;

    @Autowired
    OrderConverter orderConverter;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    TicketRepository ticketRepository;

    @Override
    public PaymentDTO createPayment(PaymentDTO model) {
        CustomerEntity customerEntity = accountRepository.findById(model.getAccountId()).orElse(null).getCustomer();
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
                        + Calendar.getInstance().get(Calendar.MONTH) + ""
                        + Calendar.getInstance().get(Calendar.DATE) + ""
                        + Calendar.getInstance().get(Calendar.HOUR) + ""
                        + Calendar.getInstance().get(Calendar.MINUTE) + ""
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
    public List<OrderDTO> getlistOrderDTO(long accountId) {
        List<OrderDTO> listOrderDTO = new ArrayList<>();
        AccountEntity accountEntity = accountRepository.findById(accountId).orElse(null);
        if (accountEntity == null) {
            return null;
        }
        CustomerEntity customerEntity = customerRepository.findById(accountEntity.getCustomer().getId()).orElse(null);
        List<OrderEntity> listOrderEntities = orderRepository.findAllByCustomerId(customerEntity.getId());
        if (listOrderEntities == null) return null;
        for (OrderEntity entity : listOrderEntities) {
            OrderDTO dto = orderConverter.toDTO(entity);
            listOrderDTO.add(dto);
        }

        return listOrderDTO;
    }

}

