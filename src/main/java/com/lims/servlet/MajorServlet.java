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

import com.lims.bean.Major;
import com.lims.bean.JsonBean;
import com.lims.service.MajorService;

public class MajorServlet extends HttpServlet {
	private MajorService service = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service = new MajorService();
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
		String colName = request.getParameter("colName");
		String college_name = new String(colName.getBytes("iso-8859-1"), "UTF-8");
		List list = service.get(0, 0, null, null, college_name);

		JSONArray jsonArray = new JSONArray().fromObject(list);
		String json = jsonArray.toString();

		out.write(json);
	}

	// 修改
	private void edit(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		JsonBean j = new JsonBean();
		int id = Integer.parseInt(request.getParameter("id"));
		int major_num = Integer.parseInt(request.getParameter("major_num"));
		int major_state = Integer.parseInt(request.getParameter("major_state"));
		String major_name = request.getParameter("major_name");

		Major co = new Major();
		co.setMajor_name(major_name);
		co.setMajor_num(major_num);
		co.setMajor_state(major_state);
		co.setId(id);

		if (service.edit(co)) {
			j.setSuccess(true);
			j.setMsg("修改[" + major_name + "]成功！");
		} else {
			j.setMsg("修改[" + major_name + "]失败！");
		}

		JSONArray jsonArray = new JSONArray().fromObject(j);
		String jsonS = jsonArray.toString();
		String json = jsonS.substring(1, jsonS.lastIndexOf("]"));
		out.write(json);
	}

	// 删除
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

	// 添加
	private void add(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		PrintWriter out = response.getWriter();
		String major_name = request.getParameter("major_name");
		String mState = request.getParameter("major_state");
		int major_num = Integer.parseInt(request.getParameter("major_num"));
		int major_state = 0;
		if (!mState.equals("")) {
			major_state = Integer.parseInt(mState);
		}
		String cName = request.getParameter("cName");
		String college_name = new String(cName.getBytes("iso-8859-1"), "UTF-8");

		JsonBean j = new JsonBean();
		Major co = new Major();
		co.setMajor_name(major_name);
		co.setMajor_num(major_num);
		co.setMajor_state(major_state);
		co.setCollege_name(college_name);

		if (service.add(co)) {
			j.setSuccess(true);
			j.setMsg("添加[" + co.getMajor_name() + "]成功！");
		} else {
			j.setMsg("添加[" + co.getMajor_name() + "]失败！");
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
		String cName = request.getParameter("cName");
		String college_name = new String(cName.getBytes("iso-8859-1"), "UTF-8");

		int page = 0;
		int rows = 0;
		if (!sPage.equals("") && !sRows.equals("")) {
			page = Integer.parseInt(sPage);
			rows = Integer.parseInt(sRows);
		}

		int total = service.count(college_name);
		List list = service.get(page, rows, order, sort, college_name);
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
