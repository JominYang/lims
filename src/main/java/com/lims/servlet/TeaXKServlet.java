package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import com.lims.bean.Student;
import com.lims.dao.CurseDao;
import com.lims.dao.StuXKdao;

public class TeaXKServlet extends HttpServlet {

	private static final long serialVersionUID = -8193786169711776945L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sub = request.getParameter("sub");
		System.out.println(sub);
		String teacherXK = "teacherXK";
		String studentXK = "studentXK";
		
		if(sub.equals(teacherXK)){
			teacherXK(request,response);
		}
		if(sub.equals(studentXK)){
			studentXK(request,response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	public void teacherXK(HttpServletRequest request,
			HttpServletResponse response) {
		String ids = request.getParameter("ids");
		String[] id = ids.split(",");
		int[] curseid =new int[id.length];
		for(int i=0;i<id.length;i++){
			curseid[i] = new Integer(id[i]);
		}
		HttpSession session = request.getSession();
		String teachername = (String) session.getAttribute("teachername");
		CurseDao cudao = new CurseDao();
		cudao.InsertTeacherCu(teachername, curseid);
	}
	
	public void studentXK(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String ids = request.getParameter("ids");
		String[] id = ids.split(",");
		int[] curseid =new int[id.length];
		for(int i=0;i<id.length;i++){
			curseid[i] = new Integer(id[i]);
		}
		HttpSession session = request.getSession();
		Student stu = (Student) session.getAttribute("student");
		String stu_name = stu.getStu_num();
		StuXKdao stuxkDao = new StuXKdao();
		JSONObject jsonObject = new JSONObject();
		boolean flag1 = stuxkDao.isSelect(curseid, stu_name);
		System.out.println("flag1==="+flag1);
		if(!flag1){
			jsonObject.put("msg", "重复选择了实验");
			response.getWriter().write(jsonObject.toString());
			return;
		}
		boolean flag = stuxkDao.stuXk(curseid, stu_name);
		System.out.println("flag    ==="+flag);
		if(flag){
			jsonObject.put("msg", "选课成功");
		}else{
			jsonObject.put("msg", "选课过程中出现了问题");
		}
		
			response.getWriter().write(jsonObject.toString());
		
	}
}
