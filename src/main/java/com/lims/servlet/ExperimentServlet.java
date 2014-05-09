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

import net.sf.json.JSONObject;

import com.lims.bean.Expriment;
import com.lims.bean.JsonBean;
import com.lims.service.ExperimentService;

public class ExperimentServlet extends HttpServlet {
	ExperimentService service = new ExperimentService();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("get".equals(method)) {
			get(request,response);
		}
		if("add".equals(method)) {
			add(request,response);
		}
		if("del".equals(method)) {
			del(request,response);
		}
		if("getSinger".equals(method)) {
			getSinger(request,response);
		}
		if("edit".equals(method)) {
			edit(request,response);
		}
	}
	
	private void getSinger(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String exp_id = request.getParameter("exp_id");
		
		Expriment ex = service.get(exp_id);
		JSONObject jsonObj = new JSONObject().fromObject(ex);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
	}

	//delete experiment
	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		JsonBean j = new JsonBean();
		String ids = request.getParameter("ids");
		System.out.println(ids);

		service.del(ids);
		j.setSuccess(true);
		
		JSONObject jsonObj = new JSONObject().fromObject(j);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
	}

	//add experiment
	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String experment_num = request.getParameter("experment_num");
		String experment_name = request.getParameter("experment_name");
		String experment_time = request.getParameter("experment_time");
		String experment_type = request.getParameter("experment_type");
		String experment_require = request.getParameter("experment_require");
		String experment_grounp = request.getParameter("experment_grounp");
		String experment_grounp_now = request.getParameter("experment_grounp_now");
		String experment_obj = request.getParameter("experment_obj");
		String totalStuNum = request.getParameter("totalStuNum");
		String experment_state = request.getParameter("experment_state");
		String labroom_name = request.getParameter("labroom_name");
		String exp_course_name = request.getParameter("exp_course_name");
		
		JsonBean j = new JsonBean();
		Expriment ex = new Expriment();
		ex.setExp_course_name(exp_course_name);
		ex.setExperment_grounp(experment_grounp);
		ex.setExperment_grounp_now(experment_grounp_now);
		ex.setExperment_name(experment_name);
		ex.setExperment_num(experment_num);
		ex.setExperment_obj(experment_obj);
		ex.setTotalStuNum(totalStuNum);
		ex.setExperment_require(experment_require);
		ex.setExperment_state(experment_state);
		ex.setExperment_time(experment_time);
		ex.setExperment_type(experment_type);
		ex.setLabroom_name(labroom_name);
		
		if (service.add(ex)) {
			j.setSuccess(true);
			j.setMsg("添加[" + experment_name + "]成功！");
		} else {
			j.setMsg("添加[" + experment_name + "]失败！");
		}
		
		JSONObject jsonObj = new JSONObject().fromObject(j);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
	}
	public void edit(HttpServletRequest request, HttpServletResponse response) throws IOException { 
		PrintWriter out = response.getWriter();
		String exp_id = request.getParameter("exp_id");
		System.out.println("exp_id"+exp_id);
		String experment_num = request.getParameter("experment_num");
		String experment_name = request.getParameter("experment_name");
		String experment_time = request.getParameter("experment_time");
		String experment_type = request.getParameter("experment_type");
		String experment_require = request.getParameter("experment_require");
		String experment_grounp = request.getParameter("experment_grounp");
		String experment_grounp_now = request.getParameter("experment_grounp_now");
		String experment_obj = request.getParameter("experment_obj");
		String totalStuNum = request.getParameter("totalStuNum");
		String experment_state = request.getParameter("experment_state");
		String labroom_name = request.getParameter("labroom_name");
		String exp_course_name = request.getParameter("exp_course_name");
		
		JsonBean j = new JsonBean();
		Expriment ex = new Expriment();
		//ex.setId(Integer.parseInt(exp_id));
		ex.setExp_course_name(exp_course_name);
		ex.setExperment_grounp(experment_grounp);
		ex.setExperment_grounp_now(experment_grounp_now);
		ex.setExperment_name(experment_name);
		ex.setExperment_num(experment_num);
		ex.setExperment_obj(experment_obj);
		ex.setTotalStuNum(totalStuNum);
		ex.setExperment_require(experment_require);
		ex.setExperment_state(experment_state);
		ex.setExperment_time(experment_time);
		ex.setExperment_type(experment_type);
		ex.setLabroom_name(labroom_name);
		
		if (service.edit(ex)) {
			j.setSuccess(true);
			j.setMsg("修改[" + experment_name + "]成功！");
		} else {
			j.setMsg("修改[" + experment_name + "]失败！");
		}
		
		JSONObject jsonObj = new JSONObject().fromObject(j);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
	}

	//查询实验表
	private void get(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
		
		
		int total = service.count(null);
		List list = service.get(page, rows, order, sort,null);
		
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
