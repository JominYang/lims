package com.lims.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lims.bean.News;
import com.lims.dao.NewsDao;

public class NewsOpreat extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method.equals("select")&&method!=null&&!method.equals("")){
			String cate = request.getParameter("cat");
			String page1 = request.getParameter("page");
			int cat = new Integer(cate);
			int page = new Integer(page1);
			select(request,response,cat,page);
		}
		if(method.equals("selectDetail")&&method!=null&&!method.equals("")){
			String nid = request.getParameter("newsId");
			int id = new Integer(nid);
			selectNewsDetail(request,response,id);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	
	public void select(HttpServletRequest request, HttpServletResponse response,int cat,int page) throws ServletException, IOException{
		NewsDao newsdao = new NewsDao();
		ArrayList<News> newslist = newsdao.getNews(cat,page);
		int numbers = newsdao.getNewsCount(cat);
		int cupage = page;
		request.setAttribute("allnewsList", newslist);
		request.setAttribute("cupage", cupage);
		request.setAttribute("cat", cat);
		request.setAttribute("numbers", numbers);
		request.setAttribute("pageNum",numbers/14+1);
		
		request.getRequestDispatcher("/list.jsp").forward(request, response);
		
	}
	
	public void selectNewsDetail(HttpServletRequest request, HttpServletResponse response,int id) throws IOException, ServletException{
		NewsDao newsdao = new NewsDao();
		News news = new News();
		news = newsdao.getNewsById(id);
		String newsPath = news.getNew_cont();
		File file = new File(newsPath);
		 StringBuffer strBuffResult = new StringBuffer();
		if(file.exists()){
			if(file.isFile()){
				
				FileInputStream fis = new FileInputStream(file);
				//byte[] b = new byte[fis.available()];
				BufferedReader br = new BufferedReader(new InputStreamReader(fis));
				int read=0;
				while((read=br.read())!=-1){
					strBuffResult.append((char)read);
				}
			}
		}
		//context保存取出的新闻的内容
		String context = strBuffResult.toString();
		news.setNew_cont(context);
		News lastnews = new News();
		lastnews = newsdao.getlastNews(id);
		News nextnews = new News();
		nextnews = newsdao.getNextNews(id);
		request.setAttribute("detailnews", news);
		request.setAttribute("lastnews", lastnews);
		request.setAttribute("nextnews", nextnews);
		request.getRequestDispatcher("/newsdetail.jsp").forward(request, response);
	}

}
