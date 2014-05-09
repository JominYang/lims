package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lims.bean.KechengBiao;
import com.lims.dao.CurseDao;
import com.lims.tools.DataTools;
import com.lims.tools.DateUtil;
import com.lims.tools.PaikeMethod;
/***
 * 
 * @author 廖金铭
 * 功能：讲表单提交的数据，安排成课表，插入数据。
 *
 */
public class PaikeSubServlet extends HttpServlet {


	private static final long serialVersionUID = -7532489883204156377L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sub = request.getParameter("sub");
		System.out.println(sub);
		String subSure = "subCondition";
		String modify = "modify";
		String paikeDIY = "paikeByhand";
		if(sub.equals(subSure)){
			paikeBySubCondition(request,response);
		}else if(sub.equals(modify)){
			modifyKebiao(request,response);
		}else if(sub.equals(paikeDIY)){
			paikeDIY(request,response);
		}
		
	}
	

	


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	//修改课表的方法
	public void modifyKebiao(HttpServletRequest request,HttpServletResponse response) {
		String[] AllData = (String[])request.getParameterValues("culist[]");
		
		String startdate = request.getParameter("startDate");
		String enddate = request.getParameter("endDate");
		String labname = request.getParameter("labname");
		System.out.println("-------"+labname);
		String kebiaoname = request.getParameter("kebiaoname");
		int weekPage = new Integer(request.getParameter("weekPage"));
		DataTools dt = new DataTools();
		KechengBiao kb = null;
		ArrayList<String> resultdata = new ArrayList<String>();
		resultdata = dt.dataTools(AllData);
	
		
		ArrayList<KechengBiao> kbList = new ArrayList<KechengBiao>();
		for(int i=0;i<resultdata.size();i++){
			if(resultdata.get(i)!=""&&!resultdata.get(i).equals("")&&!resultdata.get(i).equals(null)){
				kb = new KechengBiao();
				String expName = resultdata.get(i);
				//这里是tab不是空格
				String Names[] = expName.split("	");
				String experimentName=null;
				String teacherName=null;
				if(Names.length>1){
					
					teacherName = Names[Names.length-1];
				}
				experimentName = Names[0];
				System.out.println("实验名"+experimentName);
				System.out.println("教师名"+teacherName);
				kb.setExperiment_name(experimentName);
				kb.setDijijie(i/7+1);
				kb.setXingqiji(i%7+1);
				kb.setLabroomName(labname);
				kb.setStarDate(startdate);
				kb.setEndDate(enddate);
				kb.setTeacher_name(teacherName);
				kb.setWeekpage(weekPage);
				kb.setKechengbiao_name(kebiaoname);
				if(resultdata.get(i)!=""){
					kbList.add(kb);
				}
			}
		}
		for(int i=0;i<kbList.size();i++){
			System.out.println(kbList.get(i).getExperiment_name());
		}
		CurseDao cd = new CurseDao();
		if(!cd.deleteKEBiaobyWeek(weekPage,kebiaoname)){
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("msg", "课表更新失败，如有问题请发送邮件到263687970@qq.com！");
			try {
				response.getWriter().write(jsonObject.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		cd.setKechengbiao(kbList);
		JSONObject jsonObject = new JSONObject();
	
		jsonObject.put("msg", "课表已生成，请到课表中心查看！");
		try {
			response.getWriter().write(jsonObject.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	
	
	public void paikeBySubCondition(HttpServletRequest request, HttpServletResponse response){
		
		String dateStart =null;
		String dateEnd =null;
		String weekStart = null;
		String weekEnd =null;
		//得到课程表的名称
		String cuname=request.getParameter("cuname");
		//得到实验室的名称
		String Labroom=request.getParameter("Labroom");
		//得到实验的其实时间
		dateStart=request.getParameter("dateStart");
		//得到实验结束时间
		dateEnd=request.getParameter("dateEnd");
		weekStart=request.getParameter("weekStart");
		weekEnd=request.getParameter("weekEnd");
		//得到是否在周末排课
		String ifweekend= new String("bupaike");
		//得到开设的实验的名称，是一个所有名称连在一起的字符串
		String exp=request.getParameter("exp");
		String[] expArray = exp.split(",");
	

		String bupaike="bupaike";
		String paike="paike";
		PaikeMethod paikeMethod = new PaikeMethod();
		//new出一个课程表的对象
		KechengBiao kechengbiao = new KechengBiao();
		//添加课程表的名字
		kechengbiao.setKechengbiao_name(cuname);
		//添加实验的名称，仍然是一个所有实验名称的字符串
		kechengbiao.setExperiment_name(exp);

		//1，不排星期六星期天，按日期排
		CurseDao cudao = new CurseDao();
		JSONObject jsonObject = new JSONObject();
		System.out.println(ifweekend.equals(bupaike));
		if(ifweekend.equals(bupaike)){
			kechengbiao.setStarDate(dateStart);
			kechengbiao.setEndDate(dateEnd);
			kechengbiao.setLabroomName(Labroom);
			ArrayList<KechengBiao> alist = new ArrayList<KechengBiao>();
			
			//得到所有的课程表名的方法，传入到alist中
			alist = cudao.getAllCuname(Labroom);
			boolean bool = false;
			for(int i=0;i<alist.size();i++){
				if(alist.get(i).getKechengbiao_name().equals(cuname)){
						bool = true;
				}
			}
			//如果课程表重复，则显示，课程表名重复
			if(bool){
				jsonObject.put("msg", "课程表名重复，请修改表名！");
				//System.out.println(jsonArray);
				 try {
					response.getWriter().write(jsonObject.toString());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(!cudao.getKechengbiao(dateStart,dateEnd,Labroom)){
				jsonObject.put("msg", "时间上重叠，请重新安排时段，如果一定要排课，请先删除该时段的课表！");
				//System.out.println(jsonArray);
				 try {
					response.getWriter().write(jsonObject.toString());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String fodate = sdf.format(date);
				boolean bool1 = cudao.InsertKbtotal(cuname,fodate,Labroom);
				if(!bool1){
					jsonObject.put("msg", "非常遗憾！课表添加失败");
				}else{
					paikeMethod.paikeByWeeknoWeekend(kechengbiao);
					jsonObject.put("msg", "课表安排成功");
				}
				 try {
					response.getWriter().write(jsonObject.toString());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	//手动排课
	public void paikeDIY(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dateStart =null;
		String dateEnd =null;
		int curentpage=1;
		//得到课程表的名称
		String cu=request.getParameter("cuname");
		String cuname = null;
		
		//得到实验室的名称
		String Lab=request.getParameter("Labroom");
		String Labroom=null;
		try {
			Labroom = 	java.net.URLDecoder.decode(Lab, "UTF-8");
			cuname = java.net.URLDecoder.decode(cu, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//得到实验的其实时间
		dateStart=request.getParameter("dateStart");
		//得到实验结束时间
		dateEnd=request.getParameter("dateEnd");
		//得到当前周数
		String pageweek = request.getParameter("weekpage");
		System.out.println("1111="+cuname);
		System.out.println("2222="+Labroom);
		
		
		request.setAttribute("cuname", cuname);
		request.setAttribute("Labroom", Labroom);
		request.setAttribute("dateStart", dateStart);
		request.setAttribute("dateEnd", dateEnd);
		if(pageweek!=""&&pageweek!=null&&!pageweek.equals("")){
			int page = new Integer(pageweek);
			
			request.setAttribute("curentpage", page);
		}else{
			request.setAttribute("curentpage", curentpage);
		}
		//求出两段日期内经历的周数
		int maxWeek = getWeeks(dateEnd,dateStart);
		request.setAttribute("maxpage", maxWeek);
		//判断时间上是否冲突，是否重名
		KechengBiao kechengbiao = new KechengBiao();
		kechengbiao.setStarDate(dateStart);
		kechengbiao.setEndDate(dateEnd);
		kechengbiao.setLabroomName(Labroom);
		ArrayList<KechengBiao> alist = new ArrayList<KechengBiao>();
		String message = null;
		//得到所有的课程表名的方法，传入到alist中
		CurseDao cudao = new CurseDao();
		alist = cudao.getAllCuname(Labroom);
		boolean bool = false;
		for(int i=0;i<alist.size();i++){
			if(alist.get(i).getKechengbiao_name().equals(cuname)){
					bool = true;
			}
		}
		//如果课程表重复，则显示，课程表名重复
		if(bool){
			message = "课程表名重复，请修改表名！";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/jsp/firstadmin/function/paikeError.jsp").forward(request, response);
			
		}
		else if(!cudao.getKechengbiao(dateStart,dateEnd,Labroom)){
			message= "时间上重叠，请重新安排时段，如果一定要排课，请先删除该时段的课表！";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/jsp/firstadmin/function/paikeError.jsp").forward(request, response);
			
			 
		}
		else{
			request.getRequestDispatcher("/jsp/firstadmin/function/paikeDIYsub.jsp").forward(request, response);
		}
	}
	//求出日期内经历周数的方法
	public int getWeeks(String dateEnd, String dateStart) {
		DateUtil dateUtil  = new DateUtil();
		Calendar beginDate = dateUtil.stringToCarlendar(dateStart);
		Calendar endDate = dateUtil.stringToCarlendar(dateEnd);
		int count = dateUtil.betweenDays(beginDate, endDate);
		String startXinqi = dateUtil.getWeekday(dateStart);
		int start = dateUtil.changeWeekDay(startXinqi);
		String endXinqi = dateUtil.getWeekday(dateEnd);
		int end = dateUtil.changeWeekDay(endXinqi);
		int maxWeek = dateUtil.getWeek(start, end, count);
		return maxWeek;
	}
}
