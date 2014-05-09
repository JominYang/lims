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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lims.bean.Classes;
import com.lims.bean.JsonBean;
import com.lims.bean.Student;
import com.lims.service.StudentService;

public class StudentServlet extends HttpServlet {

	StudentService service = new StudentService();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("get".equals(method)) {
			get(request,response);
		}
		if("add".equals(method)) {
			add(request,response);
		}
		if("edit".equals(method)) {
			eidt(request,response);
		}
		if("del".equals(method)) {
			del(request,response);
		}
		if("changePwd".equals(method)) {
			changePwd(request,response);
		}
	}

	
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


	private void eidt(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String stu_num = request.getParameter("stu_num");
		String stu_name = request.getParameter("stu_name");
		String stu_sex = request.getParameter("stu_sex");
		
		int stu_state = Integer.parseInt(request.getParameter("stu_state"));
		int class_id = Integer.parseInt(request
				.getParameter("class_id"));
		int id = Integer.parseInt(request.getParameter("id"));

		JsonBean j = new JsonBean();
		Student st = new Student();
		st.setStu_num(stu_num);
		st.setStu_name(stu_name);
		st.setStu_sex(stu_sex);
		st.setClass_id(class_id);
		st.setStu_state(stu_state);
		st.setId(id);
		
		
		if (service.edit(st)) {
			j.setSuccess(true);
			j.setMsg("修改[" + stu_name + "]成功！");
		} else {
			j.setMsg("修改[" + stu_name + "]失败！");
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


	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String stu_num = request.getParameter("stu_num");
		String stu_name = request.getParameter("stu_name");
		String stu_sex = request.getParameter("stu_sex");
		
		int stu_state = Integer.parseInt(request.getParameter("stu_state"));
		int class_id = Integer.parseInt(request
				.getParameter("classId"));

		JsonBean j = new JsonBean();
		Student st = new Student();
		st.setClass_id(class_id);
		st.setStu_num(stu_num);
		st.setStu_name(stu_name);
		st.setStu_sex(stu_sex);
		st.setStu_state(stu_state);

		if (service.add(st)) {
			j.setSuccess(true);
			j.setMsg("添加[" + stu_name + "]成功！");
		} else {
			j.setMsg("添加[" + stu_name + "]失败！");
		}

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}

	public void get(HttpServletRequest request, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		String sPage = request.getParameter("page");
		String sRows = request.getParameter("rows");
		String order = request.getParameter("order");
		String sort = request.getParameter("sort");
		String CId = request.getParameter("classId");
		int class_id = Integer.parseInt(CId);
		
		int page = 0;
		int rows = 0;
		if (sPage != null && sRows != null) {
			page = Integer.parseInt(sPage);
			rows = Integer.parseInt(sRows);
		}

		int total = service.count(class_id);
		List list = service.get(page, rows, order, sort,class_id);
		Map m = new HashMap();
		m.put("total", total);
		m.put("rows", list);

		JSONArray jsonArray = new JSONArray().fromObject(m);
		String json = jsonArray.toString();
		String j = json.substring(1, json.lastIndexOf("]"));

		out.write(j);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
