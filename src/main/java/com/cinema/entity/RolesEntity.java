package com.cinema.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="Roles")
public class RolesEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;
	@Column(name = "role_name")
	private ERole roleName;
	
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "roles")
	List<AccountEntity> accounts;
	
	public RolesEntity() {
		super();
	}
	public RolesEntity(long id, ERole roleName) {
		super();
		this.id = id;
		this.roleName = roleName;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public ERole getRoleName() {
		return roleName;
	}
	public void setRoleName(ERole roleName) {
		this.roleName = roleName;
	}
	public List<AccountEntity> getAccounts() {
		return accounts;
	}
	public void setAccounts(List<AccountEntity> accounts) {
		this.accounts = accounts;
	}
	
}
