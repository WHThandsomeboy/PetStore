package com.petstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petstore.service.CustomerService;

@WebServlet("/petlist")
public class PetListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if (page==null||page.isEmpty()) {
			page="1";
		}
		CustomerService customerService =  new CustomerService();
		List<Map<String, Object>> petList = customerService.getALLPet();
		List<Map<String, Object>> petMaps =null;
		petMaps = new ArrayList<Map<String,Object>>();
		int cur = (Integer.parseInt(page)-1)*10;
		for (int i = cur; i < Integer.parseInt(page)*10; i++) {
			if (i>petList.size()-1) {
				break;
			}
			petMaps.add(petList.get(i));			
		}
		request.setAttribute("Pet", petMaps);
		request.setAttribute("pageCount", petList.size());
		request.setAttribute("page", page);
		request.getRequestDispatcher("petlist.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
