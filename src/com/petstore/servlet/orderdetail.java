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

import com.petstore.service.CustomerService;
import com.petstore.util.JsonResult;
@WebServlet("/orderdetail")
public class orderdetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oid = request.getParameter("oid");
		CustomerService customerService = new CustomerService();
		List<Map<String, Object>> detaiList = customerService.getOrderdetail(oid);
		JsonResult result =new JsonResult();
		String msg="";
        for(Map<String,Object>map:detaiList){
        	msg+=String.format("<tr><td><img src=petImg/%s width=80></td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
                   map.get("img").toString(),map.get("pid").toString(),map.get("name").toString(),map.get("price").toString(),map.get("quantity").toString());
        }
        result.setMsg(msg);
        result.setSuccess(true);
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
