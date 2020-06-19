package com.petstore.util;

import java.util.HashMap;

public class JsonResult {
	private Boolean success;
	private String msg;
	private String msg2;
	private int count;
	private double totalMoney;
	private HashMap<String,Object> data;
    public void addData(String key, Object value) {
        if (data == null) {
            data = new HashMap<>();
        }
        data.put(key, value);
    }
	public String toString() {
		return String.format("{\"isSuccess\":\"%s\",\"msg\":\"%s\",\"msg2\":\"%s\",\"count\":\"%d\",\"totalMoney\":\"%.2f\"}", getSuccess(),getMsg(),getMsg2(),getCount(),getTotalMoney());
	}
	
	public JsonResult(){
	}
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success=success;
	}
	public String getMsg() { 
		return msg;
	}
	public void setMsg(String msg) {
		this.msg=msg;
	}
	public String getMsg2() { 
		return msg2;
	}
	public void setMsg2(String msg2) {
		this.msg2=msg2;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public HashMap<String, Object> getData() {
        return data;
    }
    public void setData(HashMap<String, Object> data) {
        this.data = data;
    }
}
