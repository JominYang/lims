package com.lims.service;

import java.util.List;

import com.lims.bean.FileBean;
import com.lims.dao.FileDao;

public class FileService {
	FileDao dao = null;
	public FileService() {
		dao = new FileDao();
	}
	public int addFileInfo(FileBean file){
		return dao.addFileInfo(file);
	}
	public List getFileList() {
		return dao.getFileList();
	}
	public List getFileList(int page, int rows, String order, String sort) {
		return dao.getFileList(page, rows, order, sort);
	}
	
	public FileBean getFileSingle(String savename) {
		return dao.getFileSingle(savename);
	}
	
	public int count() {
		return dao.count();
	}
	public void delFileInfo(String id ) {
		dao.delFileInfo(id);
	} 
}
