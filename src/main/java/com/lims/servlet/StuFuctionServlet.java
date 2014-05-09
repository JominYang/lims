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
import com.lims.bean.Labroom;
import com.lims.bean.Student;
import com.lims.dao.LabDao;

public class StuFuctionServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method.equals("expSearch")){
			searchCurse(request,response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	//学生查课时，查找自己选择的实验。
	//对应于stuCourse.jsp
	public void searchCurse(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String stuno =  ((Student)session.getAttribute("student")).getStu_num();
		LabDao labdao = new LabDao();
		JSONObject jsonObject=null;
		JSONObject jsonObject1=null;
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonArray1 = new JSONArray();
		ArrayList<Expriment> alist = null;
		
		//得到所有实验室的名称
		alist = labdao.selectExpBystu(stuno);
		for(int i=0;i<alist.size();i++){
			String labroom_name = alist.get(i).getExperimentS_name();
			jsonObject = new JSONObject();
			jsonObject.put("id", labroom_name);
			jsonObject.put("text", labroom_name);
			jsonArray.add(jsonObject);
		}
		response.getWriter().write(jsonArray.toString());
	}
	


}
