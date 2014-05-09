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

import com.lims.bean.College;
import com.lims.bean.JsonBean;
import com.lims.service.CollegeService;

public class CollegeServlet extends HttpServlet {
	private CollegeService service = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = new CollegeService();
		String method = request.getParameter("method");
		if ("add".equals(method)) {
			add(request, response);
		}
		if ("get".equals(method)) {
			get(request, response);
		}
		if ("del".equals(method)) {
			del(request, response);
		}
		if ("edit".equals(method)) {
			edit(request, response);
		}
		if ("getName".equals(method)) {
			getName(request, response);
		}
	}

	private void getName(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		List list = service.get(0, 0, null, null);

		JSONArray jsonArray = new JSONArray().fromObject(list);
		String json = jsonArray.toString();

		out.write(json);
	}

	// 修改学院信息
	private void edit(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		JsonBean j = new JsonBean();
		int id = Integer.parseInt(request.getParameter("id"));
		int college_num = Integer.parseInt(request.getParameter("college_num"));
		int college_state = Integer.parseInt(request
				.getParameter("college_state"));
		String college_name = request.getParameter("college_name");

		College co = new College();
		co.setCollege_name(college_name);
		co.setCollege_num(college_num);
		co.setCollege_state(college_state);
		co.setId(id);

		if (service.edit(co)) {
			j.setSuccess(true);
			j.setMsg("修改[" + college_name + "]成功！");
		} else {
			j.setMsg("修改[" + college_name + "]失败！");
		}

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}

	// 删除学院
	private void del(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
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

	// 添加学院
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		String college_name = request.getParameter("college_name");
		int college_num = Integer.parseInt(request.getParameter("college_num"));
		int college_state = Integer.parseInt(request
				.getParameter("college_state"));

		JsonBean j = new JsonBean();
		College co = new College();
		co.setCollege_name(college_name);
		co.setCollege_num(college_num);
		co.setCollege_state(college_state);

		if (service.add(co)) {
			j.setSuccess(true);
			j.setMsg("添加[" + co.getCollege_name() + "]成功！");
		} else {
			j.setMsg("添加[" + co.getCollege_name() + "]失败！");
		}

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}

	private void get(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		String sPage = request.getParameter("page");
		String sRows = request.getParameter("rows");
		String order = request.getParameter("order");
		String sort = request.getParameter("sort");
		int page = 0;
		int rows = 0;
		if (sPage != null && sRows != null) {
			page = Integer.parseInt(sPage);
			rows = Integer.parseInt(sRows);
		}

		int total = service.count();
		List list = service.get(page, rows, order, sort);
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
