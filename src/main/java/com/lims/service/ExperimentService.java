package com.lims.service;

import java.util.ArrayList;

import com.lims.bean.Expriment;
import com.lims.dao.ExperimentDao;

public class ExperimentService {
	ExperimentDao dao = null;
	
	public ExperimentService(){
		dao = new ExperimentDao();
	}
	
	public boolean add(Expriment e) {
		return dao.add(e);
	}
	
	public ArrayList<Expriment> get(int page, int rows, String order, String sort,Expriment e) {
		return dao.get(page, rows, order, sort, e);
	}
	public Expriment get(String id) {
		return dao.get(id);
	}
	
	public int count(Expriment e) {
		return dao.count(e);
	}
	
	public boolean del(String ids) {
		boolean flag = false;
		if(ids != null && !"".equals(ids)) {
			for(String id : ids.split(",")) {
				dao.del(id);
			}
			flag = true;
		}
		return flag;
	}
	public boolean edit(Expriment e) {
		return dao.edit(e);
	}
}
