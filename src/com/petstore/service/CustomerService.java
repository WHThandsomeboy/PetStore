package com.petstore.service;

import com.petstore.dao.CustomerDao;
import com.petstore.dto.CartItem;
import com.petstore.dto.CustomerDTO;
import com.petstore.dto.ShoppingCart;

import java.util.Map;
import java.util.List;
public class CustomerService {
	CustomerDao customerDao = new CustomerDao();
	public List<Map<String,Object>> getPetListByCId(String cid,int page) {
		return customerDao.getPetListByCId(cid,page);
	}
	public List<Map<String,Object>> getPetById(String id) {
		return customerDao.getPetById(id);
	}

	public CustomerDTO checkLogin(String email, String pwd) {
		CustomerDTO customer = null;
		List<Map<String, Object>> list = customerDao.checkLogin(email, pwd);
		if (list != null && list.isEmpty() == false) {
			Map<String, Object> map = list.get(0);
			customer = new CustomerDTO();
			customer.setEmail(map.get("email").toString());
			customer.setPwd(map.get("pwd").toString());
			customer.setName(map.get("name").toString());
			customer.setBalance(Double.parseDouble(map.get("balance").toString()));
			customer.setId(Long.parseLong(map.get("id").toString()));
		}
		return customer;
	}
	/**
	 * 添加订单
	 */
	public void addOrder(ShoppingCart cart, CustomerDTO customer) {
		int oid = customerDao.addOrder((int) customer.getId(), Double.toString(cart.getTotalMoney()));
		for (CartItem cart2 : cart.getCartItems().values()) {
			 customerDao.addOrderDetail(oid, cart2.getId(),cart2.getName(),cart2.getImgpath(), Double.toString(cart2.getPrice()),
					cart2.getQuantity());
		}
	}
	/**
	 * 根据客户id获取订单列表
	 */
	public List<Map<String, Object>> getOrderListByCId(String cid){
		return customerDao.getOrderListByCId(cid);
	}
	/**
	 * 查询订单详情
	 */
	public List<Map<String, Object>> getOrderdetail(String oid) {
		return customerDao.getOrderdetail(oid);
	}
	/**
	 * 查询客户输入的宠物
	 */
	public List<Map<String, Object>> getSearchPet(String cid,String cname,int page){
		return customerDao.getSearchPet(cid,cname,page);
	}
	/**
	 * 查询表的行数
	 */
	public int getRow(String cid,String cname) {
		return customerDao.getRow(cid, cname);
	}
	/**
	 * 查询表中的所有宠物信息
	 */
	public List<Map<String,Object>> getALLPet() {	
		return customerDao.getALLPet();
	}
	/**
	 * 更新数据库
	 */
	public boolean updatePet(String id,String name,String tag,String description,String cid,String price,String stock,String imgpath,String weight){
		return customerDao.updatePet(id, name, tag, description, cid, price, stock, imgpath, weight);
    }
	/**
	 * 根据id删除商品
	 */
	public boolean deletePet(String id) {
		return customerDao.deletePet(id);
	}
	/**
	 * 新增商品
	 */
	public boolean addPet(String cid,String name,String tag,String img,String price,String stock,String description,String weight,String score,String is_offsale1) {
		return customerDao.addPet(cid, name, tag, img, price, stock, description, weight, score, is_offsale1);
	}
	/**
	 * 用户充值
	 */
	public boolean Recharge(double money,String cid) {
		return customerDao.Recharge(money, cid);
	}
	/**
	 * 获取充值后的用户
	 */
	public List<Map<String, Object>> Recharge(String id) {
		return customerDao.Recharge(id);
	}
	/**
	 * 用户修改密码
	 */
	public boolean Repwd(String pwd,String cid) {
		return customerDao.Repwd(pwd, cid);
	}
}
