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

import com.lims.bean.Classes;
import com.lims.bean.College;
import com.lims.bean.JsonBean;
import com.lims.service.ClassesService;

import net.sf.json.JSONArray;

public class ClassesServlet extends HttpServlet {
	ClassesService service = new ClassesService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("getName".equals(method)) {
			getName(request,response);
		}
		if("get".equals(method)) {
			get(request,response);
		}
		if("edit".equals(method)) {
			edit(request,response);
		}
		if("add".equals(method)) {
			add(request,response);
		}
		if("del".equals(method)) {
			del(request,response);
		}
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
		String class_num = request.getParameter("class_num");
		int major_id = Integer.parseInt(request.getParameter("majorId"));
		int class_state = Integer.parseInt(request
				.getParameter("class_state"));

		JsonBean j = new JsonBean();
		Classes co = new Classes();
		co.setClass_num(class_num);
		co.setClass_state(class_state);
		co.setMajor_id(major_id);

		if (service.add(co)) {
			j.setSuccess(true);
			j.setMsg("添加[" + class_num + "]成功！");
		} else {
			j.setMsg("添加[" + class_num + "]失败！");
		}

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}


	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String class_num = request.getParameter("class_num");
		int id = Integer.parseInt(request.getParameter("id"));
		int class_state = Integer.parseInt(request
				.getParameter("class_state"));
		int class_grade = Integer.parseInt(request
				.getParameter("class_grade"));

		JsonBean j = new JsonBean();
		Classes co = new Classes();
		co.setClass_num(class_num);
		co.setId(id);
		co.setClass_grade(class_grade);
		
		if (service.edit(co)) {
			j.setSuccess(true);
			j.setMsg("修改[" + class_num + "]成功！");
		} else {
			j.setMsg("修改[" + class_num + "]失败！");
		}

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
		String MId = request.getParameter("majorId");
		int major_id = Integer.parseInt(MId);
		
		int page = 0;
		int rows = 0;
		if (sPage != null && sRows != null) {
			page = Integer.parseInt(sPage);
			rows = Integer.parseInt(sRows);
		}

		int total = service.count(major_id);
		List list = service.get(page, rows, order, sort,major_id);
		Map m = new HashMap();
		m.put("total", total);
		m.put("rows", list);

		JSONArray jsonArray = new JSONArray().fromObject(m);
		String json = jsonArray.toString();
		String j = json.substring(1, json.lastIndexOf("]"));

		out.write(j);
		
	}

	private void getName(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String mId = request.getParameter("majorId");
		List list = null;
		if(!mId.equals("")) {
			int major_id = Integer.parseInt(mId);
			list = service.get(0, 0, null, null, major_id);
		}

		JSONArray jsonArray = new JSONArray().fromObject(list);
		String json = jsonArray.toString();

		out.write(json);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
