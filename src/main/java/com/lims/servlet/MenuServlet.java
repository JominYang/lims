package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
/***
 * 
 * @author 廖金铭
 * 功能：得到西侧的菜单
 *
 */
public class MenuServlet extends HttpServlet {

	private static final long serialVersionUID = -4274826833959943217L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JSONObject json = new JSONObject();
		json.put("id", 1);
		json.put("text","新闻管理");
		response.getWriter().write("["+json.toString()+"]");
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
