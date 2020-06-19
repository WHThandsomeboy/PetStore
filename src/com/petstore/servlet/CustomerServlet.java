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
import javax.servlet.http.HttpSession;

import com.petstore.dto.CustomerDTO;
import com.petstore.service.CustomerService;
import com.petstore.util.JsonResult;


@WebServlet(name="CustomerServlet",urlPatterns = {"/Login"})
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("name");
		String pwd = request.getParameter("password");
		HttpSession session =request.getSession();
		CustomerService customerService = new CustomerService();
		CustomerDTO user =new CustomerDTO();
		 user = customerService.checkLogin(email, pwd);
//		 JsonResult result =new JsonResult();
//		 result.setSuccess(false);
        if (user!=null) {
        	session.setAttribute("user", user);
        	if (user.getName().equals("管理员")) {
				response.sendRedirect("admin.jsp");
			}else {
				response.sendRedirect("index");
			}
//        	result.setSuccess(true);
		} 
        else {			
			request.setAttribute("msg", "用户名或密码错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);			
		} 	 
//		response.setContentType("text/json;charset=UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		PrintWriter out = response.getWriter();
//		out.print(result);
//		out.flush();
//		out.close();
	}

}
