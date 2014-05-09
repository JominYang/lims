package com.lims.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.Labroom;
import com.lims.bean.Teacher;
import com.lims.db.ConnDB;
import com.lims.db.DBUtil;

public class TeacherDao {
	private static ResultSet rs;
	private static PreparedStatement ps;
	private static Connection conn;
	
	public Teacher isLogin(String num,String password){
		
		conn = DBUtil.getConn();
		String sql = "select teacher_num,teacher_name,teacher_rage,college_name from teacher where teacher_num=? and password=?";
		Teacher teacher = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while(rs.next()){
				teacher = new Teacher();
				teacher.setTeacher_num(rs.getString("teacher_num"));
				teacher.setTeacher_name(rs.getString("teacher_name"));
				teacher.setTeacher_range(rs.getInt("teacher_rage"));
				teacher.setTeacher_College(rs.getString("college_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		
		return teacher;
	}
	
	public ArrayList<Teacher> getAllTeahcerByCollege(String college){
		conn = DBUtil.getConn();
		ArrayList<Teacher> alist = new ArrayList<Teacher>();
		String sql = "select teacher_name FROM teacher where college_name=?;";
		Teacher teacher =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, college);
			rs = ps.executeQuery();
			while(rs.next()){
				teacher = new Teacher();
				teacher.setTeacher_name(rs.getString("teacher_name"));
				alist.add(teacher);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	
	
	public Teacher get(String teacher_num, String password) {
		Teacher singer = null;
		Object[] params = { teacher_num, password };
		//String sql = "SELECT id as Id,teacher_num as Teacher_num,teacher_name as Teacher_name,password as Password,teacher_sex as Teacher_sex,teacher_edu as Teacher_edu,teacher_title as Teacher_title,teacher_institution as Teacher_institution,college_name as College_name,major_name as Major_name,teacher_state as Teacher_state FROM teacher WHERE teacher_num=? AND password=?";
		String sql = "SELECT * FROM teacher WHERE teacher_num=? AND password=?";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, params);
		try {
			while(rs.next()) {
				singer = new Teacher();
				singer.setId(rs.getInt("id"));
				singer.setTeacher_num(rs.getString("teacher_num"));
				singer.setTeacher_name(rs.getString("teacher_name"));
				singer.setPassword(rs.getString("password"));
				singer.setTeacher_permisson(rs.getString("teacher_permisson"));
				singer.setTeacher_range(rs.getInt("teacher_rage"));
				singer.setTeacher_College(rs.getString("college_name"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return singer;
	}
	public Teacher get(String teacher_num) {
		Teacher singer = null;
		Object[] params = { teacher_num };
		String sql = "SELECT * FROM teacher WHERE teacher_num=?";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, params);
		try {
			while(rs.next()) {
				singer = new Teacher();
				singer.setId(rs.getInt("id"));
				singer.setTeacher_num(rs.getString("teacher_num"));
				singer.setTeacher_name(rs.getString("teacher_name"));
				singer.setPassword(rs.getString("password"));
				singer.setTeacher_sex(rs.getString("teacher_sex"));
				singer.setTeacher_degree(rs.getString("teacher_degree"));
				singer.setTeacher_titles(rs.getString("teacher_titles"));
				singer.setTeacher_institution(rs.getString("teacher_institution"));
				singer.setCollege_name(rs.getString("college_name"));
				singer.setMajor_name(rs.getString("major_name"));
				singer.setTeacher_state(rs.getInt("teacher_state"));
				singer.setTeacher_phone(rs.getString("teacher_phone"));
				singer.setTeacher_email(rs.getString("teacher_email"));
				singer.setTeacher_introduction(rs.getString("teacher_introduction"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return singer;
	}
	
	
	public int count(Teacher t) {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM teacher WHERE 1=1";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, null);
		try {
			while (rs != null && rs.next()) {
				total = rs.getInt("COUNT(*)");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return total;
	}

	public ArrayList<Teacher> get(int page, int rows, String order, String sort,Teacher t) {
		Teacher singer = null;
		
		ArrayList<Teacher> list = new ArrayList<Teacher>();
		String sql = "SELECT * FROM teacher WHERE 1=1";

		if (sort != null && order != null) {
			sql += " ORDER BY " + sort + " " + order;
		}
		if (page != 0 && rows != 0) {
			sql += " LIMIT " + (page - 1) * rows + "," + rows;
		}

		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, null);
		try {
			while (rs.next()) {
				singer = new Teacher();
				singer.setId(rs.getInt("id"));
				singer.setTeacher_num(rs.getString("teacher_num"));
				singer.setTeacher_name(rs.getString("teacher_name"));
				singer.setPassword(rs.getString("password"));
				singer.setTeacher_sex(rs.getString("teacher_sex"));
				singer.setTeacher_degree(rs.getString("teacher_degree"));
				singer.setTeacher_titles(rs.getString("teacher_titles"));
				singer.setTeacher_institution(rs.getString("teacher_institution"));
				singer.setCollege_name(rs.getString("college_name"));
				singer.setMajor_name(rs.getString("major_name"));
				singer.setTeacher_state(rs.getInt("teacher_state"));
				singer.setTeacher_phone(rs.getString("teacher_phone"));
				singer.setTeacher_email(rs.getString("teacher_email"));
				singer.setTeacher_introduction(rs.getString("teacher_introduction"));
				
				
				list.add(singer);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return list;
	}

	public boolean add(Teacher t) {
		boolean flag = false;
		String sql = "INSERT INTO teacher(teacher_num,teacher_name,password,teacher_sex,teacher_degree,teacher_titles,teacher_institution,college_name,major_name,teacher_state,teacher_phone,teacher_email,teacher_introduction) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {t.getTeacher_num(),t.getTeacher_name(),t.getPassword(),t.getTeacher_sex(),t.getTeacher_degree(),t.getTeacher_titles(),t.getTeacher_institution(),t.getCollege_name(),t.getMajor_name(),t.getTeacher_state(),t.getTeacher_phone(),t.getTeacher_email(),t.getTeacher_introduction()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		} 
		mydb.free();
		return flag;
	}
 
	public boolean del(int id) {
		boolean flag = false;
		String sql = "DELETE FROM teacher WHERE id IN (?)";
		Object[] params = { id };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}

	public boolean edit(Teacher t) {
		boolean flag = false;
		String sql = "UPDATE teacher SET teacher_num=?,teacher_name=?,password=?,teacher_sex=?,teacher_degree=?,teacher_titles=?,teacher_institution=?,college_name=?,major_name=?,teacher_state=?,teacher_phone=?,teacher_email=?,teacher_introduction=? WHERE teacher_num = ?";
		Object[] params = {t.getTeacher_num(),t.getTeacher_name(),t.getPassword(),t.getTeacher_sex(),t.getTeacher_degree(),t.getTeacher_titles(),t.getTeacher_institution(),t.getCollege_name(),t.getMajor_name(),t.getTeacher_state(),t.getTeacher_phone(),t.getTeacher_email(),t.getTeacher_introduction(),t.getTeacher_num()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}
	public boolean editMyProfile(Teacher t) {
		boolean flag = false;
		String sql = "UPDATE teacher SET teacher_num=?,teacher_name=?,teacher_sex=?,teacher_degree=?,teacher_titles=?,teacher_institution=?,college_name=?,major_name=?,teacher_state=?,teacher_phone=?,teacher_email=?,teacher_introduction=? WHERE teacher_num = ?";
		Object[] params = {t.getTeacher_num(),t.getTeacher_name(),t.getTeacher_sex(),t.getTeacher_degree(),t.getTeacher_titles(),t.getTeacher_institution(),t.getCollege_name(),t.getMajor_name(),t.getTeacher_state(),t.getTeacher_phone(),t.getTeacher_email(),t.getTeacher_introduction(),t.getTeacher_num()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}

	//change user,s password
	public boolean changePwd(String usernum, String pwd) {
		boolean flag = false;
		String sql = "UPDATE teacher SET teacher_num=?, password=? WHERE teacher_num = ?";
		Object[] params = {usernum, pwd, usernum};
		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}
	
}
