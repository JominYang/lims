package com.lims.bean;

public class Expriment {
	private int id;
	private String experimentS_name;
	//2012-8-30
	private String experment_num;	//实验编号
	private String experment_name;	//实验项目名称
	private String experment_time;	//实验学时
	private String experment_type;	//实验类型
	private String experment_require;	//实验要求
	private String experment_grounp;	//需要组数		
	private String experment_grounp_now;	//现有组数
	private String experment_obj;	//开设对象
	private String experment_remark;	//备注
	private String experment_state;	//实验状态
	
	private String labroom_name;			//实验室
	private String exp_course_name;	//课程名称
	private String totalStuNum;
	
	
	
	public String getExperment_num() {
		return experment_num;
	}
	public void setExperment_num(String experment_num) {
		this.experment_num = experment_num;
	}
	public String getExperment_name() {
		return experment_name;
	}
	public void setExperment_name(String experment_name) {
		this.experment_name = experment_name;
	}
	public String getExperment_time() {
		return experment_time;
	}
	public void setExperment_time(String experment_time) {
		this.experment_time = experment_time;
	}
	public String getExperment_type() {
		return experment_type;
	}
	public void setExperment_type(String experment_type) {
		this.experment_type = experment_type;
	}
	public String getExperment_require() {
		return experment_require;
	}
	public void setExperment_require(String experment_require) {
		this.experment_require = experment_require;
	}
	public String getExperment_grounp() {
		return experment_grounp;
	}
	public void setExperment_grounp(String experment_grounp) {
		this.experment_grounp = experment_grounp;
	}
	public String getExperment_grounp_now() {
		return experment_grounp_now;
	}
	public void setExperment_grounp_now(String experment_grounp_now) {
		this.experment_grounp_now = experment_grounp_now;
	}
	public String getExperment_obj() {
		return experment_obj;
	}
	public void setExperment_obj(String experment_obj) {
		this.experment_obj = experment_obj;
	}
	public String getExperment_remark() {
		return experment_remark;
	}
	public void setExperment_remark(String experment_remark) {
		this.experment_remark = experment_remark;
	}
	public String getExperment_state() {
		return experment_state;
	}
	public void setExperment_state(String experment_state) {
		this.experment_state = experment_state;
	}
	public String getLabroom_name() {
		return labroom_name;
	}
	public void setLabroom_name(String labroom_name) {
		this.labroom_name = labroom_name;
	}
	public String getExp_course_name() {
		return exp_course_name;
	}
	public void setExp_course_name(String exp_course_name) {
		this.exp_course_name = exp_course_name;
	}
	public String getTotalStuNum() {
		return totalStuNum;
	}
	public void setTotalStuNum(String totalStuNum) {
		this.totalStuNum = totalStuNum;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getExperimentS_name() {
		return experimentS_name;
	}
	public void setExperimentS_name(String experimentS_name) {
		this.experimentS_name = experimentS_name;
	}
}
