package com.lims.bean;

public class Major {
	private int id;
	private int major_num;	//专业编号
	private String major_name;	//专业名称
	private String college_name;	//学院名称
	private int major_state;	//专业状态
	

	public final int getId() {
		return id;
	}
	public final void setId(int id) {
		this.id = id;
	}
	public final int getMajor_num() {
		return major_num;
	}
	public final void setMajor_num(int major_num) {
		this.major_num = major_num;
	}
	public final String getMajor_name() {
		return major_name;
	}
	public final void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public final String getCollege_name() {
		return college_name;
	}
	public final void setCollege_name(String college_name) {
		this.college_name = college_name;
	}
	public final int getMajor_state() {
		return major_state;
	}
	public final void setMajor_state(int major_state) {
		this.major_state = major_state;
	}
}
