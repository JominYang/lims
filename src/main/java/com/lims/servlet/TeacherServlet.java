package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lims.bean.JsonBean;
import com.lims.bean.Teacher;
import com.lims.service.TeacherService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TeacherServlet extends HttpServlet {
	TeacherService service = new TeacherService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("get".equals(method)) {
			get(request,response);
		}
		if("del".equals(method)) {
			del(request,response);
		}
		if("add".equals(method)) {
			add(request,response);
		}
		if("getSinger".equals(method)) {
			getSinger(request,response);
		}
		if("edit".equals(method)) {
			edit(request,response);
		}
		if("editMy".equals(method)) {
			editMy(request,response);
		}
		if("changePwd".equals(method)) {
			changePwd(request,response);
		}
	}

	//更改密码
	private void changePwd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		JsonBean j = new JsonBean();
		String oldPwd = request.getParameter("oldPwd");
		String cpwd = request.getParameter("cpwd");
		String usernum = request.getParameter("usernum");
		
		if(service.login(usernum, oldPwd) == null) {
			j.setMsg("原密码错误！请确认！");
		}else {
			if(service.changePwd(usernum, cpwd)) {
				j.setSuccess(true);
				j.setMsg("密码修改成功！请牢记！");
			}else {
				j.setMsg("密码修改失败！请重试！");
			}
		}
		JSONObject jsonObj = new JSONObject().fromObject(j);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
	}

	//管理员修改教师信息
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String teacher_num = request.getParameter("teacher_num");
		String teacher_name = request.getParameter("teacher_name");
		String password = request.getParameter("password");
		String teacher_sex = request.getParameter("teacher_sex");
		String teacher_degree = request.getParameter("teacher_degree");
		String teacher_titles = request.getParameter("teacher_titles");
		String college_name = request.getParameter("college_name");
		String major_name =request.getParameter("major_name");
		String teacher_state = request.getParameter("teacher_state");
		String teacher_phone = request.getParameter("teacher_phone");
		String teacher_email = request.getParameter("teacher_email");
		String teacher_introduction = request.getParameter("teacher_introduction");
		
		

		JsonBean j = new JsonBean();
		Teacher t = new Teacher();
		t.setCollege_name(college_name);
		t.setMajor_name(major_name);
		t.setPassword(password);
		t.setTeacher_degree(teacher_degree);
		t.setTeacher_email(teacher_email);
		t.setTeacher_introduction(teacher_introduction);
		t.setTeacher_name(teacher_name);
		t.setTeacher_num(teacher_num);
		t.setTeacher_phone(teacher_phone);
		t.setTeacher_sex(teacher_sex);
		t.setTeacher_titles(teacher_titles);

		if (service.edit(t)) {
			j.setSuccess(true);
			j.setMsg("修改[" + teacher_name + "]成功！");
		} else {
			j.setMsg("修改[" + teacher_name + "]失败！");
		}

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
		
	}	
	
	//编辑用户信息
	private void editMy(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String teacher_num = request.getParameter("teacher_num");
		String teacher_name = request.getParameter("teacher_name");
		String teacher_sex = request.getParameter("teacher_sex");
		String teacher_degree = request.getParameter("teacher_degree");
		String teacher_titles = request.getParameter("teacher_titles");
		String college_name = request.getParameter("college_name");
		String major_name =request.getParameter("major_name");
		String teacher_state = request.getParameter("teacher_state");
		String teacher_phone = request.getParameter("teacher_phone");
		String teacher_email = request.getParameter("teacher_email");
		String teacher_introduction = request.getParameter("teacher_introduction");
		
		

		JsonBean j = new JsonBean();
		Teacher t = new Teacher();
		t.setCollege_name(college_name);
		t.setMajor_name(major_name);
		t.setTeacher_degree(teacher_degree);
		t.setTeacher_email(teacher_email);
		t.setTeacher_introduction(teacher_introduction);
		t.setTeacher_name(teacher_name);
		t.setTeacher_num(teacher_num);
		t.setTeacher_phone(teacher_phone);
		t.setTeacher_sex(teacher_sex);
		t.setTeacher_titles(teacher_titles);

		if (service.editMyProfile(t)) {
			session.setAttribute("teacher", t);
			request.getRequestDispatcher("jsp/common/profile.jsp").forward(request, response);
		} else {
			j.setMsg("修改[" + teacher_name + "]失败！");
			JSONObject jsonObj = new JSONObject().fromObject(j);
			String jsonS = jsonObj.toString();
			out.write(jsonS);
		}
		
	}	
	
	private void getSinger(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String teacher_num = request.getParameter("teacher_num");
		
		Teacher t = service.get(teacher_num);
		JSONArray jsonArray = new JSONArray().fromObject(t);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String teacher_num = request.getParameter("teacher_num");
		String teacher_name = request.getParameter("teacher_name");
		String password = request.getParameter("password");
		String teacher_sex = request.getParameter("teacher_sex");
		String teacher_degree = request.getParameter("teacher_degree");
		String teacher_titles = request.getParameter("teacher_titles");
		String college_name = request.getParameter("college_name");
		String major_name =request.getParameter("major_name");
		String teacher_state = request.getParameter("teacher_state");
		String teacher_phone = request.getParameter("teacher_phone");
		String teacher_email = request.getParameter("teacher_email");
		String teacher_introduction = request.getParameter("teacher_introduction");
		
		

		JsonBean j = new JsonBean();
		Teacher t = new Teacher();
		t.setCollege_name(college_name);
		t.setMajor_name(major_name);
		t.setPassword(password);
		t.setTeacher_degree(teacher_degree);
		t.setTeacher_email(teacher_email);
		t.setTeacher_introduction(teacher_introduction);
		t.setTeacher_name(teacher_name);
		t.setTeacher_num(teacher_num);
		t.setTeacher_phone(teacher_phone);
		t.setTeacher_sex(teacher_sex);
		t.setTeacher_titles(teacher_titles);

		if (service.add(t)) {
			j.setSuccess(true);
			j.setMsg("添加[" + teacher_name + "]成功！");
		} else {
			j.setMsg("添加[" + teacher_name + "]失败！");
		}

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}

	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		JsonBean j = new JsonBean();
		String ids = request.getParameter("ids");

		service.del(ids);
		j.setSuccess(true);

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}

	private void get(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String sPage = request.getParameter("page");
		String sRows = request.getParameter("rows");
		String order = request.getParameter("order");
		String sort = request.getParameter("sort");
		String tname = request.getParameter("teacher_name");
		String collegeName = request.getParameter("college_name");
		String majorName = request.getParameter("major_name");
		
		Teacher t = new Teacher();
		t.setTeacher_name(tname);
		t.setCollege_name(collegeName);
		t.setMajor_name(majorName);
		
		int page = 0;
		int rows = 0;
		if (sPage != null && sRows != null) {
			page = Integer.parseInt(sPage);
			rows = Integer.parseInt(sRows);
		}

		int total = service.count(t);
		List list = service.get(page, rows, order, sort,t);
		Map m = new HashMap();
		m.put("total", total);
		m.put("rows", list);

		JSONObject jsonObj = new JSONObject().fromObject(m);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
