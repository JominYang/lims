package com.lims.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.Classes;
import com.lims.db.ConnDB;

public class ClassesDao {
	public int count(int major_id) {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM class WHERE major_id=?";
		Object[] params = {major_id };
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

	public ArrayList<Classes> get(int page, int rows, String order, String sort,int major_num) {
		Classes co = null;
		
		ArrayList<Classes> list = new ArrayList<Classes>();
		String sql = "SELECT * FROM class WHERE major_id=?";
		Object[] params = {major_num};

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
				co = new Classes();
				co.setClass_num(rs.getString("class_num"));
				co.setClass_grade(rs.getInt("class_grade"));
				co.setClass_state(rs.getInt("class_state"));
				co.setMajor_id(rs.getInt("major_id"));
				co.setId(rs.getInt("id"));
				list.add(co);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return list;
	}

	public boolean add(Classes co) {
		boolean flag = false;
		String sql = "INSERT INTO class(class_num,class_grade,class_state,major_id) VALUES (?,?,?,?)";
		Object[] params = {co.getClass_num(),co.getClass_grade(),co.getClass_state(),co.getMajor_id()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}

	public boolean del(int id) {
		boolean flag = false;
		String sql = "DELETE FROM class WHERE id IN (?)";
		Object[] params = { id };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}

	public boolean edit(Classes co) {
		boolean flag = false;
		String sql = "UPDATE class SET class_num=?,class_grade=?,class_state=? WHERE ID = ?";
		Object[] params = {co.getClass_num(),co.getClass_grade(),co.getClass_state(),co.getId()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}
}
