package com.cinema.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class OrderEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	@Column(name = "date")
	private Date date;
	@Column(name = "quantity_ticket")
	private int quantityTicket;
	@Column(name="payment_method")
	private String paymentMethod;
	@Column(name="sumtotal")
	private int sumtotal;
	
	@OneToMany(mappedBy = "orders", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	List<TicketEntity> ticket;

	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "customer_id", nullable = false)
    private CustomerEntity customer;
    
	public OrderEntity(long id, Date date, int quatityTicket, String paymentMethod,int sumtotal,
			List<TicketEntity> ticket) {
		super();
		this.id = id;
		this.date = date;
		this.quantityTicket = quatityTicket;
		this.paymentMethod = paymentMethod;
		this.sumtotal = sumtotal;
		this.ticket = ticket;
	}
	

	public OrderEntity() {
		super();
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getQuantityTicket() {
		return quantityTicket;
	}

	public void setQuantityTicket(int quantityTicket) {
		this.quantityTicket = quantityTicket;
	}

	public List<TicketEntity> getTicket() {
		return ticket;
	}

	public void setTicket(List<TicketEntity> ticket) {
		this.ticket = ticket;
	}


	public int getSumtotal() {
		return sumtotal;
	}


	public void setSumtotal(int sumtotal) {
		this.sumtotal = sumtotal;
	}


	public CustomerEntity getCustomer() {
		return customer;
	}


	public void setCustomer(CustomerEntity customer) {
		this.customer = customer;
	}
	

}
