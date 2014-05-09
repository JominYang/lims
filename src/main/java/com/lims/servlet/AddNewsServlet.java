package com.lims.servlet;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lims.bean.News;
import com.lims.dao.NewsDao;

public class AddNewsServlet extends HttpServlet {

	private static final long serialVersionUID = 1661656728946693818L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String fenlei1 = request.getParameter("leibie");
		int fenlei = new Integer(fenlei1);
		String context =  request.getParameter("editor01");
		HttpSession session = request.getSession();
		String teachername = (String) session.getAttribute("teachername");
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
		String datetime = formatter.format(currentTime); //将日期时间格式化 
		String path = "F:/DOCFILE/"+fenlei+"/"+title+".txt";
		File f = new File(path);
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(f));
		byte[] b = context.getBytes();
		bos.write(b);
		bos.flush();
		bos.close();
		
	   
			News news = new News();
			news.setNews_title(title);
			news.setNews_cat(fenlei);
			news.setNew_cont(path);
			news.setNews_date(datetime);
			news.setTeacher_name(teachername);
			NewsDao newsdao = new NewsDao();
			newsdao.addNews(news);
		request.getRequestDispatcher("/jsp/teacher/succes.jsp").forward(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
		
	}

}
