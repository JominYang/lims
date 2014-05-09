package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lims.bean.KechengBiao;
import com.lims.bean.Student;
import com.lims.dao.CurseDao;

public class CurseDetailServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String kechengId=(String)request.getParameter("kechengId");
		CurseDao curseDao = new CurseDao();
		int kbid = new Integer(kechengId);
		KechengBiao kb = new KechengBiao();
		ArrayList<Student> stuList = new ArrayList<Student>();
		kb = curseDao.getAllCurseByKbId(kbid);
		stuList = curseDao.getAllStuByExpId(kbid);
		request.setAttribute("stuList", stuList);
		request.setAttribute("kbInfo", kb);
		request.getRequestDispatcher("/jsp/teacher/detailInfo.jsp").forward(request, response);
	}	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
