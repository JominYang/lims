package com.lims.service;

import java.util.ArrayList;

import com.lims.bean.Major;
import com.lims.dao.MajorDao;

public class MajorService {
	MajorDao dao = null;

	public MajorService() {
		dao = new MajorDao();
	}

	public int count(String college_name) {
		return dao.count(college_name);
	}

	public ArrayList<Major> get(int page, int rows, String order, String sort,String college_name) {
		return dao.get(page, rows, order, sort,college_name);
	}

	public boolean add(Major co) {
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
	public boolean edit(Major co) {
		return dao.edit(co);
	}
}
