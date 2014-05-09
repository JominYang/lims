


package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lims.bean.KechengBiao;
import com.lims.dao.CurseDao;
import com.lims.tools.PaikeService;
/**
 * 
 * @author 廖金铭
 * 功能：修改和查看课表的servlet
 *
 */
public class KeBiaoServlet extends HttpServlet {

	private static final long serialVersionUID = -5275114539084602987L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchMethod = request.getParameter("searchMethod");
		String searchMethod1 = "modify";
		String searchMethod2 = "chakan";
		if(searchMethod.equals(searchMethod1)){
			modifyCurse(request, response);
		}
		if(searchMethod.equals(searchMethod2)){
			chakanCurse(request,response);
		}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}
	
	private void modifyCurse(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int weekpage = 1;
		String pageweek = request.getParameter("weekpage");
		String kebiaoname1 = (String)request.getParameter("cuname");
		if(kebiaoname1!=""){
			String kebiaoname = null;
			try {
				kebiaoname = new String(kebiaoname1.getBytes("iso-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if(kebiaoname==null||kebiaoname.equals("")){
				return;
			}
			if(pageweek==null||pageweek.equals("")){
				weekpage=1;
			}else{
				weekpage = new Integer(pageweek);
			}
			CurseDao cd = new CurseDao();
			List<KechengBiao> alist = new ArrayList<KechengBiao>();
		//查询所有课程的信息
			alist = cd.searchAllCourse(weekpage,kebiaoname);
		
			int maxpage = cd.getMaxWeekPage(kebiaoname);
			request.setAttribute("alist", alist);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("kebiaoname", kebiaoname);
			try {
				request.getRequestDispatcher("/jsp/firstadmin/function/modify.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			String date1 = (String)request.getParameter("dateStart");
			String date = null;
			try {
				date = new String(date1.getBytes("iso-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			if(date==null||date.equals("")){
				return;
			}
	
			if(pageweek==null||pageweek.equals("")){
				weekpage=1;
			}else{
				weekpage = new Integer(pageweek);
			}
			
			//weekpage = new Integer(pageweek);
			CurseDao cd = new CurseDao();
			String kbname = cd.getCuname(date);
			if(kbname!=null){
			List<KechengBiao> alist = new ArrayList<KechengBiao>();
			alist = cd.searchAllCourse(weekpage,kbname);
		
			
			int maxpage = cd.getMaxWeekPage(kbname);
			request.setAttribute("alist", alist);
			request.setAttribute("maxpage", maxpage);
			request.setAttribute("kebiaoname", kbname);
			try {
				request.getRequestDispatcher("/jsp/firstadmin/function/modify.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}}
	}
/*
 * 查看的方式，查询课表
 * */
		public	 void chakanCurse(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
			int weekpage = 1;
			String pageweek = request.getParameter("weekpage");
			
			String kebiaoname1 = (String)request.getParameter("cuname");
			
			if(kebiaoname1!=""){
				String kebiaoname = null;
				try {
					kebiaoname = new String(kebiaoname1.getBytes("iso-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				if(kebiaoname==null||kebiaoname.equals("")){
					return;
				}
				
				if(pageweek==null||pageweek.equals("")){
					weekpage=1;
				}else{
					weekpage = new Integer(pageweek);
				}
			
				CurseDao cd = new CurseDao();
				List<KechengBiao> alist = new ArrayList<KechengBiao>();
			//查询所有课程的信息
				alist = cd.searchAllCourse(weekpage,kebiaoname);
				System.out.println(alist.get(0));
				if(alist.get(0).equals(null)){
					System.out.println("yeah!!");
				}
				int maxpage = cd.getMaxWeekPage(kebiaoname);
				System.out.println("dafasdfasdg page====="+maxpage);
				request.setAttribute("alist", alist);
				request.setAttribute("maxpage", maxpage);
				request.setAttribute("kebiaoname", kebiaoname);
				try {
					request.getRequestDispatcher("/jsp/common/commonCurse.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				String date1 = (String)request.getParameter("dateStart");
				String date = null;
				try {
					date = new String(date1.getBytes("iso-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				if(date==null||date.equals("")){
					return;
				}
		
				if(pageweek==null||pageweek.equals("")){
					weekpage=1;
				}else{
					weekpage = new Integer(pageweek);
				}
				
				//weekpage = new Integer(pageweek);
				CurseDao cd = new CurseDao();
				String kbname = cd.getCuname(date);
				if(kbname!=null){
				List<KechengBiao> alist = new ArrayList<KechengBiao>();
				alist = cd.searchAllCourse(weekpage,kbname);
			
				int maxpage = cd.getMaxWeekPage(kbname);
				request.setAttribute("alist", alist);
				request.setAttribute("maxpage", maxpage);
				request.setAttribute("kebiaoname", kbname);
				try {
					request.getRequestDispatcher("/jsp/common/commonCurse.jsp").forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}}
			}
			
			
	}

}
