package com.lims.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lims.db.DBUtil;
import com.lims.tools.DateUtil;

public class StuXKdao {
	private  ResultSet rs;
	private  Connection conn;
	private  PreparedStatement ps;
	public boolean stuXk(int[] curseid,String stu_name){
		conn = DBUtil.getConn();
		String sql = "INSERT into stu_order (kb_id,stu_num) VALUES (?,?);";
		String sql1 = "update kechengbiao_fenbiao set curentStuNum = curentStuNum+1 where id=?";
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<curseid.length;i++){
				ps.setInt(1, curseid[i]);
				ps.setString(2, stu_name);
				ps.addBatch();
			}
			int num[]  =ps.executeBatch();
			for(int j=0;j<num.length;j++){
				if(num[j]<0){
					return false;
				}
			}
			ps = conn.prepareStatement(sql1);
			for(int i=0;i<curseid.length;i++){
				ps.setInt(1, curseid[i]);
				ps.addBatch();
			}
			int num1[]  =ps.executeBatch();
			for(int j=0;j<num1.length;j++){
				if(num1[j]<0){
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
	
	//查看学生是否已经选择改时间的该实验,选择的同一实验
	public boolean isSelect(int[] curseid,String stu_name){
		conn = DBUtil.getConn();
		boolean bool =true;
		String sql = "select * from stu_order where stu_name=? and kb_id=?";
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<curseid.length;i++){
				ps.setString(1, stu_name);
				ps.setInt(2, curseid[i]);
				rs = ps.executeQuery();
				while(rs.next()){
					System.out.println(rs.getString("stu_name"));
					if(rs.getString("stu_name")!=""&&!rs.getString("stu_name").equals(null)){
						bool =  false;
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return bool;
	}
	
}
