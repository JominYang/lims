package com.lims.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.lims.bean.Expriment;
import com.lims.bean.KechengBiao;
import com.lims.bean.Student;
import com.lims.db.DBUtil;
import com.lims.tools.DateUtil;

public class CurseDao {
	private  ResultSet rs;
	private  Connection conn;
	private  PreparedStatement ps;
	DateUtil dateutil = new DateUtil();
	//对应于排课系统的将排课结果存入数据库
	public boolean setKechengbiao(ArrayList<KechengBiao> list){
		DateUtil datautil = new DateUtil();
		ArrayList<Expriment> alist = new ArrayList<Expriment>();
		conn = DBUtil.getConn();
		String sql = "INSERT into kechengbiao_fenbiao"+
					"(startDate,endDate,xingqiji,experiment_name,dijijie,kechengbiao_name,weekpage,labroom,curentDate,teacher_name,curentStuNum)"+ 
					"VALUES (?,?,?,?,?,?,?,?,?,?,?);";
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<list.size();i++){
				ps.setString(1, list.get(i).getStarDate());
				String startDate = list.get(i).getStarDate();
				int start = dateutil.changeWeekDay(dateutil.getWeekday(startDate));
				ps.setString(2, list.get(i).getEndDate());
				ps.setInt(3,list.get(i).getXingqiji());
				ps.setString(4, list.get(i).getExperiment_name());
				ps.setInt(5, list.get(i).getDijijie());
				ps.setString(6, list.get(i).getKechengbiao_name());
				if(start>5){
					ps.setInt(7, list.get(i).getWeekpage()-1);
				}else{
					ps.setInt(7, list.get(i).getWeekpage());
				}
				ps.setString(8, list.get(i).getLabroomName());
			
				String date = dateutil.getCurentDate(list.get(i).getStarDate(), list.get(i).getWeekpage(), list.get(i).getXingqiji());
				Date curentDate = dateutil.StringtoDate(date);
				java.sql.Date dateTime = new java.sql.Date(curentDate.getTime());
				ps.setDate(9, dateTime);
				ps.setString(10, list.get(i).getTeacher_name());
				ps.setInt(11, 0);
				ps.addBatch();
			}
			int num[]  =ps.executeBatch();
			for(int j=0;j<num.length;j++){
				if(num[j]<0){
					return false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return true;
	}
	//根据周次,课表名删除课表
	public boolean deleteKEBiaobyWeek(int weekPage,String kebiaoming){
		conn = DBUtil.getConn();
		String sql = "delete from kechengbiao_fenbiao where weekpage=? and kechengbiao_name=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, weekPage);
			ps.setString(2, kebiaoming);
			int flag = ps.executeUpdate();
			if(flag!=0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	//更新所有的课表
	public boolean updateKechengbiao(ArrayList<KechengBiao> list){
		ArrayList<Expriment> alist = new ArrayList<Expriment>();
		conn = DBUtil.getConn();
		String sql = "update kechengbiao_fenbiao set startDate=?,xingqiji=?,dijijie=?,weekpage=? where xingqi;";
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<list.size();i++){
				ps.setString(1, list.get(i).getStarDate());
				ps.setString(2, list.get(i).getEndDate());
				ps.setInt(3,list.get(i).getXingqiji());
				ps.setString(4, list.get(i).getExperiment_name());
				ps.setInt(5, list.get(i).getDijijie());
				ps.setString(6, list.get(i).getKechengbiao_name());
				ps.setInt(7, list.get(i).getWeekpage());
				ps.setString(8, list.get(i).getLabroomName());
				ps.addBatch();
			}
			int num[]  =ps.executeBatch();
			for(int j=0;j<num.length;j++){
				if(num[j]<0){
					return false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return true;
	}
	//得到所有的实验名称，根据课表名字
	public ArrayList<String> getAllexpByKB(String kbname){
		conn = DBUtil.getConn();
		String sql = "SELECT experiment_name from kechengbiao_fenbiao WHERE kechengbiao_name=?;";
		ArrayList<String> expList = new ArrayList<String>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,kbname);
			rs = ps.executeQuery();
			while(rs.next()){
				String exp = rs.getString("experiment_name");
				expList.add(exp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return expList;
	}
	public boolean getKechengbiao(String sday,String eday,String lab){
		String sql = "SELECT startDate,endDate from kechengbiao_fenbiao WHERE labroom=?;";
		String startDate = sday;
		String endDate = eday;
		String labRoom = lab;
		conn =DBUtil.getConn();
		DateUtil dateutil = new DateUtil();
		Calendar startDate1 = dateutil.stringToCarlendar(startDate);
		Calendar endDate1= dateutil.stringToCarlendar(endDate);
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, labRoom);
			rs = ps.executeQuery();
			
			while(rs.next()){
				String stDate = rs.getString("startDate");
				String enDate = rs.getString("endDate");
				Calendar stDate1= dateutil.stringToCarlendar(stDate);
				Calendar enDate1=dateutil.stringToCarlendar(enDate);
				Calendar sday1 = dateutil.stringToCarlendar(sday);
				Calendar eday1 = dateutil.stringToCarlendar(eday);
				int i = 1;
				System.out.println("--------------------"+i+++"次");
				System.out.println("stDate++++"+stDate);
				System.out.println("enDate++++"+enDate);
				System.out.println(stDate1.compareTo(sday1));
				System.out.println(stDate1.compareTo(eday1));
				System.out.println(enDate1.compareTo(sday1));
				System.out.println(enDate1.compareTo(eday1));
				System.out.println("-----------------------------");
				
				if((dateutil.betweenDays(stDate1,startDate1)*dateutil.betweenDays(startDate1,enDate1))>=0){
					System.out.println("here?????");
					return false;
				}if((dateutil.betweenDays(stDate1,endDate1)*dateutil.betweenDays(endDate1,enDate1))>=0){
					System.out.println("herer????????");
					return false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		System.out.println("herer1213124124");
		return true;
	}
	
	//查询所有的课程
	public List<KechengBiao> searchAllCourse(int weekpage,String kebiaoming){
		String sql="select * from kechengbiao_fenbiao where weekpage=? and kechengbiao_name=? order by xingqiji,dijijie;";
		KechengBiao kb = null;
		List<KechengBiao> list = new ArrayList<KechengBiao>();
		conn = DBUtil.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, weekpage);
			ps.setString(2,kebiaoming );
			rs = ps.executeQuery();
			while(rs.next()){
				kb = new KechengBiao();
				kb.setDijijie(rs.getInt("dijijie"));
				kb.setLabroomName(rs.getString("labroom"));
				kb.setExperiment_name(rs.getString("experiment_name"));
				kb.setXingqiji(rs.getInt("xingqiji"));
				kb.setWeekpage(rs.getInt("weekpage"));
				kb.setStarDate(rs.getString("startDate"));
				kb.setEndDate(rs.getString("endDate"));
				kb.setTeacher_name(rs.getString("teacher_name"));
				list.add(kb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return list;
	}
	//查询最大的页数
	public int getMaxWeekPage(String kebiaoname){
		String sql = "select MAX(weekpage) from kechengbiao_fenbiao where kechengbiao_name=?;";
		conn = DBUtil.getConn();
		int i =1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, kebiaoname);
			rs = ps.executeQuery();
			while(rs.next()){
				i = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		System.out.println("i==="+i);
		return i;
		
	}

		
	//将课表名字和创建时间插入到KebiaoTotal中
	public boolean InsertKbtotal(String cuname,String date,String labroom){
		String sql = "insert into kechengbiao_total(kechengbiao_name,kechengbiao_createTime,labroom)"+
		"VALUES(?,?,?);";
		conn = DBUtil.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cuname);
			ps.setString(2, date);
			ps.setString(3, labroom);
			int flag = ps.executeUpdate();
			if(flag!=0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return false;
	}
	//得到所有课表的名称
	public ArrayList<KechengBiao> getAllCuname(String labroom){
		String sql = "SELECT kechengbiao_name,kechengbiao_createTime from kechengbiao_total where labroom=?;";
		ArrayList<KechengBiao> cuList = new ArrayList<KechengBiao>();
		KechengBiao kb = null;
		conn = DBUtil.getConn();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, labroom);
			rs = ps.executeQuery();
			while(rs.next()){
				kb = new KechengBiao();
				kb.setCreateDate(rs.getString("kechengbiao_createTime"));
				kb.setKechengbiao_name(rs.getString("kechengbiao_name"));
				cuList.add(kb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return cuList;
		
	}
	//根据创建时间得到课表名称
	public String getCuname(String date){
		conn = DBUtil.getConn();
		String sql ="select kechengbiao_name from kechengbiao_total where kechengbiao_createTime=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();
			while(rs.next()){
				return rs.getString("kechengbiao_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return null;
	}
	//得到所有的课程信息，对应于教师选课，（和学生选课）查询是显示当天时间以后的课程表信息
	public ArrayList<KechengBiao> getAllCurse(int page,int rows){
		String sql = "select * from kechengbiao_fenbiao where curentDate >= CURDATE() order by curentDate,dijijie limit ?,?;";
		conn = DBUtil.getConn();
		ArrayList<KechengBiao> list = new ArrayList<KechengBiao>();
		KechengBiao kb = null;
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, (page-1)*rows);
			ps.setInt(2, rows);
			ResultSet rs  = ps.executeQuery();
			while(rs.next()){
				kb = new KechengBiao();
				kb.setId(rs.getInt("id"));
				kb.setDijijie(rs.getInt("dijijie"));
				kb.setXingqiji(rs.getInt("xingqiji"));
				kb.setExperiment_name(rs.getString("experiment_name"));
				kb.setCurentday(rs.getString("curentDate"));
				kb.setTotalStuNum(rs.getInt("totalStuNum"));
				kb.setCurentStuNum(rs.getInt("curentStuNum"));
				if(rs.getString("teacher_name")==null){
					kb.setTeacher_name("暂无老师");
				}else{
					kb.setTeacher_name(rs.getString("teacher_name"));
				}
				list.add(kb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return list;
	}
	//按照学号查询所有的实验
	public ArrayList<KechengBiao> getAllCurseByStu(int page,int rows,String stuno){
		String sql = "select * from kechengbiao_fenbiao join stu_order on kechengbiao_fenbiao.id=stu_order.kb_id WHERE stu_order.stu_num=?  order by curentDate,dijijie limit ?,?;";
		conn = DBUtil.getConn();
		ArrayList<KechengBiao> list = new ArrayList<KechengBiao>();
		KechengBiao kb = null;
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, stuno);
			ps.setInt(2, (page-1)*rows);
			ps.setInt(3, rows);
			ResultSet rs  = ps.executeQuery();
			while(rs.next()){
				kb = new KechengBiao();
				kb.setId(rs.getInt("id"));
				kb.setDijijie(rs.getInt("dijijie"));
				kb.setXingqiji(rs.getInt("xingqiji"));
				kb.setExperiment_name(rs.getString("experiment_name"));
				kb.setCurentday(rs.getString("curentDate"));
				kb.setTotalStuNum(rs.getInt("totalStuNum"));
				kb.setCurentStuNum(rs.getInt("curentStuNum"));
				if(rs.getString("teacher_name")==null){
					kb.setTeacher_name("暂无老师");
				}else{
					kb.setTeacher_name(rs.getString("teacher_name"));
				}
				list.add(kb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return list;
	}
	//按照教师名查询所有的实验
		public ArrayList<KechengBiao> getAllCurseByTea(int page,int rows,String teacherName){
			String sql = "select * from kechengbiao_fenbiao  WHERE teacher_name=?  order by curentDate,dijijie limit ?,?;";
			conn = DBUtil.getConn();
			ArrayList<KechengBiao> list = new ArrayList<KechengBiao>();
			KechengBiao kb = null;
			
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, teacherName);
				ps.setInt(2, (page-1)*rows);
				ps.setInt(3, rows);
				ResultSet rs  = ps.executeQuery();
				while(rs.next()){
					kb = new KechengBiao();
					kb.setId(rs.getInt("id"));
					kb.setDijijie(rs.getInt("dijijie"));
					kb.setXingqiji(rs.getInt("xingqiji"));
					kb.setExperiment_name(rs.getString("experiment_name"));
					kb.setCurentday(rs.getString("curentDate"));
					kb.setCurentStuNum(rs.getInt("curentStuNum"));
					list.add(kb);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return list;
		}
		//按课表号查询实验的信息
				public KechengBiao getAllCurseByKbId(int kbid){
					String sql = "select * from kechengbiao_fenbiao  WHERE id=?;";
					conn = DBUtil.getConn();
					ArrayList<KechengBiao> list = new ArrayList<KechengBiao>();
					KechengBiao kb = null;
					try {
						PreparedStatement ps = conn.prepareStatement(sql);
						ps.setInt(1, kbid);
						ResultSet rs  = ps.executeQuery();
						while(rs.next()){
							kb = new KechengBiao();
							kb.setId(rs.getInt("id"));
							kb.setDijijie(rs.getInt("dijijie"));
							kb.setXingqiji(rs.getInt("xingqiji"));
							kb.setExperiment_name(rs.getString("experiment_name"));
							kb.setCurentday(rs.getString("curentDate"));
							kb.setLabroomName(rs.getString("labroom"));
							kb.setTeacher_name(rs.getString("teacher_name"));
							kb.setTotalStuNum(rs.getInt("totalStuNum"));
							kb.setCurentStuNum(rs.getInt("curentStuNum"));
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						DBUtil.clearUp(rs, ps, conn);
					}
					return kb;
				}
	//得到总记录数，对应于teacherXK.JSP
	public int getCurseTotal(){
		String sql = "select count(*) from kechengbiao_fenbiao where curentDate >= CURDATE()";
		conn = DBUtil.getConn();
		int total = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return total;
	}
	//得到总记录数，对应于学生选课
		public int getCurseTotal(String stuno){
			String sql = "select count(*) from kechengbiao_fenbiao join stu_order on kechengbiao_fenbiao.id=stu_order.kb_id WHERE stu_order.stu_num=? ";
			conn = DBUtil.getConn();
			int total = 0;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, stuno);
				rs = ps.executeQuery();
				while(rs.next()){
					total = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return total;
		}
		//得到总记录数，对应于教师
		public int getCurseTotalByTea(String teacherName){
			String sql = "select count(*) from kechengbiao_fenbiao  WHERE teacher_name=? ";
			conn = DBUtil.getConn();
			int total = 0;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, teacherName);
				rs = ps.executeQuery();
				while(rs.next()){
					total = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return total;
		}
	//按条件得到总记录数
	public int getCurseTotalByCondition(String labroom,String exp,String startDate,String endDate){
		String sql = "select count(*) from kechengbiao_fenbiao where labroom=?";
		conn = DBUtil.getConn();
		if(exp!=""){
			sql+="and experiment_name=?";
		}
		if(startDate!=""){
			sql+="and curentDate >=?";
		}
		if(endDate!=""){
			sql+="and curentDate<=?";
		}
		int total = 0;
		try {
			ps = conn.prepareStatement(sql);
			int i=1;
			ps=conn.prepareStatement(sql);
			ps.setString(i, labroom);
			if(exp!=""){
				i=i+1;
				ps.setString(i, exp);
			}
			if(startDate!=""){
				i=i+1;
				ps.setString(i, startDate);
			}
			
			if(endDate!=""){
				i=i+1;
				ps.setString(i, endDate);
			}
			rs = ps.executeQuery();
			while(rs.next()){
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return total;
	}
	//按条件得到总记录数对应于学生选课
		public int getCurseTotalByConditionByStu(String stuno,String exp,String startDate,String endDate){
			String sql = "select count(*) from kechengbiao_fenbiao join stu_order on kechengbiao_fenbiao.id=stu_order.kb_id WHERE stu_order.stu_num=?";
			conn = DBUtil.getConn();
			if(exp!=""){
				sql+="and experiment_name=?";
			}
			if(startDate!=""){
				sql+="and curentDate >=?";
			}
			if(endDate!=""){
				sql+="and curentDate<=?";
			}
			int total = 0;
			try {
				ps = conn.prepareStatement(sql);
				int i=1;
				ps=conn.prepareStatement(sql);
				ps.setString(i, stuno);
				if(exp!=""){
					i=i+1;
					ps.setString(i, exp);
				}
				if(startDate!=""){
					i=i+1;
					ps.setString(i, startDate);
				}
				
				if(endDate!=""){
					i=i+1;
					ps.setString(i, endDate);
				}
				rs = ps.executeQuery();
				while(rs.next()){
					total = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return total;
		}
		//按条件得到总记录数对应于教师课表
				public int getCurseTotalByConditionByTea(String teacherName,String exp,String startDate,String endDate){
					String sql = "select count(*) from kechengbiao_fenbiao where teacher_name=?";
					conn = DBUtil.getConn();
					if(exp!=""){
						sql+="and experiment_name=?";
					}
					if(startDate!=""){
						sql+="and curentDate >=?";
					}
					if(endDate!=""){
						sql+="and curentDate<=?";
					}
					int total = 0;
					try {
						ps = conn.prepareStatement(sql);
						int i=1;
						ps=conn.prepareStatement(sql);
						ps.setString(i, teacherName);
						if(exp!=""){
							i=i+1;
							ps.setString(i, exp);
						}
						if(startDate!=""){
							i=i+1;
							ps.setString(i, startDate);
						}
						
						if(endDate!=""){
							i=i+1;
							ps.setString(i, endDate);
						}
						rs = ps.executeQuery();
						while(rs.next()){
							total = rs.getInt(1);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						DBUtil.clearUp(rs, ps, conn);
					}
					return total;
				}
	//插入老师
	public boolean InsertTeacherCu(String teacher,int[] id){
		conn = DBUtil.getConn();
		String sql = "update kechengbiao_fenbiao set teacher_name=? where id=?;";
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<id.length;i++){
				ps.setString(1, teacher);
				System.out.println(teacher);
				ps.setInt(2, id[i]);
				System.out.println(id[i]);
				ps.addBatch();
				System.out.println("zheli??"+i);
			}
			int num[]  =ps.executeBatch();
			for(int j=0;j<num.length;j++){
				if(num[j]<0){
					return false;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return true;
	}
	
	//teacherXK.jsp,查找课程
	public ArrayList<KechengBiao> getSomeCurse(String labroom,String exp,String startDate,String endDate,int page,int rows){
		ArrayList<KechengBiao> alist = new ArrayList<KechengBiao>();
		conn = DBUtil.getConn();
		String sql = "select * from kechengbiao_fenbiao where labroom=?";
		KechengBiao kb = null;
		if(exp!=""){
			sql+="and experiment_name=?";
		}
		if(startDate!=""){
			sql+="and curentDate >=?";
		}
		if(endDate!=""){
			sql+="and curentDate<=?";
		}
		sql +="and curentDate >= CURDATE() order by curentDate,dijijie limit ?,?;";
		
		try {
			int i=1;
			ps=conn.prepareStatement(sql);
			ps.setString(i, labroom);
			if(exp!=""){
				i=i+1;
				ps.setString(i, exp);
			}
			if(startDate!=""){
				i=i+1;
				ps.setString(i, startDate);
			}
			
			if(endDate!=""){
				i=i+1;
				ps.setString(i, endDate);
			}
			i=i+1;
			ps.setInt(i, (page-1)*rows);
			i=i+1;
			ps.setInt(i, rows);
			
			rs = ps.executeQuery();
				while(rs.next()){
					kb = new KechengBiao();
					kb.setId(rs.getInt("id"));
					kb.setDijijie(rs.getInt("dijijie"));
					kb.setXingqiji(rs.getInt("xingqiji"));
					kb.setExperiment_name(rs.getString("experiment_name"));
					kb.setTotalStuNum(rs.getInt("totalStuNum"));
					kb.setCurentStuNum(rs.getInt("curentStuNum"));
					kb.setCurentday(rs.getString("curentDate"));
					if(rs.getString("teacher_name")==null){
						kb.setTeacher_name("暂无老师");
					}else{
						kb.setTeacher_name(rs.getString("teacher_name"));
					}
					alist.add(kb);
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	
	
	
	//对应于stuCourse.jsp按学号进行选课
		public ArrayList<KechengBiao> getSomeCurseByStu(String labroom,String exp,String startDate,String endDate,int page,int rows,String stuno){
			ArrayList<KechengBiao> alist = new ArrayList<KechengBiao>();
			conn = DBUtil.getConn();
			String sql = "select * from kechengbiao_fenbiao join stu_order on kechengbiao_fenbiao.id=stu_order.kb_id  where stu_order.stu_num=?  ";
			KechengBiao kb = null;
			if(exp!=""){
				sql+="and experiment_name=?";
			}
			if(startDate!=""){
				sql+="and curentDate >=?";
			}
			if(endDate!=""){
				sql+="and curentDate<=?";
			}
			sql +="order by curentDate,dijijie limit ?,?;";
			
			try {
				int i=1;
				ps=conn.prepareStatement(sql);
				ps.setString(i, stuno);
				if(exp!=""){
					i=i+1;
					ps.setString(i, exp);
				}
				if(startDate!=""){
					i=i+1;
					ps.setString(i, startDate);
				}
				
				if(endDate!=""){
					i=i+1;
					ps.setString(i, endDate);
				}
				i=i+1;
				ps.setInt(i, (page-1)*rows);
				i=i+1;
				ps.setInt(i, rows);
				rs = ps.executeQuery();
					while(rs.next()){
						kb = new KechengBiao();
						kb.setId(rs.getInt("id"));
						kb.setDijijie(rs.getInt("dijijie"));
						kb.setXingqiji(rs.getInt("xingqiji"));
						kb.setExperiment_name(rs.getString("experiment_name"));
						kb.setCurentday(rs.getString("curentDate"));
						if(rs.getString("teacher_name")==null){
							kb.setTeacher_name("暂无老师");
						}else{
							kb.setTeacher_name(rs.getString("teacher_name"));
						}
						alist.add(kb);
					}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return alist;
		}
		
		//对应于teaCourse.jsp按教师名字进行选课
		public ArrayList<KechengBiao> getSomeCurseByTea(String labroom,String exp,String startDate,String endDate,int page,int rows,String teacherName){
			ArrayList<KechengBiao> alist = new ArrayList<KechengBiao>();
			conn = DBUtil.getConn();
			String sql = "select * from kechengbiao_fenbiao where teacher_name=?  ";
			KechengBiao kb = null;
			if(exp!=""){
				sql+="and experiment_name=?";
			}
			if(startDate!=""){
				sql+="and curentDate >=?";
			}
			if(endDate!=""){
				sql+="and curentDate<=?";
			}
			sql +="order by curentDate,dijijie limit ?,?;";
			
			try {
				int i=1;
				ps=conn.prepareStatement(sql);
				ps.setString(i, teacherName);
				if(exp!=""){
					i=i+1;
					ps.setString(i, exp);
				}
				if(startDate!=""){
					i=i+1;
					ps.setString(i, startDate);
				}
				
				if(endDate!=""){
					i=i+1;
					ps.setString(i, endDate);
				}
				i=i+1;
				ps.setInt(i, (page-1)*rows);
				i=i+1;
				ps.setInt(i, rows);
				rs = ps.executeQuery();
					while(rs.next()){
						kb = new KechengBiao();
						kb.setId(rs.getInt("id"));
						kb.setDijijie(rs.getInt("dijijie"));
						kb.setXingqiji(rs.getInt("xingqiji"));
						kb.setExperiment_name(rs.getString("experiment_name"));
						kb.setCurentday(rs.getString("curentDate"));
						kb.setCurentStuNum(rs.getInt("curentStuNum"));
						alist.add(kb);
					}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return alist;
		}
		//对应于学生签到
		public ArrayList<Student> getAllStuByExpId(int id){
			ArrayList<Student> stulist = new ArrayList<Student>();
			Student stu = null;
			conn = DBUtil.getConn();
			String sql = "SELECT * from stu_order join stu on stu_order.stu_num = stu.stu_num WHERE kb_id=?;";
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				while(rs.next()){
					stu = new Student();
					stu.setStu_num(rs.getString("stu_num"));
					stu.setStu_name(rs.getString("stu_name"));
					stu.setCollege_name(rs.getString("college_name"));
					stu.setMajor_name(rs.getString("major_name"));
					stu.setQD_state(rs.getInt("QD_state"));
					stulist.add(stu);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			
			return stulist;
		}
		
		//学生签到
		public boolean stuQD(String stuId,String time,int KB_id){
			conn = DBUtil.getConn();
			String sql ="UPDATE stu_order set QD_state=? ,QD_time=? where stu_num = ? and kb_id=?;";
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, 1);
				ps.setString(2, time);
				ps.setString(3, stuId);
				ps.setInt(4, KB_id);
				int flag = ps.executeUpdate();
				if(flag!=0){
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return false;
		}
		//教师登录成绩
		public boolean teaDCJ(ArrayList<Student> stuList,int KB_id){
			conn = DBUtil.getConn();
			
			//String sql ="UPDATE stu_order set score1=?,score2=?,score3=?,scoreTotal=? where kb_id=? and stu_num=?;";
			for(int i=0;i<stuList.size();i++){
				String sql ="UPDATE stu_order set score1="+stuList.get(i).getScore1()+",score2="+stuList.get(i).getScore2()+",score3="+stuList.get(i).getScore3()+",scoreTotal="+stuList.get(i).getScoreTotal()+",dcj_state="+1+" where kb_id="+KB_id+" and stu_num='"+stuList.get(i).getStu_num()+"';";
				System.out.println(sql);
				try {
					ps = conn.prepareStatement(sql);
					ps.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}		
			DBUtil.clearUp(rs, ps, conn);	
			return true;
		}
}
