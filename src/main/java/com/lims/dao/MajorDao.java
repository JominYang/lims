package com.lims.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.Major;
import com.lims.db.ConnDB;

public class MajorDao {
	public int count(String college_name) {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM major WHERE college_name=?";
		Object[] params = {college_name };
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

	public ArrayList<Major> get(int page, int rows, String order, String sort,String college_name) {
		Major co = null;
		
		ArrayList<Major> list = new ArrayList<Major>();
		String sql = "SELECT * FROM major WHERE college_name=?";
		Object[] params = {college_name};

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
				co = new Major();
				co.setMajor_num(rs.getInt("major_num"));
				co.setMajor_name(rs.getString("major_name"));
				co.setCollege_name(rs.getString("college_name"));
				co.setMajor_state(rs.getInt("major_state"));
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

	public boolean add(Major co) {
		boolean flag = false;
		String sql = "INSERT INTO major(major_num,major_name,major_state,college_name) VALUES (?,?,?,?)";
		Object[] params = { co.getMajor_num(), co.getMajor_name(),
				co.getMajor_state(),co.getCollege_name()};

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}

	public boolean del(int id) {
		boolean flag = false;
		String sql = "DELETE FROM Major WHERE id IN (?)";
		Object[] params = { id };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}

	public boolean edit(Major co) {
		boolean flag = false;
		String sql = "UPDATE major SET major_num=?,major_name=?,major_state=? WHERE ID = ?";
		Object[] params = { co.getMajor_num(), co.getMajor_name(),
				co.getMajor_state(), co.getId() };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		return flag;
	}
}
