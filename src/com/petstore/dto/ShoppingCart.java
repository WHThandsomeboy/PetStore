package com.petstore.dto;

import java.util.HashMap;

public class ShoppingCart {
	private HashMap<Integer, CartItem> cartItems;
	private int totalCount;
	private double totalMoney;
	public ShoppingCart() {
		cartItems =new HashMap<Integer, CartItem>();
	}
	public String getCountAndTotalJsonString() {
		return String.format("{\"totalCount\":\"%s\",\"totalMoney\":\"%s\"}", getTotalCount(),getTotalMoney());
	}
	public HashMap<Integer, CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(HashMap<Integer, CartItem> cartItems) {
		this.cartItems=cartItems;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney=totalMoney;
	}
	public double getTotalMoney() {
		return totalMoney;
	} 
	
}
