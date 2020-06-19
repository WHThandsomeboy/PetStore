package com.petstore.service;

import java.util.*;
import com.petstore.dto.*;


public class ShoppingCartService {
	public ShoppingCart addToCart(CartItem item,ShoppingCart cart) {
		int id=item.getId();
		if (cart.getCartItems().containsKey(id)) {
			item.setQuantity(item.getQuantity()+cart.getCartItems().get(id).getQuantity());
		}
		cart.getCartItems().put(id, item);
		return refreshTotalCountAndTotalMoney(cart);
	}
	public ShoppingCart addToCart(int id,int quantity,ShoppingCart cart) {
		CartItem item = new CartItem();
		item.setId(id);
		item.setQuantity(quantity);
		
		CustomerService customerService = new CustomerService();
		List<Map<String, Object>> list = customerService.getPetById(String.valueOf(id));
		item.setName(list.get(0).get("name").toString());
		item.setImgpath(list.get(0).get("img").toString());
		item.setPrice(Double.parseDouble(list.get(0).get("price").toString()));
		item.setSubTotal(quantity*item.getPrice());
		return addToCart(item,cart);
	}
	public ShoppingCart removeFromCart(int id,ShoppingCart cart) {
		cart.getCartItems().remove(id);
		return refreshTotalCountAndTotalMoney(cart);
	}
	public ShoppingCart refreshTotalCountAndTotalMoney(ShoppingCart cart) {
		double totalMoney = 0.0;
		int totalCount=0;
		Collection<CartItem> list= cart.getCartItems().values();
		Iterator<CartItem> it = list.iterator();
		while (it.hasNext()) {
			CartItem item =it.next();
			totalMoney += item.getPrice()*item.getQuantity();
			totalCount+=item.getQuantity();
		}
		cart.setTotalCount(totalCount);
		cart.setTotalMoney(totalMoney);
		return cart;
	}
	public ShoppingCart Modifiy(int quantity,int id,ShoppingCart cart) {//增删一个商品
		
		if (cart.getCartItems().containsKey(id)) {
            CartItem item = cart.getCartItems().get(id);    //获取对应id的购物项
            item.setQuantity(quantity);         //更新指定购物项的数量
        }
		return refreshTotalCountAndTotalMoney(cart);
	}
}
