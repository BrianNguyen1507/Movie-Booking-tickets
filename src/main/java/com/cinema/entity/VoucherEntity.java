package com.cinema.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "voucher")
public class VoucherEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	@Column(name = "title")
	private String title;
	@Column(name = "content")
	private String content;
	@Column(name = "type_discount")
	private String typeDiscount;
	@Column(name = "discount")
	private String discount;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ticket_id", nullable = false)
    private TicketEntity ticket;
	
	@ManyToMany(fetch = FetchType.LAZY,mappedBy = "vouchers")
	private List<CustomerEntity> customers = new ArrayList<>();
	
	public VoucherEntity(long id, String title, String content, String typeDiscount, String discount) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.typeDiscount = typeDiscount;
		this.discount = discount;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTypeDiscount() {
		return typeDiscount;
	}
	public void setTypeDiscount(String typeDiscount) {
		this.typeDiscount = typeDiscount;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public TicketEntity getTicket() {
		return ticket;
	}
	public void setTicket(TicketEntity ticket) {
		this.ticket = ticket;
	}
	public List<CustomerEntity> getCustomers() {
		return customers;
	}
	public void setCustomers(List<CustomerEntity> customers) {
		this.customers = customers;
	}
	
	
}
