package com.petstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petstore.dto.ShoppingCart;
import com.petstore.service.ShoppingCartService;
import com.petstore.util.JsonResult;


@WebServlet(name="CartServlet",urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShoppingCartService shoppingCartService = new ShoppingCartService();
		ShoppingCart cart;
		if (request.getSession().getAttribute("cart")==null) {
			cart = new ShoppingCart();
			request.getSession().setAttribute("cart", cart);
		}else {
			cart=(ShoppingCart) request.getSession().getAttribute("cart");
		}
		
		String type = request.getParameter("type");
		if (type==null) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		JsonResult result =new JsonResult();
		result.setSuccess(true);
		//����add����
		if(type!=null&&type.equals("add")) {
			String id = request.getParameter("id");
			if(id==null) {
				result.setMsg("��Ʒid��������ȷ");
				result.setMsg2("���빺�ﳵδ�ɹ�");
				result.setSuccess(false);				
			}
			String quantity =request.getParameter("quantity");
			if (quantity==null) {
				result.setMsg("��Ʒ������������ȷ");
				result.setMsg2("���빺�ﳵδ�ɹ�");
				result.setSuccess(false);
			}
			if (result.getSuccess()==true) {
				cart = shoppingCartService.addToCart(Integer.parseInt(id), Integer.parseInt(quantity), cart);
				//request.getSession().setAttribute("cart", cart);
				result.setMsg2("");
				result.setMsg("���빺�ﳵ���");
				result.setCount(cart.getTotalCount());
			}
		}
		//����remove����
		if (type!=null&&type.equals("remove")) {
			String id = request.getParameter("id");
			if(id==null) {
				result.setMsg2("��Ʒid��������ȷ");
				result.setMsg("ɾ����Ʒδ�ɹ�");
				result.setSuccess(false);				
			}
			if (result.getSuccess()==true) {
				cart = shoppingCartService.removeFromCart(Integer.parseInt(id), cart);
				//request.getSession().setAttribute("cart", cart);
				result.setMsg2("��Ʒid������ȷ");
				result.setMsg("ɾ����Ʒ�ɹ�");
				result.setCount(cart.getTotalCount());
				result.setTotalMoney(cart.getTotalMoney());	
			}
		}
		//ShoppingCartService��Modifiy����,���ɾ����Ʒ������+1 -1��
		if (type!=null&&(type.equals("addQuantity")||type.equals("removeQuantity"))) {
		String id = request.getParameter("id");
		String quantity=request.getParameter("quantity");
		if (id==null||quantity==null) {
			result.setSuccess(false);	
		}
		if (result.getSuccess()==true) {
		cart=shoppingCartService.Modifiy(Integer.parseInt(quantity), Integer.parseInt(id), cart);
		result.setMsg("��Ʒ�����޸ĳɹ�");
		result.setTotalMoney(cart.getTotalMoney());	
		result.setCount(cart.getTotalCount());
		}
		}
		//���Json���ݵ��ͻ��������	
		response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();       
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

}
}
