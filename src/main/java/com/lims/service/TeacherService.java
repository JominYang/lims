package com.lims.service;

import java.util.ArrayList;

import com.lims.bean.Teacher;
import com.lims.dao.TeacherDao;

public class TeacherService {
	TeacherDao dao = null;

	public TeacherService() {
		dao = new TeacherDao();
	}

	public Teacher login(String teacher_num, String password) {
		return dao.get(teacher_num, password);
	}

	public Teacher get(String teacher_num) {
		return dao.get(teacher_num);
	}

	public int count(Teacher t) {
		return dao.count(t);
	}

	public ArrayList<Teacher> get(int page, int rows, String order,
			String sort, Teacher t) {
		return dao.get(page, rows, order, sort, t);
	}

	public boolean add(Teacher t) {
		return dao.add(t);
	}

	public void del(String ids) {
		if (ids != null && !"".equals(ids)) {
			for(String id: ids.split(",")) {
				int i = Integer.parseInt(id);
				dao.del(i);
			}
		}
	}
	public boolean edit(Teacher t) {
		return dao.edit(t);
	}
	public boolean editMyProfile(Teacher t) {
		return dao.editMyProfile(t);
	}
	public boolean changePwd(String usernum,String pwd) {
		return dao.changePwd(usernum,pwd);
	}
}
