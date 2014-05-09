package com.lims.bean;

import com.lims.tools.StringHandler;

public class FileBean {
	private int id;			
	private String file_savename;	//文件存储名称
	private String file_filename;	//文件名
	private String file_filetype;	//文件类型
	private String file_filesize;	//文件大小
	private String file_fileinfo;	//文件描述信息
	private String file_uptime;		//上传时间
	private String file_lab;		//实验室
	private String file_exp;		//实验信息
	
	public String getFileInfoForShow(){
		return StringHandler.changehtml(file_fileinfo);
	}
	public final int getId() {
		return id;
	}
	public final void setId(int id) {
		this.id = id;
	}
	public final String getFile_savename() {
		return file_savename;
	}
	public final void setFile_savename(String file_savename) {
		this.file_savename = file_savename;
	}
	public final String getFile_filename() {
		return file_filename;
	}
	public final void setFile_filename(String file_filename) {
		this.file_filename = file_filename;
	}
	public final String getFile_filetype() {
		return file_filetype;
	}
	public final void setFile_filetype(String file_filetype) {
		this.file_filetype = file_filetype;
	}
	public final String getFile_filesize() {
		return file_filesize;
	}
	public final void setFile_filesize(String file_filesize) {
		this.file_filesize = file_filesize;
	}
	public final String getFile_fileinfo() {
		return file_fileinfo;
	}
	public final void setFile_fileinfo(String file_fileinfo) {
		this.file_fileinfo = file_fileinfo;
	}
	public final String getFile_uptime() {
		return file_uptime;
	}
	public final void setFile_uptime(String file_uptime) {
		this.file_uptime = file_uptime;
	}
	public final String getFile_lab() {
		return file_lab;
	}
	public final void setFile_lab(String file_lab) {
		this.file_lab = file_lab;
	}
	public final String getFile_exp() {
		return file_exp;
	}
	public final void setFile_exp(String file_exp) {
		this.file_exp = file_exp;
	}
}
