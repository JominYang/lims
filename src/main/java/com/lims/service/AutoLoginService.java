package com.lims.service;

import com.lims.dao.AutoLoginDao;

public class AutoLoginService {
	AutoLoginDao dao = null;
	public AutoLoginService() {
		dao = new AutoLoginDao();
	}
	public boolean add(String sessionId , String userNo) {
		return dao.add(sessionId, userNo);
	}
	public boolean del(String sessionId) {
		return dao.del(sessionId);
	}
	public boolean get(String sessionId , String userNo) {
		return dao.get(sessionId, userNo);
	}
}
