package com.petstore.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petstore.service.CustomerService;
import com.petstore.util.JsonResult;

@WebServlet("/updatepet")
public class updatepet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
        String name=request.getParameter("name");
        String tag = request.getParameter("tag");
        String description = request.getParameter("description");
        String cid = request.getParameter("cid");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String imgPath = request.getParameter("imgpath");
        String weight = request.getParameter("weight");
        File file =new File( imgPath.trim());//获取路径
        String fileName = file.getName();//只获取文件名，存入数据库
        CustomerService customerService = new CustomerService();
        boolean flag = customerService.updatePet(id, name, tag, description, cid, price, stock, fileName, weight);
        JsonResult result =new JsonResult();
        result.setSuccess(false);
        if (flag) {
			result.setSuccess(true);
			result.setMsg("数据库更新成功");
		}else {
			result.setMsg("数据库更新失败");
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
