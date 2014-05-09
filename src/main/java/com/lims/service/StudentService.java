package com.lims.service;

import java.util.ArrayList;

import com.lims.bean.Student;
import com.lims.dao.StudentDao;

public class StudentService {
	StudentDao dao = null;

	public StudentService() {
		dao = new StudentDao();
	}

	public int count(int class_id) {
		return dao.count(class_id);
	}

	public ArrayList<Student> get(int page, int rows, String order, String sort,int class_id) {
		return dao.get(page, rows, order, sort,class_id);
	}

	public boolean add(Student st) {
		return dao.add(st);
	}

	public void del(String ids) {
		if (ids != null) {
			for (String id : ids.split(",")) {
				int i = Integer.parseInt(id);
				dao.del(i);
			}
		}
	}
	public boolean edit(Student st) {
		return dao.edit(st);
	}
	
	public Student login(String stu_num , String password) {
		return dao.get(stu_num, password);
	}

	public boolean changePwd(String usernum, String cpwd) {
		return dao.changePwd(usernum,cpwd);
	}
}
