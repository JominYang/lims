package com.lims.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lims.bean.Expriment;
import com.lims.bean.Labroom;
import com.lims.bean.News;
import com.lims.db.DBUtil;

public class NewsDao {
	private static ResultSet rs;
	private static Connection conn;
	private static PreparedStatement ps;
	
	//添加新闻数据库
	public boolean addNews(News news){
		conn = DBUtil.getConn();
		String sql = "insert into news(news_cat,news_state,news_title,news_date,new_cont,teacher_name) VALUES (?,?,?,?,?,?);";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, news.getNews_cat());
			ps.setInt(2, 1);
			ps.setString(3, news.getNews_title());
			ps.setString(4, news.getNews_date());
			ps.setString(5, news.getNew_cont());
			ps.setString(6, news.getTeacher_name());
			int flag = ps.executeUpdate();
			if(flag!=0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return false;
	}
	
	//查询所有实验室的名称
	public ArrayList<News> getNews(){
		conn = DBUtil.getConn();
		ArrayList<News> alist = new ArrayList<News>();
		String sql = "select *  FROM news where news_cat=1 and news_state=1 order by news_date desc limit 7;";
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				news = new News();
				news.setId(rs.getInt("id"));
				String date = rs.getString("news_date").substring(0, 11);
				news.setNews_date(date);
				String title = rs.getString("news_title");
				int len = title.length();
				System.out.println(len);
				if(len>40){
					title = title.substring(0, 30);
					title = title+"...";
				}
				if(len<22){
					title=title+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				news.setNews_title(title);
				alist.add(news);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	
	public ArrayList<News> getNews(int cat,int page){
		conn = DBUtil.getConn();
		ArrayList<News> alist = new ArrayList<News>();
		String sql = "select *  FROM news where news_cat=? and news_state=1 order by news_date desc limit ?,14;";
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cat);
			ps.setInt(2, (page-1)*14);
			rs = ps.executeQuery();
			while(rs.next()){
				news = new News();
				news.setId(rs.getInt("id"));
				String date = rs.getString("news_date").substring(0, 19);
				news.setNews_date(date);
				String title = rs.getString("news_title");
				int len = title.length();
				System.out.println(len);
				if(len>60){
					title = title.substring(0, 60);
					title = title+"...";
				}
				news.setNews_title(title);
				alist.add(news);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	public ArrayList<News> getNote(){
		conn = DBUtil.getConn();
		ArrayList<News> alist = new ArrayList<News>();
		String sql = "select *  FROM news where news_cat=2 and news_state=1 order by news_date desc limit 7;";
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				news = new News();
				news.setId(rs.getInt("id"));
				String date = rs.getString("news_date").substring(0, 11);
				news.setNews_date(date);
				String title = rs.getString("news_title");
				int len = title.length();
				System.out.println(len);
				if(len>40){
					title = title.substring(0, 30);
					title = title+"...";
				}
				if(len<22){
					title=title+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				news.setNews_title(title);
				alist.add(news);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
	public ArrayList<News> getZiliao(){
		conn = DBUtil.getConn();
		ArrayList<News> alist = new ArrayList<News>();
		String sql = "select *  FROM news where news_cat=3 and news_state=1 order by news_date desc limit 7;";
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				news = new News();
				news.setId(rs.getInt("id"));
				news.setNews_date(rs.getString("news_date"));
				news.setNews_title(rs.getString("news_title"));
				alist.add(news);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return alist;
	}
    //得到新闻的总数
	public int getNewsCount(int cat){
		conn = DBUtil.getConn();
		int numbers = 0;
		String sql = "select count(*)  FROM news where news_cat=? ;";
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cat);
			rs = ps.executeQuery();
			while(rs.next()){
				numbers = rs.getInt(1);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return numbers;
	}
	public News getNewsById(int newsid){
		conn = DBUtil.getConn();
		String sql = "select *  FROM news where id=?";
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, newsid);
			rs = ps.executeQuery();
			while(rs.next()){
				news = new News();
				news.setId(rs.getInt("id"));
				String date = rs.getString("news_date").substring(0, 19);
				news.setNews_date(date);
				String title = rs.getString("news_title");
				news.setNews_title(title);
				String teachername = rs.getString("teacher_name");
				news.setTeacher_name(teachername);
				String newspath = rs.getString("new_cont");
				news.setNew_cont(newspath);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return news;
	}
	public News getNextNews(int newsid){
		conn = DBUtil.getConn();
		String sql = "select id,news_title  FROM news where id>? and news_cat=(select news_cat from news where id=?) LIMIT 1;";
		
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, newsid);
			ps.setInt(2, newsid);
			rs = ps.executeQuery();
			while(rs.next()){
				news = new News();
				news.setId(rs.getInt("id"));
				String title = rs.getString("news_title");
				news.setNews_title(title);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return news;
	}
	public News getlastNews(int newsid){
		conn = DBUtil.getConn();
		String sql = "select id,news_title from news where id<? and news_cat=(select news_cat from news where id=?) order by id desc LIMIT 1;";
		News news =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, newsid);
			ps.setInt(2, newsid);
			rs = ps.executeQuery();
			while(rs.next()){
				news = new News();
				news.setId(rs.getInt("id"));
				String title = rs.getString("news_title");
				news.setNews_title(title);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.clearUp(rs, ps, conn);
		}
		return news;
	}
	
}
