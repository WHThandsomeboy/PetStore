package com.petstore.dto;

public class CartItem {
	private int id;
	private String name;
	private double price;
	private String img;
	private int quantity;
	private double subTotal;
	public CartItem() {
		
	}
	public CartItem(int id,String name, double price,int quantity,String img,double subTotal) {
		this.id=id;
		this.name=name;
		this.price=price;
		this.quantity=quantity;
		this.img=img;
		this.subTotal=subTotal;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id=id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity=quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price=price;
	}
	public String getImgpath() {
		return img;
	}
	public void setImgpath(String img) {
		this.img=img;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal=subTotal;
	}
}
