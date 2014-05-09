package com.lims.dao;

import java.sql.SQLException;

import com.lims.db.ConnDB;

public class AutoLoginDao {
	public boolean add(String sessionId, String userNo) {
		boolean flag = false;
		String sql = "INSERT INTO autologin(sessionid,userno) VALUES(?,?)";
		Object[] params = { sessionId, userNo };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}

	public boolean del(String sessionId) {
		boolean flag = false;
		String sql = "DELETE FROM autologin WHERE sessionid=?";
		Object[] params = { sessionId };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}

	public boolean get(String sessionId, String userNo) {
		boolean flag = false;
		String sql = "SELECT * FROM autologin WHERE sessionid=? and userno=?";
		Object[] params = { sessionId, userNo };

		ConnDB mydb = new ConnDB();
		try {
			if (mydb.executeQuery(sql, params).next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return flag;
	}
}
