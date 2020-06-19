package com.petstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petstore.service.CustomerService;
import com.petstore.util.JsonResult;

@WebServlet("/Detele")
public class Detele extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		CustomerService customerService = new CustomerService();
		boolean flag=customerService.deletePet(id);
		JsonResult result =new JsonResult();
        result.setSuccess(false);
        if (flag) {
			result.setSuccess(true);
			result.setMsg("商品删除成功");
		}else {
			result.setMsg("商品删除失败");
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
