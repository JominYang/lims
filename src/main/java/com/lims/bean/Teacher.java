package com.lims.bean;

public class Teacher {
	private int id;		//ID
	private String teacher_num;	//教工号
	private String teacher_name; //教师姓名
	private String password;	//登录密码
	private String teacher_sex;	//性别	
	private String teacher_degree;	//学历
	private String teacher_titles;	//职称
	private String teacher_institution;	//教研所
	private String college_name;	//学院
	private String major_name;	//专业
	private int teacher_state;	//状态
	/*
	 * 添加字段 7-26 
	 */
	private String teacher_phone;		//联系方式
	private String teacher_email;		//邮件
	private String teacher_introduction;	//简介
	private String Teacher_College;
	private int Teacher_range;
	private String teacher_permisson;
	
	public String getTeacher_permisson() {
		return teacher_permisson;
	}
	public void setTeacher_permisson(String teacher_permisson) {
		this.teacher_permisson = teacher_permisson;
	}
	public int getTeacher_range() {
		return Teacher_range;
	}
	public void setTeacher_range(int teacher_range) {
		Teacher_range = teacher_range;
	}
	public String getTeacher_College() {
		return Teacher_College;
	}
	public void setTeacher_College(String teacher_College) {
		Teacher_College = teacher_College;
	}
	public final String getTeacher_degree() {
		return teacher_degree;
	}
	public final void setTeacher_degree(String teacher_degree) {
		this.teacher_degree = teacher_degree;
	}
	public final void setTeacher_titles(String teacher_titles) {
		this.teacher_titles = teacher_titles;
	}
	public final String getTeacher_titles() {
		return teacher_titles;
	}
	
	
	public String getTeacher_phone() {
		return teacher_phone;
	}
	public void setTeacher_phone(String teacher_phone) {
		this.teacher_phone = teacher_phone;
	}
	public String getTeacher_email() {
		return teacher_email;
	}
	public void setTeacher_email(String teacher_email) {
		this.teacher_email = teacher_email;
	}
	public String getTeacher_introduction() {
		return teacher_introduction;
	}
	public void setTeacher_introduction(String teacher_introduction) {
		this.teacher_introduction = teacher_introduction;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTeacher_num() {
		return teacher_num;
	}
	public void setTeacher_num(String teacherNum) {
		teacher_num = teacherNum;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacherName) {
		teacher_name = teacherName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTeacher_sex() {
		return teacher_sex;
	}
	public void setTeacher_sex(String teacherSex) {
		teacher_sex = teacherSex;
	}
	public String getTeacher_institution() {
		return teacher_institution;
	}
	public void setTeacher_institution(String teacherInstitution) {
		teacher_institution = teacherInstitution;
	}
	public String getCollege_name() {
		return college_name;
	}
	public void setCollege_name(String collegeName) {
		college_name = collegeName;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String majorName) {
		major_name = majorName;
	}
	public int getTeacher_state() {
		return teacher_state;
	}
	public void setTeacher_state(int teacherState) {
		teacher_state = teacherState;
	}
}

