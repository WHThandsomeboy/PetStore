package com.petstore.servlet;

import com.alibaba.fastjson.JSON;
import com.petstore.util.JsonResult;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;


@WebServlet(name = "uploadImgServlet", urlPatterns = {"/uploadImg"})
@MultipartConfig(maxFileSize = 10*1024*1024)//����ϴ�10M
public class uploadImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part=request.getPart("file");
        String fileName=part.getSubmittedFileName();
        //�ϴ�ͼƬ���浽petImg��
        File uploadFileDir=new File(getServletContext().getRealPath("/petImg"));
        if(!uploadFileDir.exists()){
            uploadFileDir.mkdir();
        }
        //randomUUID()�Զ����������ķ����������ļ�����ͻ
        String name= UUID.randomUUID().toString()+fileName.substring(fileName.lastIndexOf("."));
        //�ϴ���petImg��
        part.write(uploadFileDir+File.separator+name);
        JsonResult jsonResult=new JsonResult();
        jsonResult.setMsg(name);
        response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String result = JSON.toJSONString(jsonResult);
        out.print(result);
        out.flush();
        out.close();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
