package com.petstore.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petstore.dao.CustomerDao;
import com.petstore.service.CustomerService;
import com.petstore.util.JsonResult;

@WebServlet("/index")
public class indexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cid = request.getParameter("cid");
		String cname = request.getParameter("cname");
		String page = request.getParameter("page");
		if (page==null ||page.isEmpty()) {
			page="1";
		}
		if (cid==null || cid.isEmpty()) {
			cid="0";
		}
 		CustomerService customerService = new CustomerService();
 		int pageCount = customerService.getRow(cid,cname);
		List<Map<String,Object>> petlist = customerService.getPetListByCId(cid,Integer.parseInt(page));	
		request.setAttribute("pid", cid);
		request.setAttribute("page", page);
		request.setAttribute("pageCount", pageCount);
		if (cname==null||cname=="") {
			request.setAttribute("petlist", petlist);							
		}else {
			List<Map<String,Object>> SearchPet = customerService.getSearchPet(cid,cname,Integer.parseInt(page));			
			if (SearchPet.isEmpty()==false) {
				request.setAttribute("petlist", SearchPet);	
				String path = "&&cname="+cname;
				request.setAttribute("path", path);
			}
			else {
				request.setAttribute("isSuccess", "false");
			}
		}		
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

}
