package com.petstore.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petstore.dto.CustomerDTO;
import com.petstore.dto.ShoppingCart;
import com.petstore.service.CustomerService;

@WebServlet(name="OrderServlet",urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		CustomerDTO user = (CustomerDTO)session.getAttribute("user");
		if (user==null) {
			response.sendRedirect("login.jsp");
		}else {
			if (cart.getCartItems().isEmpty()||cart==null) {
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			}else {
				CustomerService customer = new CustomerService();		
				customer.addOrder(cart,user);
				List<Map<String, Object>> orderList= customer.getOrderListByCId(Long.toString(user.getId()));
				if (orderList.isEmpty()) {
					request.getRequestDispatcher("cart.jsp").forward(request, response);
				}
				session.setAttribute("orderList", orderList);
				response.sendRedirect("order.jsp");
			}
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
