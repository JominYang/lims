package com.lims.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.College;
import com.lims.db.ConnDB;

public class CollegeDao {
	public int count() {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM college";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, null);
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

	public ArrayList<College> get(int page, int rows, String order, String sort) {
		College co = null;
		ArrayList<College> list = new ArrayList<College>();
		String sql = "SELECT * FROM college WHERE 1=1";

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
				co = new College();
				co.setCollege_num(rs.getInt("college_num"));
				co.setCollege_name(rs.getString("college_name"));
				co.setCollege_state(rs.getInt("college_state"));
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

	public boolean add(College co) {
		boolean flag = false;
		String sql = "INSERT INTO college(college_num,college_name,college_state) VALUES (?,?,?)";
		Object[] params = { co.getCollege_num(), co.getCollege_name(),
				co.getCollege_state() };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}

	public boolean del(int id) {
		boolean flag = false;
		String sql = "DELETE FROM college WHERE id IN (?)";
		Object[] params = { id };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}

	public boolean edit(College co) {
		boolean flag = false;
		String sql = "UPDATE college SET college_num=?,college_name=?,college_state=? WHERE ID = ?";
		Object[] params = { co.getCollege_num(), co.getCollege_name(),
				co.getCollege_state(), co.getId() };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}
}
