package com.lims.bean;

public class Student {
	private int id;
	private String stu_num;
	private String stu_name;
	private String password;
	private String stu_sex;
	private int class_id;
	private String major_name;
	private String college_name;
	private int stu_state;
	//签到状态，8.30添加
	private int QD_state;
	//关于成绩添加的属性
	private int score1;
	private int score2;
	private int score3;
	private int scoreTotal;
	
	public int getScoreTotal() {
		return scoreTotal;
	}
	public void setScoreTotal(int scoreTotal) {
		this.scoreTotal = scoreTotal;
	}
	public int getScore1() {
		return score1;
	}
	public void setScore1(int score1) {
		this.score1 = score1;
	}
	public int getScore2() {
		return score2;
	}
	public void setScore2(int score2) {
		this.score2 = score2;
	}
	public int getScore3() {
		return score3;
	}
	public void setScore3(int score3) {
		this.score3 = score3;
	}
	public int getQD_state() {
		return QD_state;
	}
	public void setQD_state(int qD_state) {
		QD_state = qD_state;
	}
	public final int getId() {
		return id;
	}
	public final void setId(int id) {
		this.id = id;
	}
	public final String getStu_num() {
		return stu_num;
	}
	public final void setStu_num(String stu_num) {
		this.stu_num = stu_num;
	}
	public final String getStu_name() {
		return stu_name;
	}
	public final void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public final String getPassword() {
		return password;
	}
	public final void setPassword(String password) {
		this.password = password;
	}
	public final String getStu_sex() {
		return stu_sex;
	}
	public final void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	public final int getClass_id() {
		return class_id;
	}
	public final void setClass_id(int classes) {
		this.class_id = classes;
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
	public final int getStu_state() {
		return stu_state;
	}
	public final void setStu_state(int stu_state) {
		this.stu_state = stu_state;
	}
}
