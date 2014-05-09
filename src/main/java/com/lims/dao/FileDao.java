package com.lims.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lims.bean.FileBean;
import com.lims.db.ConnDB;
import com.lims.tools.StringHandler;

public class FileDao {
	private Connection conn = null;
	private String sql = "";
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public int addFileInfo(FileBean file) {
		int i = -1;
		try {
			conn = ConnDB.getConnection();
			sql = "insert into tb_file (file_savename,file_name,file_type,file_size,file_fileinfo,file_uptime,file_lab,file_exp) values ('"
					+ file.getFile_savename()
					+ "','"
					+ file.getFile_filename()
					+ "','"
					+ file.getFile_filetype()
					+ "','"
					+ file.getFile_filesize()
					+ "','"
					+ file.getFile_fileinfo()
					+ "','"
					+ file.getFile_uptime()
					+ "','"
					+ file.getFile_lab() + "','" + file.getFile_exp() + "')";
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			i = 1;
		} catch (SQLException e) {
			i = -1;
			e.printStackTrace();
		} finally {
			ConnDB.free(null, ps, conn);
		}
		return i;
	}
	
	public boolean delFileInfo(String id) {
		boolean flag = false;
		String sql = "DELETE FROM tb_file WHERE id IN (?)";
		Object[] params = { id };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}

	public List getFileList() {
		sql = "select * from tb_file order by file_savename desc";
		List list = null;
		try {
			conn = ConnDB.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs != null) {
				list = new ArrayList();
				while (rs.next()) {
					FileBean sing = new FileBean();
					sing.setId(rs.getInt("id"));
					sing.setFile_savename(rs.getString("file_savename"));
					sing.setFile_filename(rs.getString("file_name"));
					sing.setFile_filetype(rs.getString("file_type"));
					sing.setFile_filesize(rs.getString("file_size"));
					sing.setFile_fileinfo(rs.getString("file_fileinfo"));
					sing.setFile_uptime(StringHandler.timeTostr(rs.getTimestamp("file_uptime")));
					sing.setFile_lab(rs.getString("file_lab"));
					sing.setFile_exp(rs.getString("file_exp"));
					
					list.add(sing);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnDB.free(null, ps, conn);
		}
		return list;
	}
	
	public List getFileList(int page, int rows, String order, String sort) {
		sql = "select * from tb_file";
		if (sort != null && order != null) {
			sql += " ORDER BY " + sort + " " + order;
		}
		if (page != 0 && rows != 0) {
			sql += " LIMIT " + (page - 1) * rows + "," + rows;
		}
		
		List list = null;
		try {
			conn = ConnDB.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs != null) {
				list = new ArrayList();
				while (rs.next()) {
					FileBean sing = new FileBean();
					sing.setId(rs.getInt("id"));
					sing.setFile_savename(rs.getString("file_savename"));
					sing.setFile_filename(rs.getString("file_name"));
					sing.setFile_filetype(rs.getString("file_type"));
					sing.setFile_filesize(rs.getString("file_size"));
					sing.setFile_fileinfo(rs.getString("file_fileinfo"));
					sing.setFile_uptime(StringHandler.timeTostr(rs.getTimestamp("file_uptime")));
					sing.setFile_lab(rs.getString("file_lab"));
					sing.setFile_exp(rs.getString("file_exp"));
					
					list.add(sing);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnDB.free(null, ps, conn);
		}
		return list;
	}

	public int count() {
		int total = 0;
		sql = "SELECT COUNT(*) FROM tb_file WHERE 1=1";
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
	
	public FileBean getFileSingle(String savename) {
		FileBean sing = null;
		String sql = "select * from tb_file where file_savename='" + savename
				+ "'";
		List list = null;
		try {
			conn = ConnDB.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs != null) {
				list = new ArrayList();
				while (rs.next()) {
					sing = new FileBean();
					sing.setId(rs.getInt("id"));
					sing.setFile_savename(rs.getString("file_savename"));
					sing.setFile_filename(rs.getString("file_name"));
					sing.setFile_filetype(rs.getString("file_type"));
					sing.setFile_filesize(rs.getString("file_size"));
					sing.setFile_fileinfo(rs.getString("file_fileinfo"));
					sing.setFile_uptime(StringHandler.timeTostr(rs.getTimestamp("file_uptime")));
					sing.setFile_lab(rs.getString("file_lab"));
					sing.setFile_exp(rs.getString("file_exp"));
					list.add(sing);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnDB.free(null, ps, conn);
		}
		if(list!=null&&list.size()!=0)
			sing=(FileBean)list.get(0);
		return sing;
	}
}

