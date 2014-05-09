package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lims.bean.Teacher;
import com.lims.dao.TeacherDao;

import net.sf.json.JSONObject;

public class LoginServlet1 extends HttpServlet {

	
	private static final long serialVersionUID = 2423125993889540107L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usernum = request.getParameter("usernum");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String code = request.getParameter("code");
		HttpSession session = (HttpSession)request.getSession();
		String randcode = (String)session.getAttribute(CodeServlet.THECODE);
//		System.out.println(usernum);
//		System.out.println(password);
//		System.out.println(role);
//		System.out.println(code);
	//	System.out.println(randcode);
		System.out.println(code.equals(randcode));
		if(code.equals(randcode)){
//			JSONObject json = new JSONObject();
			TeacherDao td = new TeacherDao();
			Teacher teacher = td.isLogin(usernum,password);
//			String msg=null;
//			boolean bool = false;
			System.out.println(teacher!=null);
			if(teacher!=null&&teacher.getTeacher_range()==1){
				session.setAttribute("teacherId", teacher.getTeacher_num());
				session.setAttribute("teachername", teacher.getTeacher_name());
				session.setAttribute("teacher_rage", teacher.getTeacher_range());
				session.setAttribute("teacher_College", teacher.getTeacher_College());
				
//				bool=true;
//				msg="欢迎你"+teacher.getTeacher_name();
				System.out.println(request.getContextPath());
				response.sendRedirect(request.getContextPath()+"/jsp/firstadmin/innerIndex.jsp");
			}
//			json.put("success", bool);
//			json.put("message", msg);
			//response.getWriter().write(json.toString());
			//response.sendRedirect("http://www.baidu.com");
		}
		
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
