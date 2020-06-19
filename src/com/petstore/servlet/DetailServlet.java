package com.petstore.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petstore.service.CustomerService;

@WebServlet(name = "DetailServlet",urlPatterns = "/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		CustomerService customerService=new CustomerService();
		List<Map<String, Object>> petdetail = customerService.getPetById(id);
		request.setAttribute("pet",petdetail.get(0));
		RequestDispatcher rds = request.getRequestDispatcher("detail.jsp");
		rds.forward(request, response);
	}

}
