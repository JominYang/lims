package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lims.bean.Expriment;
import com.lims.bean.Student;
import com.lims.bean.Teacher;
import com.lims.dao.CurseDao;
import com.lims.dao.LabDao;

public class TeaFuctionServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method.equals("expSearch")){
			searchCurse(request,response);
		}
		if(method.equals("expSearchQD")){
			searchCurseQD(request,response);
		}
		if(method.equals("stuQD")){
			stuQD(request,response);
		}
		if(method.equals("QD")){
			QD(request,response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	//老师查课时，查找自己选择的实验。
	//对应于teaCourse.jsp
	public void searchCurse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String teacherName =  ((Teacher)session.getAttribute("teacher")).getTeacher_name();
		LabDao labdao = new LabDao();
		JSONObject jsonObject=null;
		JSONObject jsonObject1=null;
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonArray1 = new JSONArray();
		ArrayList<Expriment> alist = null;
		
		//得到所有实验室的名称
		alist = labdao.selectExpByTea(teacherName);
		for(int i=0;i<alist.size();i++){
			String labroom_name = alist.get(i).getExperimentS_name();
			jsonObject = new JSONObject();
			jsonObject.put("id", labroom_name);
			jsonObject.put("text", labroom_name);
			jsonArray.add(jsonObject);
		}
		response.getWriter().write(jsonArray.toString());
	}
	//对应于teaCourse.jsp
		public void searchCurseQD(HttpServletRequest request, HttpServletResponse response) throws IOException {
			HttpSession session = request.getSession();
			String teacherName =  ((Teacher)session.getAttribute("teacher")).getTeacher_name();
			LabDao labdao = new LabDao();
			JSONObject jsonObject=null;
			JSONObject jsonObject1=null;
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray1 = new JSONArray();
			ArrayList<Expriment> alist = null;
			
			//得到所有实验室的名称
			alist = labdao.selectExpByTeaQD(teacherName);
			for(int i=0;i<alist.size();i++){
				String labroom_name = alist.get(i).getExperimentS_name();
				System.out.println(labroom_name);
				jsonObject = new JSONObject();
				jsonObject.put("id", alist.get(i).getId());
				jsonObject.put("text", labroom_name);
				jsonArray.add(jsonObject);
			}
			response.getWriter().write(jsonArray.toString());
		}
	//学生签到
	public void stuQD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String exp = (String)request.getParameter("exp");
		String expId = new String(exp.getBytes("iso-8859-1"),"UTF-8");
		//根据实验的ID得到所有学生信息
		ArrayList<Student> stuList = new ArrayList<Student>();
		CurseDao cuDao = new CurseDao();
		int id = new Integer(expId);
		stuList = cuDao.getAllStuByExpId(id);
		request.setAttribute("stuList", stuList);
		System.out.println(stuList.get(0).getMajor_name());
		request.setAttribute("expId", expId);
		request.getRequestDispatcher("/jsp/teacher/stuQD.jsp").forward(request, response);
	}
	
	public void QD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stuId = (String)request.getParameter("stu_num");
		String kb_id = (String)request.getParameter("kb_id");
		System.out.println("kb_id==="+kb_id);
		int kbid = new Integer(kb_id);
		CurseDao cuDao = new CurseDao();
		Date now = new Date();
	    DateFormat d3 = DateFormat.getTimeInstance();
	    String time = d3.format(now);
	    System.out.println(time);
	    boolean bool = cuDao.stuQD(stuId, time,kbid);
	    JSONObject jsonObject = new JSONObject();
	    if(bool){
			jsonObject.put("msg", "签到成功");
			try {
				response.getWriter().write(jsonObject.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}else{
			jsonObject.put("msg", "签到失败");
			try {
				response.getWriter().write(jsonObject.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}

	}
}
