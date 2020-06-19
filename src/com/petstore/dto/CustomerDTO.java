package com.petstore.dto;

public class CustomerDTO {
	private String name;
	private long id;
	private String email;
	private String pwd;
	private double balance;
	private String Msg;
	public CustomerDTO() {
		
	}
	public String getJsonString() {
		return String.format("{\"Msg\":\"%s\"}",getMsg());
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id=id;
	}
	public String getMsg() {
		return Msg;
	}
	public void setMsg(String msg) {
		Msg = msg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
}
