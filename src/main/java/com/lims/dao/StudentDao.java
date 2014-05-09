package com.lims.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.Major;
import com.lims.bean.Student;
import com.lims.db.ConnDB;


public class StudentDao {
	public Student get(String stu_num, String password) {
		Student singer = null;
		Object[] params = { stu_num, password };
		String sql = "SELECT * FROM stu WHERE stu_num=? AND password=?";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, params);
		try {
			while(rs.next()) {
				singer = new Student();
				singer.setId(rs.getInt("id"));
				singer.setStu_num(rs.getString("stu_num"));
				singer.setStu_name(rs.getString("stu_name"));
				singer.setStu_sex(rs.getString("stu_sex"));
				singer.setPassword(rs.getString("password"));
				singer.setClass_id(rs.getInt("class_id"));
				singer.setCollege_name(rs.getString("college_name"));
				singer.setMajor_name(rs.getString("major_name"));
				singer.setStu_state(rs.getInt("stu_state"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return singer;
	}
	public Student get(String stu_num) {
		Student singer = null;
		Object[] params = { stu_num };
		String sql = "SELECT * FROM student WHERE stu_num=?";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, params);
		try {
			while(rs.next()) {
				singer = new Student();
				singer.setId(rs.getInt("id"));
				singer.setStu_num(rs.getString("stu_num"));
				singer.setStu_name(rs.getString("stu_name"));
				singer.setStu_sex(rs.getString("stu_sex"));
				singer.setPassword(rs.getString("password"));
				singer.setClass_id(rs.getInt("class_id"));
				singer.setCollege_name(rs.getString("college_name"));
				singer.setMajor_name(rs.getString("major_name"));
				singer.setStu_state(rs.getInt("stu_state"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return singer;
	}
	public int count(int class_id) {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM stu WHERE class_id=?";
		Object[] params = {class_id };
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, params);
		try {
			while (rs != null && rs.next()) {
				total = rs.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return total;
	}

	public ArrayList<Student> get(int page, int rows, String order, String sort,int class_id) {
		Student singer = null;
		
		ArrayList<Student> list = new ArrayList<Student>();
		String sql = "SELECT * FROM stu WHERE class_id=?";
		Object[] params = {class_id};

		if (sort != null && order != null) {
			sql += " ORDER BY " + sort + " " + order;
		}
		if (page != 0 && rows != 0) {
			sql += " LIMIT " + (page - 1) * rows + "," + rows;
		}

		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, params);
		try {
			while (rs.next()) {
				singer = new Student();
				singer.setId(rs.getInt("id"));
				singer.setStu_num(rs.getString("stu_num"));
				singer.setStu_name(rs.getString("stu_name"));
				singer.setStu_sex(rs.getString("stu_sex"));
				singer.setPassword(rs.getString("password"));
				singer.setClass_id(rs.getInt("class_id"));
				singer.setCollege_name(rs.getString("college_name"));
				singer.setMajor_name(rs.getString("major_name"));
				singer.setStu_state(rs.getInt("stu_state"));
				list.add(singer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return list;
	}

	public boolean add(Student st) {
		boolean flag = false;
		String sql = "INSERT INTO stu(stu_num,stu_name,password,stu_sex,class_id,major_name,college_name,stu_state) VALUES (?,?,?,?,?,?,?,?)";
		Object[] params = {st.getStu_num(),st.getStu_name(),st.getPassword(),st.getStu_sex(),st.getClass_id(),st.getMajor_name(),st.getCollege_name(),st.getStu_state()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}
 
	public boolean del(int id) {
		boolean flag = false;
		String sql = "DELETE FROM stu WHERE id IN (?)";
		Object[] params = { id };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}

	public boolean edit(Student st) {
		boolean flag = false;
		String sql = "UPDATE stu SET stu_num=?,stu_name=?,password=?,stu_sex=?,class_id=?,major_name=?,college_name=?,stu_state=? WHERE ID = ?";
		Object[] params = {st.getStu_num(),st.getStu_name(),st.getPassword(),st.getStu_sex(),st.getClass_id(),st.getMajor_name(),st.getCollege_name(),st.getStu_state(),st.getId()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}
	public boolean changePwd(String usernum, String cpwd) {
		boolean flag = false;
		String sql = "UPDATE stu SET stu_num=?, password=? WHERE stu_num = ?";
		Object[] params = {usernum, cpwd, usernum};
		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		
		return false;
	}
}
