package com.lims.bean;

public class KechengBiao {
	private int id;
	private String starDate;//开始日期
	private String endDate;//结束日期
	private int xingqiji;//星期数
	private String experiment_name;//实验名称
	private String teacher_name;//教师名称
	private int dijijie;//第几节
	private String kechengbiao_name;//课程表的名字
	private int weekpage;//第几周
	private String labroomName;//实验室的名称
	private String createDate;//课程表创建的时间
	private String curentday;//当天时间
	//****
	//	8.26添加
	//********//
	private int totalStuNum;//总共可以选课的学生
	public int getTotalStuNum() {
		return totalStuNum;
	}
	public void setTotalStuNum(int totalStuNum) {
		this.totalStuNum = totalStuNum;
	}
	public int getCurentStuNum() {
		return curentStuNum;
	}
	public void setCurentStuNum(int curentStuNum) {
		this.curentStuNum = curentStuNum;
	}
	private int curentStuNum;//当前已经选课的学生
	public String getCreateDate() {
		return createDate;
	}
	public String getCurentday() {
		return curentday;
	}
	public void setCurentday(String curentday) {
		this.curentday = curentday;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getLabroomName() {
		return labroomName;
	}
	public void setLabroomName(String labroomName) {
		this.labroomName = labroomName;
	}
	public int getWeekpage() {
		return weekpage;
	}
	public void setWeekpage(int weekpage) {
		this.weekpage = weekpage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStarDate() {
		return starDate;
	}
	public void setStarDate(String starDate) {
		this.starDate = starDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getXingqiji() {
		return xingqiji;
	}
	public void setXingqiji(int xingqiji) {
		this.xingqiji = xingqiji;
	}
	public String getExperiment_name() {
		return experiment_name;
	}
	public void setExperiment_name(String experiment_name) {
		this.experiment_name = experiment_name;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public int getDijijie() {
		return dijijie;
	}
	public void setDijijie(int dijijie) {
		this.dijijie = dijijie;
	}
	public String getKechengbiao_name() {
		return kechengbiao_name;
	}
	public void setKechengbiao_name(String kechengbiao_name) {
		this.kechengbiao_name = kechengbiao_name;
	}
	
	
}
