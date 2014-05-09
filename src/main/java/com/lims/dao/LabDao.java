package com.lims.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.Expriment;
import com.lims.bean.Labroom;
import com.lims.db.DBUtil;

public class LabDao {
	private static ResultSet rs;
	private static Connection conn;
	private static PreparedStatement ps;
	
	//查询所有实验室的名称
	public ArrayList<Labroom> select(){
		conn = DBUtil.getConn();
		ArrayList<Labroom> alist = new ArrayList<Labroom>();
		String sql = "select labroom_name FROM labroom;";
		Labroom labroom =null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				labroom = new Labroom();
				labroom.setLabroom_name(rs.getString("labroom_name"));
				alist.add(labroom);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	//根据实验室名称查询相应实验
	public ArrayList<Expriment> selectExpByLabname(String labname){
		ArrayList<Expriment> alist = new ArrayList<Expriment>();
		conn = DBUtil.getConn();
		String sql = "select experiment_name from exp_ralationship WHERE labroom_name=?;";
		Expriment expriment =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, labname);
			rs = ps.executeQuery();
			while(rs.next()){
				expriment = new Expriment();
				expriment.setExperimentS_name(rs.getString("experiment_name"));
				alist.add(expriment);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	//查询某位学生选择的实验
	public ArrayList<Expriment> selectExpBystu(String stuno){
		ArrayList<Expriment> alist = new ArrayList<Expriment>();
		conn = DBUtil.getConn();
		String sql = "select experiment_name from kechengbiao_fenbiao join stu_order on kechengbiao_fenbiao.id=stu_order.kb_id WHERE stu_order.stu_num=?;";
		Expriment expriment =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, stuno);
			rs = ps.executeQuery();
			while(rs.next()){
				expriment = new Expriment();
				expriment.setExperimentS_name(rs.getString("experiment_name"));
				alist.add(expriment);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	//查询某位老师选择的实验
		public ArrayList<Expriment> selectExpByTea(String teacherName){
			ArrayList<Expriment> alist = new ArrayList<Expriment>();
			conn = DBUtil.getConn();
			String sql = "select experiment_name from kechengbiao_fenbiao  WHERE teacher_name=?;";
			Expriment expriment =null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, teacherName);
				rs = ps.executeQuery();
				while(rs.next()){
					expriment = new Expriment();
					expriment.setExperimentS_name(rs.getString("experiment_name"));
					alist.add(expriment);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.clearUp(rs, ps, conn);
			}
			return alist;
		}
		//查询某位老师选择的实验
				public ArrayList<Expriment> selectExpByTeaQD(String teacherName){
					ArrayList<Expriment> alist = new ArrayList<Expriment>();
					conn = DBUtil.getConn();
					String sql = "select experiment_name,id from kechengbiao_fenbiao  WHERE teacher_name=? and curentDate = CURDATE();";
					Expriment expriment =null;
					try {
						ps = conn.prepareStatement(sql);
						ps.setString(1, teacherName);
						rs = ps.executeQuery();
						while(rs.next()){
							expriment = new Expriment();
							expriment.setExperimentS_name(rs.getString("experiment_name"));
							expriment.setId(rs.getInt("id"));
							alist.add(expriment);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally{
						DBUtil.clearUp(rs, ps, conn);
					}
					return alist;
				}
}
