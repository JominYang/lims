package com.lims.bean;

public class News {
	private int id;
	private String news_no;
	private int news_cat;
	private int news_state;
	private String news_title;
	private String news_date;
	private String new_cont;
	private String teacher_name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNews_no() {
		return news_no;
	}
	public void setNews_no(String news_no) {
		this.news_no = news_no;
	}
	public int getNews_cat() {
		return news_cat;
	}
	public void setNews_cat(int news_cat) {
		this.news_cat = news_cat;
	}
	public int getNews_state() {
		return news_state;
	}
	public void setNews_state(int news_state) {
		this.news_state = news_state;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_date() {
		return news_date;
	}
	public void setNews_date(String news_date) {
		this.news_date = news_date;
	}
	public String getNew_cont() {
		return new_cont;
	}
	public void setNew_cont(String new_cont) {
		this.new_cont = new_cont;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	
}
