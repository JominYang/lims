package com.lims.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lims.bean.Teacher;
import com.lims.service.AutoLoginService;
import com.lims.service.TeacherService;


/**
 * title:拦截器实现自动登录 date:2012-7-16
 * 
 * @author Cat
 * 
 */
public class AutoLoginFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) sRequest;
		HttpServletResponse response = (HttpServletResponse) sResponse;
		HttpSession session = request.getSession();

		// 从session中获得teacher或student,表示用户已经登录不需要自动登录
		Teacher teacher = (Teacher) session.getAttribute("teacher");

		// 如果用户没有登录
		if (teacher == null) {
			String userNo = null;
			String sessionId = null;
			String roleValue = null;
			// 查找cookie
			Cookie[] cookies = request.getCookies();

			// 检查是否有上次登录的用户名和sessionId
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("autoLoginUserNo")) {
						userNo = cookie.getValue();
					}
					if (cookie.getName().equals("sessionId")) {
						sessionId = cookie.getValue();
					}
					if (cookie.getName().equals("role")) {
						roleValue = cookie.getValue();
					}
				}
				// 如果有上次登录的用户名和sessionId，则自动登录
				if (userNo != null && sessionId != null) {
					boolean isAutoLoginer = new AutoLoginService()
							.get(sessionId, userNo);
					if (isAutoLoginer) {
						if ("teacher".equals(roleValue)) {
							Teacher t = new TeacherService().get(userNo);
							session.setAttribute("teacher", t);
							session.setAttribute("role", "teacher");
						} /*else if ("student".equals(roleValue)) {
							StudentVo v = new LoginService()
									.studentLogin(loginNo);
							session.setAttribute("student", v);
							session.setAttribute("role", "student");
						}*/

						response.sendRedirect("index.jsp");
					}

				} else {
					// session里面没登录,而且cookie里面没有登录,用过滤器跳转到首页
					//request.getRequestDispatcher("/index.jsp").forward(request, response);
				}
			}
		} else {
			// 如果session里面有用户已经登录，通过

		}
		chain.doFilter(sRequest, sResponse);
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
