package com.petstore.dao;


import java.sql.Timestamp;
import java.util.List;
import java.util.Map;


public class CustomerDao extends BaseDao {
	public List<Map<String,Object>> getPetListByCId(String cid,int page) {
		if (cid==null||cid.isEmpty()||cid.equals("0")) {
			String sql ="select * from pet where is_offsale =0 and id limit ?,3";
			page = (page-1)*3;
			Object param[]= {page};
			return select(sql,param); 					
		}else {
			String sql = "select * from pet where is_offsale =0 and c_id = ? and id limit ?,3";
			page = (page-1)*3;
			Object param[]= {cid,page};
			return select(sql,param); 	
		}
	}
	/**
	 * ��ѯ���е����г�����Ϣ
	 */
	public List<Map<String,Object>> getALLPet() {
		String sql ="select * from pet";
		return select(sql, null);
	}
	/**
	 * ��ѯ�������
	 */
	public int getRow(String cid,String cname) {
		if (cname==null || cname.isEmpty()) {
			if (cid==null||cid.isEmpty()||cid.equals("0")) {
				String sql ="SELECT count(*) FROM pet";
				return getrow(sql,null); 					
			}else {
				String sql = "SELECT count(*) FROM pet WHERE c_id = ?";
				Object param[]= {cid};
				return getrow(sql,param); 	
			}
		}else {
			if (cid.equals("0")) {
				String sql ="SELECT count(*) FROM pet WHERE `name` LIKE ?";
				Object param[]= {"%"+cname+"%"};
				return getrow(sql,param); 
			}
			else {
				String sql = "SELECT count(*) FROM pet WHERE c_id = ? AND `name` LIKE ?";
				Object param[]= {cid,"%"+cname+"%"};
				return getrow(sql,param); 	
			}
			
		}
	}
	/**
	 * ��ѯ�ͻ�����ĳ���
	 */
	public List<Map<String,Object>> getSearchPet(String cid,String cname,int page) {
		if (cid==null||cid.isEmpty()||cid.equals("0")) {
			String sql ="select * from pet where name like ? and id limit ?,3";
			page = (page-1)*3;
			Object param[] = {"%"+cname+"%",page};
			return select(sql,param); 					
		}else {
			String sql = "select * from pet where c_id = ? and name like ? and id limit ?,3";
			page = (page-1)*3;
			Object param[] = {cid,"%"+cname+"%",page};
			return select(sql,param); 	
		}
	}
	public List<Map<String,Object>> getPetById(String id) {
		String sql = "select * from pet where is_offsale =0 and id = ?";
		Object param[]= {id};
		return select(sql,param); 
	}
	public List<Map<String, Object>> checkLogin(String email , String pwd){
		String sql = "select * from customer where email = ? and pwd = ?";
		Object param[]= {email,pwd};
		return select(sql,param); 	
	}
	/**
	 * Description ��Ӷ���
	 */
	public int addOrder(int cid,String money) {//����id
		//order��mysql�Ĺؼ��֣�������дsql����ʱ��Ҫ��sql����е�order���Ϸ����ţ�`order`,�����Ϳ��Գɹ������ˡ�
		String sql = "insert into `order` values(null,?,?,?,now())";
		Object param[] = {cid,money,"δ����"};//0������ʼ״̬
		String sql1 = "select LAST_INSERT_ID() from `order`";//��ȡ������
		return getLastId(sql, sql1, param);
	}
	/**
	 * Description ��Ӷ�������
	 */
	public boolean addOrderDetail(int oid,int pid,String name,String img,String price,int quantity) {
		String sql = "insert into orderdetail values(null,?,?,?,?,?,?)";
		Object param[] = {oid,pid,name,img,price,quantity};
		return upadateByParams(sql, param);
	}
	/**
	 * Description ���ݿͻ�id��ȡ�����б�
	 */
	public List<Map<String, Object>> getOrderListByCId(String cid) {
		String sql = "select * from `order` where cid = ?";
		Object param[]= {cid};
		return select(sql,param);
	}
	/**
	 * ��ѯ��������
	 */
	public List<Map<String, Object>> getOrderdetail(String oid) {
		String sql = "select * from `orderdetail` where oid = ?";
		Object param[]= {oid};
		return select(sql,param);
	}
	/**
	 * �������ݿ�
	 */
	public boolean updatePet(String id,String name,String tag,String description,String cid,String price,String stock,String imgpath,String weight){
        String sql="update pet SET name= ?,tag=?,img=?,weight=?,description=?,c_id=?,price=?,stock=? where id=?";
        Object param[]={name,tag,imgpath,weight,description,cid,price,stock,id};
        return upadateByParams(sql, param);
    }
	/**
	 * ����idɾ����Ʒ
	 */
	public boolean deletePet(String id) {
		String sql = "DELETE FROM pet WHERE id = ?";
		 Object param[]= {id};
		 return upadateByParams(sql, param);
	}
	/**
	 * ������Ʒ
	 */
	public boolean addPet(String cid,String name,String tag,String img,String price,String stock,String description,String weight,String score,String is_offsale1) {
		String sql="insert into pet values(null,?,?,?,?,?,?,?,?,?,?,?)";
	    boolean is_offsale = Boolean.getBoolean(is_offsale1);
	    Timestamp on_sale_time = new Timestamp(System.currentTimeMillis());
		Object param[]= {cid,name,tag,img,price,stock,description,weight,score,on_sale_time,is_offsale};
		return upadateByParams(sql, param);
	}
	/**
	 * �û���ֵ
	 */
	public boolean Recharge(double money,String cid) {
		String sql = "update customer SET balance = ? where id = ?";
		Object param[] = {money,cid};
		return upadateByParams(sql, param);
	}
	/**
	 * ��ȡ��ֵ����û�
	 */
	public List<Map<String, Object>> Recharge(String id) {
		String sql = "select * from customer where id = ?";
		Object param[]= {id};
		return select(sql,param);
	}
	/**
	 * �û��޸�����
	 */
	public boolean Repwd(String pwd,String cid) {
		String sql = "update customer SET pwd = ? where id = ?";
		Object param[] = {pwd,cid};
		return upadateByParams(sql, param);
	}
}

