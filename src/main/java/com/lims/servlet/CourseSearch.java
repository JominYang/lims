package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lims.bean.Expriment;
import com.lims.bean.KechengBiao;
import com.lims.bean.Labroom;
import com.lims.bean.Student;
import com.lims.bean.Teacher;
import com.lims.dao.CurseDao;
import com.lims.dao.LabDao;
import com.lims.tools.DateUtil;

public class CourseSearch extends HttpServlet {

	
	private static final long serialVersionUID = -975353866769091748L;
	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String method = (String)request.getParameter("method");
		String method1 = new String("byCuname");
		String method2 = new String("bycreateTime");
		String method3 = new String("searchAll");
		String method4 = new String("searchAllbyStu");
		String method5 = new String("searchAllbyTea");
		
		System.out.println(method3);
		if(method.equals(method1)){
			getCunameByCuname(request,response);
		}
		if(method.equals(method2)){
			getCunameBycreateTime(request,response);
		}
		if(method.equals(method3)){
			getAllCurse(request,response);
		}
		if(method.equals(method4)){
			searchAllbyStu(request,response);
		}
		if(method.equals(method5)){
			searchAllbyTea(request,response);
		}
		//System.out.println(method.equals(method4)+"jhkhikhk");
		
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}
	//按课表的名称查询课表
	public void getCunameByCuname(HttpServletRequest request, HttpServletResponse response){
		CurseDao cudao = new CurseDao();
		//String labname = request.getParameter("labname");
		LabDao labdao = new LabDao();
		ArrayList<Labroom> lablist = new ArrayList<Labroom>();
		lablist = labdao.select();
		JSONObject jsonobj = null;
		JSONObject jsonobj1 = null;
		JSONObject jsonobj2 = null;
		JSONArray jsonarray = new JSONArray();
		JSONArray jsonarray1 = new JSONArray();
		for(int i=0;i<lablist.size();i++){
			jsonobj = new JSONObject();
			jsonobj.put("id", i);
			jsonobj.put("text", lablist.get(i).getLabroom_name());
			ArrayList<KechengBiao> cuList = new ArrayList<KechengBiao>();
			 cuList = cudao.getAllCuname(lablist.get(i).getLabroom_name());
			for(int j=0;j<cuList.size();j++){
				String kebiaoname = cuList.get(j).getKechengbiao_name();
				String createTime = cuList.get(j).getCreateDate();
				jsonobj1 = new JSONObject();
				jsonobj1.put("id", i+"-"+j);
				jsonobj1.put("text", kebiaoname);
				jsonobj2 = new JSONObject();
				jsonobj2.put("id", i+"-"+j);
				jsonobj2.put("text", createTime);
			
				jsonarray.add(jsonobj1);
				jsonarray1.add(jsonobj2);
			}
		}
		jsonobj.put("kebiaoname", jsonarray);
		jsonobj.put("createDate", jsonarray1);
		JSONArray jsonarray2 = new JSONArray();
		jsonarray2.add(jsonobj);
		try {
			response.getWriter().write(jsonarray2.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//按课表的创建的时间查询
	public void getCunameBycreateTime(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		CurseDao cudao = new CurseDao();
		String labname = request.getParameter("labname");
		ArrayList<KechengBiao> cuList = cudao.getAllCuname(labname);
		JSONObject jsonobj = null;
		JSONArray jsonarray = new JSONArray();
		for(int i=0;i<cuList.size();i++){
			jsonobj = new JSONObject();
			jsonobj.put("id", i);
			jsonobj.put("text", cuList.get(i).getCreateDate());
			jsonarray.add(jsonobj);
		}
		try {
			response.getWriter().write(jsonarray.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//查询所有的课程，对应于teacherXK.JSP
	public void getAllCurse(HttpServletRequest request,
			HttpServletResponse response) {
		//得到page，得到rows
		int page =  new Integer(request.getParameter("page"));
		int rows = new Integer(request.getParameter("rows"));
		String labroom = request.getParameter("labroom");
		String exp = request.getParameter("exp");
		String startDate = request.getParameter("statdate");
		String endDate = request.getParameter("enddate");
		
		DateUtil dateUtil = new DateUtil();
		KechengBiao kb = new KechengBiao();
		kb.setLabroomName(labroom);
		kb.setExperiment_name(exp);
		kb.setStarDate(startDate);
		kb.setEndDate(endDate);
		CurseDao cudao = new CurseDao();
		if(!(kb.getLabroomName()==null)||!(kb.getExperiment_name()==null)||!(kb.getStarDate()==null)||!(kb.getEndDate()==null)){
			ArrayList<KechengBiao> list = new ArrayList<KechengBiao>();
			list = cudao.getSomeCurse(kb.getLabroomName(),kb.getExperiment_name(),kb.getStarDate(),kb.getEndDate(),page,rows);
			JSONObject jsonobj = null;
			JSONArray jsonArray = new JSONArray();
			System.out.println(list.toString());
			for(int i=0;i<list.size();i++){
				jsonobj = new JSONObject();
				jsonobj.put("id", list.get(i).getId());
				jsonobj.put("experiment_name", list.get(i).getExperiment_name());
				jsonobj.put("curentDate", list.get(i).getCurentday());
				String xingqiji = dateUtil.changeWeekDay(list.get(i).getXingqiji());
				jsonobj.put("xingqiji", xingqiji);
				jsonobj.put("dijijie", list.get(i).getDijijie());
				jsonobj.put("kexuan", list.get(i).getTotalStuNum());
				jsonobj.put("yixuan", list.get(i).getCurentStuNum());
				jsonobj.put("teacher_name", list.get(i).getTeacher_name());
				jsonArray.add(jsonobj);
			}
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total", cudao.getCurseTotalByCondition(kb.getLabroomName(),kb.getExperiment_name(),kb.getStarDate(),kb.getEndDate()));
			jsonObj.put("rows", jsonArray);
			System.out.println(jsonObj.toString());
			try {
				response.getWriter().write(jsonObj.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		else{
		
		ArrayList<KechengBiao> allkblist = new ArrayList<KechengBiao>();
		allkblist = cudao.getAllCurse(page,rows);
		JSONObject jsonobj = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i=0;i<allkblist.size();i++){
			jsonobj = new JSONObject();
			jsonobj.put("id", allkblist.get(i).getId());
			jsonobj.put("experiment_name", allkblist.get(i).getExperiment_name());
			jsonobj.put("curentDate", allkblist.get(i).getCurentday());
			String xingqiji = dateUtil.changeWeekDay(allkblist.get(i).getXingqiji());
			jsonobj.put("xingqiji", xingqiji);
			jsonobj.put("dijijie", allkblist.get(i).getDijijie());
			jsonobj.put("kexuan", allkblist.get(i).getTotalStuNum());
			jsonobj.put("yixuan", allkblist.get(i).getCurentStuNum());
			jsonobj.put("teacher_name", allkblist.get(i).getTeacher_name());
			
			jsonArray.add(jsonobj);
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("total", cudao.getCurseTotal());
		jsonObj.put("rows", jsonArray);
		try {
			response.getWriter().write(jsonObj.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
	}
	/*
	 * 按学生学号查询实验，对应于stuCourse.jsp
	 */
	public void searchAllbyStu(HttpServletRequest request,
			HttpServletResponse response) {
		int page =  new Integer(request.getParameter("page"));
		int rows = new Integer(request.getParameter("rows"));
		String exp = request.getParameter("exp");
		String startDate = request.getParameter("statdate");
		String endDate = request.getParameter("enddate");
		HttpSession session = request.getSession();
		String stuno =  ((Student)session.getAttribute("student")).getStu_num();
		KechengBiao kb = new KechengBiao();
		kb.setExperiment_name(exp);
		kb.setStarDate(startDate);
		kb.setEndDate(endDate);
		
		DateUtil dateUtil = new DateUtil();

		CurseDao cudao = new CurseDao();
		if(!(kb.getLabroomName()==null)||!(kb.getExperiment_name()==null)||!(kb.getStarDate()==null)||!(kb.getEndDate()==null)){
			ArrayList<KechengBiao> list = new ArrayList<KechengBiao>();
			list = cudao.getSomeCurseByStu(kb.getLabroomName(),kb.getExperiment_name(),kb.getStarDate(),kb.getEndDate(),page,rows,stuno);
			JSONObject jsonobj = null;
			JSONArray jsonArray = new JSONArray();
			for(int i=0;i<list.size();i++){
				jsonobj = new JSONObject();
				jsonobj.put("id", list.get(i).getId());
				jsonobj.put("experiment_name", list.get(i).getExperiment_name());
				jsonobj.put("curentDate", list.get(i).getCurentday());
				String xingqiji = dateUtil.changeWeekDay(list.get(i).getXingqiji());
				jsonobj.put("xingqiji", xingqiji);
				jsonobj.put("dijijie", list.get(i).getDijijie());
				jsonobj.put("teacher_name", list.get(i).getTeacher_name());
				jsonArray.add(jsonobj);
			}
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total", cudao.getCurseTotalByConditionByStu(stuno,kb.getExperiment_name(),kb.getStarDate(),kb.getEndDate()));
			jsonObj.put("rows", jsonArray);
			System.out.println(jsonObj.toString());
			try {
				response.getWriter().write(jsonObj.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		else{
		
		ArrayList<KechengBiao> allkblist = new ArrayList<KechengBiao>();
		allkblist = cudao.getAllCurseByStu(page,rows,stuno);
		JSONObject jsonobj = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i=0;i<allkblist.size();i++){
			jsonobj = new JSONObject();
			jsonobj.put("id", allkblist.get(i).getId());
			jsonobj.put("experiment_name", allkblist.get(i).getExperiment_name());
			jsonobj.put("curentDate", allkblist.get(i).getCurentday());
			String xingqiji = dateUtil.changeWeekDay(allkblist.get(i).getXingqiji());
			jsonobj.put("xingqiji", xingqiji);
			jsonobj.put("dijijie", allkblist.get(i).getDijijie());
			jsonobj.put("teacher_name", allkblist.get(i).getTeacher_name());
			
			jsonArray.add(jsonobj);
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("total", cudao.getCurseTotal(stuno));
		jsonObj.put("rows", jsonArray);
		try {
			response.getWriter().write(jsonObj.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
	}
	//按教师名字查询教师的课表
	public void searchAllbyTea(HttpServletRequest request,
			HttpServletResponse response) {
		int page =  new Integer(request.getParameter("page"));
		int rows = new Integer(request.getParameter("rows"));
		String exp = request.getParameter("exp");
		String startDate = request.getParameter("statdate");
		String endDate = request.getParameter("enddate");
		HttpSession session = request.getSession();
		String teacherName =  ((Teacher)session.getAttribute("teacher")).getTeacher_name();
		KechengBiao kb = new KechengBiao();
		kb.setExperiment_name(exp);
		kb.setStarDate(startDate);
		kb.setEndDate(endDate);
		
		DateUtil dateUtil = new DateUtil();

		CurseDao cudao = new CurseDao();
		if(!(kb.getLabroomName()==null)||!(kb.getExperiment_name()==null)||!(kb.getStarDate()==null)||!(kb.getEndDate()==null)){
			ArrayList<KechengBiao> list = new ArrayList<KechengBiao>();
			list = cudao.getSomeCurseByTea(kb.getLabroomName(),kb.getExperiment_name(),kb.getStarDate(),kb.getEndDate(),page,rows,teacherName);
			JSONObject jsonobj = null;
			JSONArray jsonArray = new JSONArray();
			for(int i=0;i<list.size();i++){
				jsonobj = new JSONObject();
				jsonobj.put("id", list.get(i).getId());
				jsonobj.put("experiment_name", list.get(i).getExperiment_name());
				jsonobj.put("curentDate", list.get(i).getCurentday());
				String xingqiji = dateUtil.changeWeekDay(list.get(i).getXingqiji());
				jsonobj.put("xingqiji", xingqiji);
				jsonobj.put("dijijie", list.get(i).getDijijie());
				jsonobj.put("yixuan", list.get(i).getCurentStuNum());
				jsonArray.add(jsonobj);
			}
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total", cudao.getCurseTotalByConditionByTea(teacherName,kb.getExperiment_name(),kb.getStarDate(),kb.getEndDate()));
			jsonObj.put("rows", jsonArray);
			System.out.println(jsonObj.toString());
			try {
				response.getWriter().write(jsonObj.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		else{
		
		ArrayList<KechengBiao> allkblist = new ArrayList<KechengBiao>();
		allkblist = cudao.getAllCurseByTea(page,rows,teacherName);
		JSONObject jsonobj = null;
		JSONArray jsonArray = new JSONArray();
		
		for(int i=0;i<allkblist.size();i++){
			jsonobj = new JSONObject();
			jsonobj.put("id", allkblist.get(i).getId());
			jsonobj.put("experiment_name", allkblist.get(i).getExperiment_name());
			jsonobj.put("curentDate", allkblist.get(i).getCurentday());
			String xingqiji = dateUtil.changeWeekDay(allkblist.get(i).getXingqiji());
			jsonobj.put("xingqiji", xingqiji);
			jsonobj.put("dijijie", allkblist.get(i).getDijijie());
			jsonobj.put("yixuan", allkblist.get(i).getCurentStuNum());
			
			jsonArray.add(jsonobj);
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("total", cudao.getCurseTotalByTea(teacherName));
		jsonObj.put("rows", jsonArray);
		try {
			response.getWriter().write(jsonObj.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
	} 

}
