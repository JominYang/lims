package com.lims.service;

import java.util.ArrayList;

import com.lims.bean.College;
import com.lims.dao.CollegeDao;

public class CollegeService {
	CollegeDao dao = null;

	public CollegeService() {
		dao = new CollegeDao();
	}

	public int count() {
		return dao.count();
	}

	public ArrayList<College> get(int page, int rows, String order, String sort) {
		return dao.get(page, rows, order, sort);
	}

	public boolean add(College co) {
		return dao.add(co);
	}

	public void del(String ids) {
		if (ids != null) {
			for (String id : ids.split(",")) {
				int i = Integer.parseInt(id);
				dao.del(i);
			}
		}
	}
	public boolean edit(College co) {
		return dao.edit(co);
	}
}
