package com.petstore.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petstore.dao.CustomerDao;
import com.petstore.service.CustomerService;
import com.petstore.util.JsonResult;

@WebServlet("/addpet")
public class addpet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        String name=request.getParameter("name");
        String tag = request.getParameter("tag");
        String description = request.getParameter("description");
        String cid = request.getParameter("cid");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String imgPath = request.getParameter("img");
        String weight = request.getParameter("weight");
        String score = request.getParameter("score");
        String is_offsale = request.getParameter("is_offsale");
        File file =new File( imgPath.trim());//��ȡ·��
        String fileName = file.getName();//ֻ��ȡ�ļ������������ݿ�
        CustomerService customerService = new CustomerService();
        boolean flag = customerService.addPet(cid, name, tag, fileName, price, stock, description, weight, score, is_offsale);
        JsonResult result =new JsonResult();
        result.setSuccess(false);
        if (flag) {
			result.setSuccess(true);
			result.setMsg("��Ʒ��ӳɹ�");
		}else {
			result.setMsg("��Ʒ���ʧ��");
		}
      //���Json���ݵ��ͻ��������	
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
