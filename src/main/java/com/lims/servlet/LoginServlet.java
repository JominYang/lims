package com.lims.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lims.bean.Student;
import com.lims.bean.Teacher;
import com.lims.service.AutoLoginService;
import com.lims.service.StudentService;
import com.lims.service.TeacherService;


/**
 * @title 处理用户登录
 * @author Cat
 * 
 */
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 2423125993889540107L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String servletPath = request.getServletPath();
		String code = request.getParameter("code");
		String randcode = (String)session.getAttribute(CodeServlet.THECODE);
		if ("/login".equals(servletPath)) {
			if(randcode.equals(code)) {
				login(request, response);
			}else {
				
			}
		}
		if ("/logout".equals(servletPath)) {
			logout(request, response);
		}
		if("/outWest".equals(servletPath)) {
			outWest(request,response);
		}
	}

	//处理用户注销
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		AutoLoginService service = new AutoLoginService();

		// 得到浏览器cookie
		Cookie[] cookies = request.getCookies();
		// 如果有cookie
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("autoLoginUser")) {
				// 设置最大时长为0，就是注销cookie
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			if (cookie.getName().equals("sessionId")) {
				service.del(cookie.getValue()); // 删除数据库里面的cookie记录
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			if (cookie.getName().equals("role")) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}

		// 删除session里边的数据
		HttpSession session = request.getSession(false);
		if (session != null) {
			if (session.getAttribute("role") != null) {
				if ("teacher".equals(session.getAttribute("role"))) {
					session.removeAttribute("teacher");
					session.removeAttribute("role");
				} else {
					session.removeAttribute("student");
					session.removeAttribute("role");
				}
			}
		}
		// 跳转到主页
		response.sendRedirect("index.jsp");	
	}

	// 处理登录
	private void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		String userno = request.getParameter("usernum");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String autoLogin = request.getParameter("autoLogin");

		if (role != null && "teacher".equals(role)) {
			TeacherService service = new TeacherService();
			Teacher t = service.login(userno, password);
			if (t != null) {
				if (autoLogin != null && "on".equals(autoLogin)) {
					autoLogin(role, t.getTeacher_num(), request, response);
				}
				session.setAttribute("teacher", t);
				session.setAttribute("role", "teacher");
				session.setAttribute("teacherId", t.getTeacher_num());
				session.setAttribute("teachername", t.getTeacher_name());
				session.setAttribute("teacher_rage", t.getTeacher_range());
				session.setAttribute("teacher_College", t.getTeacher_College());
				response.sendRedirect("jsp/layout/innerIndex.jsp");
			} else {
				response.sendRedirect("error404.jsp");
			}
		} else {
			StudentService service = new StudentService();
			Student s = service.login(userno, password);
			if (s != null) {
				if (autoLogin != null && "on".equals(autoLogin)) {
					autoLogin(role, s.getStu_num(), request, response);
				}
				session.setAttribute("student", s);
				session.setAttribute("role", "student");
				response.sendRedirect("jsp/layout/innerIndex.jsp");
			} else {
				response.sendRedirect("error404.jsp");
			}
		}
	}

	public void autoLogin(String role, String userno,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		// 创建三个cookie写给浏览器
		Cookie ckLoginerId, ckSessionid, ckRole;
		ckLoginerId = new Cookie("autoLoginUserNo", userno);
		ckLoginerId.setMaxAge(60 * 60 * 24 * 14); // 定义cookie的时间14天
		ckLoginerId.setPath("/"); // 设置路径
		response.addCookie(ckLoginerId); // 写给浏览器

		ckRole = new Cookie("role", role);
		ckRole.setMaxAge(60 * 60 * 24 * 14);
		ckRole.setPath("/");
		response.addCookie(ckRole);

		String sessionId = session.getId();
		ckSessionid = new Cookie("sessionId", sessionId);
		ckSessionid.setMaxAge(60 * 60 * 24 * 14);
		ckSessionid.setPath("/");
		response.addCookie(ckSessionid);

		AutoLoginService service = new AutoLoginService();
		service.add(sessionId, userno); // 插入cookie记录到数据库
	}
	/*
	 * 处理管理界面左侧树的输出（管理员，老师，学生）
	 */
	public void outWest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String role = (String) session.getAttribute("role");
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		Student student = (Student) session.getAttribute("student");
		
		if("teacher".equals(role)) {
			if("0".equals(teacher.getTeacher_permisson())) {
				request.getRequestDispatcher("jsp/firstadmin/west.jsp").forward(request, response);
			}else if("1".equals(teacher.getTeacher_permisson())) {
				request.getRequestDispatcher("jsp/teacher/west.jsp").forward(request, response);
			}else {
				
			}
		}else if("student".equals(role)) {
			request.getRequestDispatcher("jsp/student/west.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
