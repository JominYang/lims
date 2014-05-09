package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.lims.bean.Student;
import com.lims.dao.CurseDao;

public class TeaDCJServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sub = request.getParameter("sub");
		if(sub.equals("DCJ")){
			dcj(request,response);
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	
	public void dcj(HttpServletRequest request, HttpServletResponse response){
		String sco = request.getParameter("allCJ");
		String allNum = request.getParameter("allNum");
		String kbID = request.getParameter("kbId");
		String ddd = request.getParameter("stuNums");
		System.out.println(ddd);
		String scores[] =  sco.split(",");
		String stuNums[] = allNum.split(",,");
		
		System.out.println(allNum);
		ArrayList<Student> StuList = new ArrayList();
		Student stu = null;
		for(int i=0;i<stuNums.length;i++){
			stu = new Student();
			if(i==0){
				stu.setStu_num(stuNums[0].substring(1));
				
			}else{
				stu.setStu_num(stuNums[i]);
			}
			int j=i*3;
			int a = new Integer(scores[j].trim());
			int b = new Integer(scores[j+1].trim());
			int c = new Integer(scores[j+2].trim());
			int d = (int) (a*0.4+b*0.4+c*0.2);
			stu.setScore1(a);
			stu.setScore2(b);
			stu.setScore3(c);	
			stu.setScoreTotal(d);
			StuList.add(stu);
		}
		for(int i=0;i<StuList.size();i++){
			System.out.println(StuList.get(i).getStu_num());
		}
		CurseDao cudao = new CurseDao();
		int KB_id = new Integer(kbID);
		boolean bool =  cudao.teaDCJ(StuList, KB_id);
		 JSONObject jsonObject = new JSONObject();
		    if(bool){
				jsonObject.put("msg", "登录成绩成功");
				try {
					response.getWriter().write(jsonObject.toString());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}else{
				jsonObject.put("msg", "登录成绩失败");
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
