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
	 * ��Ӷ���
	 */
	public void addOrder(ShoppingCart cart, CustomerDTO customer) {
		int oid = customerDao.addOrder((int) customer.getId(), Double.toString(cart.getTotalMoney()));
		for (CartItem cart2 : cart.getCartItems().values()) {
			 customerDao.addOrderDetail(oid, cart2.getId(),cart2.getName(),cart2.getImgpath(), Double.toString(cart2.getPrice()),
					cart2.getQuantity());
		}
	}
	/**
	 * ���ݿͻ�id��ȡ�����б�
	 */
	public List<Map<String, Object>> getOrderListByCId(String cid){
		return customerDao.getOrderListByCId(cid);
	}
	/**
	 * ��ѯ��������
	 */
	public List<Map<String, Object>> getOrderdetail(String oid) {
		return customerDao.getOrderdetail(oid);
	}
	/**
	 * ��ѯ�ͻ�����ĳ���
	 */
	public List<Map<String, Object>> getSearchPet(String cid,String cname,int page){
		return customerDao.getSearchPet(cid,cname,page);
	}
	/**
	 * ��ѯ�������
	 */
	public int getRow(String cid,String cname) {
		return customerDao.getRow(cid, cname);
	}
	/**
	 * ��ѯ���е����г�����Ϣ
	 */
	public List<Map<String,Object>> getALLPet() {	
		return customerDao.getALLPet();
	}
	/**
	 * �������ݿ�
	 */
	public boolean updatePet(String id,String name,String tag,String description,String cid,String price,String stock,String imgpath,String weight){
		return customerDao.updatePet(id, name, tag, description, cid, price, stock, imgpath, weight);
    }
	/**
	 * ����idɾ����Ʒ
	 */
	public boolean deletePet(String id) {
		return customerDao.deletePet(id);
	}
	/**
	 * ������Ʒ
	 */
	public boolean addPet(String cid,String name,String tag,String img,String price,String stock,String description,String weight,String score,String is_offsale1) {
		return customerDao.addPet(cid, name, tag, img, price, stock, description, weight, score, is_offsale1);
	}
	/**
	 * �û���ֵ
	 */
	public boolean Recharge(double money,String cid) {
		return customerDao.Recharge(money, cid);
	}
	/**
	 * ��ȡ��ֵ����û�
	 */
	public List<Map<String, Object>> Recharge(String id) {
		return customerDao.Recharge(id);
	}
	/**
	 * �û��޸�����
	 */
	public boolean Repwd(String pwd,String cid) {
		return customerDao.Repwd(pwd, cid);
	}
}
