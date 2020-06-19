package com.petstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import com.petstore.dto.CustomerDTO;
import com.petstore.service.CustomerService;
import com.petstore.util.JsonResult;
@WebServlet("/recharge")
public class recharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String money = request.getParameter("money");
		String cid = request.getParameter("cid");
		String total = request.getParameter("total");
		CustomerService customerService = new CustomerService();
		double Money = Double.parseDouble(money)+Double.parseDouble(total);
		boolean flag=customerService.Recharge(Money,cid);
		List<Map<String, Object>> user = customerService.Recharge(cid);
		JsonResult result =new JsonResult();
        result.setSuccess(false);
        if (flag) {
			result.setSuccess(true);
			result.setMsg("余额充值成功");
			result.setMsg2(user.get(0).get("balance").toString());
		}else {
			result.setMsg("余额充值失败");
		}
      //输出Json数据到客户端浏览器	
      		response.setContentType("text/json;charset=UTF-8");
              response.setCharacterEncoding("UTF-8");
              PrintWriter out = response.getWriter();
              out.print(result);
              out.flush();
              out.close();  
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
