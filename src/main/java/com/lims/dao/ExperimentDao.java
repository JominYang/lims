package com.lims.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.Expriment;
import com.lims.bean.Teacher;
import com.lims.db.ConnDB;

public class ExperimentDao {
	public boolean add(Expriment e) {
		boolean flag = false;
		String sql = "INSERT INTO experiment(experiment_num,experiment_name,experiment_time,experiment_type,experiment_require,experiment_grounp,experiment_grounp_now,experiment_obj,totalStuNum,experiment_state,labroom_name,exp_course_name) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		
		Object[] params = { e.getExperment_num(), e.getExp_course_name(),
				e.getExperment_time(), e.getExperment_type(),
				e.getExperment_require(), e.getExperment_grounp(),
				e.getExperment_grounp_now(), e.getExperment_obj(),
				e.getTotalStuNum(), e.getExperment_state(),
				e.getLabroom_name(), e.getExp_course_name() };

		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		return flag;
	}
	
	public boolean edit(Expriment e) {
		boolean flag = false;
		String sql = "UPDATE experiment SET experiment_num=?,experiment_name=?,experiment_time=?,experiment_type=?,experiment_require=?,experiment_grounp=?,experiment_grounp_now=?,experiment_obj=?,totalStuNum=?,experiment_state=?,labroom_name=?,exp_course_name=? WHERE id=?";
		String sql2 = "UPDATE kechengbiao_fenbiao SET totalStuNum = "+e.getTotalStuNum()+ "WHERE experiment_name =" + e.getExperment_name();
		Object[] params = { e.getExperment_num(), e.getExp_course_name(),
				e.getExperment_time(), e.getExperment_type(),
				e.getExperment_require(), e.getExperment_grounp(),
				e.getExperment_grounp_now(), e.getExperment_obj(),
				e.getTotalStuNum(), e.getExperment_state(),
				e.getLabroom_name(), e.getExp_course_name(),e.getId() };
		
		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0 && mydb.executeUpdate(sql2, null) != 0 ) {
			flag = true;
		}
		mydb.free();
		return flag;
	}

	public ArrayList<Expriment> get(int page, int rows, String order,
			String sort, Expriment e) {
		ArrayList<Expriment> list = new ArrayList<Expriment>();
		Expriment singer = null;

		String sql = "SELECT * FROM experiment WHERE 1=1";
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
				singer = new Expriment();
				singer.setId(rs.getInt("id"));
				singer.setExp_course_name(rs.getString("exp_course_name"));
				singer.setExperment_grounp(rs.getString("experiment_grounp"));
				singer.setExperment_grounp_now(rs
						.getString("experiment_grounp_now"));
				singer.setExperment_name(rs.getString("experiment_name"));
				singer.setExperment_num(rs.getString("experiment_num"));
				singer.setExperment_obj(rs.getString("experiment_obj"));
				singer.setTotalStuNum(rs.getString("totalStuNum"));
				singer.setExperment_require(rs.getString("experiment_require"));
				singer.setExperment_state(rs.getString("experiment_state"));
				singer.setExperment_time(rs.getString("experiment_time"));
				singer.setExperment_type(rs.getString("experiment_type"));
				singer.setLabroom_name(rs.getString("labroom_name"));

				list.add(singer);
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			mydb.free();
		}
		return list;
	}

	public int count(Expriment e) {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM experiment WHERE 1=1";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, null);
		try {
			while (rs != null && rs.next()) {
				total = rs.getInt("COUNT(*)");
			}
			rs.close();
		} catch (SQLException ee) {
			ee.printStackTrace();
		} finally {
			mydb.free();
		}
		return total;
	}

	public boolean del(String id) {
		boolean flag = false;
		String sql = "DELETE FROM experiment WHERE id IN (?)";
		Object[] params = { id };
		ConnDB mydb = new ConnDB();
		if (mydb.executeUpdate(sql, params) != 0) {
			flag = true;
		}
		mydb.free();
		
		return flag;
	}

	public Expriment get(String id) {
		Expriment singer = null;
		Object[] params = { id };
		String sql = "SELECT * FROM experiment WHERE id=?";
		ConnDB mydb = new ConnDB();
		ResultSet rs = mydb.executeQuery(sql, params);
		try {
			while(rs.next()) {
				singer = new Expriment();
				singer.setId(rs.getInt("id"));
				singer.setExp_course_name(rs.getString("exp_course_name"));
				singer.setExperment_grounp(rs.getString("experiment_grounp"));
				singer.setExperment_grounp_now(rs.getString("experiment_grounp_now"));
				singer.setExperment_name(rs.getString("experiment_name"));
				singer.setExperment_num(rs.getString("experiment_num"));
				singer.setExperment_obj(rs.getString("experiment_obj"));
				singer.setTotalStuNum(rs.getString("totalStuNum"));
				singer.setExperment_require(rs.getString("experiment_require"));
				singer.setExperment_state(rs.getString("experiment_state"));
				singer.setExperment_time(rs.getString("experiment_time"));
				singer.setExperment_type(rs.getString("experiment_type"));
				singer.setLabroom_name(rs.getString("labroom_name"));
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			mydb.free();
		}
		return singer;
	}
}
