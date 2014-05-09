package com.lims.service;

import java.util.ArrayList;

import com.lims.bean.Classes;
import com.lims.dao.ClassesDao;

public class ClassesService {
	ClassesDao dao = null;
	public ClassesService(){
		dao = new ClassesDao();
	}
	
	public ArrayList<Classes> get(int page, int rows, String order, String sort,int major_id) {
		return dao.get(page, rows, order, sort,major_id);
	}
	public int count(int major_id) {
		return dao.count(major_id);
	}
	
	public boolean add(Classes co){
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
	
	public boolean edit(Classes co) {
		return dao.edit(co);
	}
}
