package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

//import com.jspsmart.upload.File;
//import com.jspsmart.upload.Files;
//import com.jspsmart.upload.SmartUpload;
//import com.jspsmart.upload.SmartUploadException;
import com.lims.bean.FileBean;
import com.lims.bean.JsonBean;
import com.lims.service.FileService;
import com.lims.tools.StringHandler;

public class FileServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("upload".equals(method)) {
//			upload(request, response);
		} else if ("downloadview".equals(method)) {
			downloadview(request, response);
		} else if ("download".equals(method)) {
//			download(request, response);
		} else if("del".equals(method)) {
			del(request, response);
		}
	}

	private void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		JsonBean j = new JsonBean();
		String id = request.getParameter("id");

		FileService service = new FileService();
		service.delFileInfo(id);
		j.setSuccess(true);
		
		JSONObject jsonObj = new JSONObject().fromObject(j);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

//	private void upload(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		PrintWriter out =response.getWriter();
//		String message = "";
//		long maxsize = 1024 * 1024 * 20;
//		String filedir = "/files/";
//
//		try {
//			SmartUpload myup = new SmartUpload();
//			myup.initialize(this, request, response);
//			myup.setTotalMaxFileSize(maxsize);
//			myup.upload();
//			Files files = myup.getFiles();
//			Date date = new Date();
//			FileService service = new FileService();
//
//			File file = files.getFile(0);
//			if (!file.isMissing()) {
//				int f = file.getSize();
//				DecimalFormat   myFormat   =   new   DecimalFormat( "0.00 "); 
//				float ff = (float) (f/(1024.0*1024));
//				
//				String   filesize   =   myFormat.format(ff);
//				String filename = file.getFileName();
//				String filetype = file.getContentType().trim();
//				String savename = StringHandler.getSerial(date) + "."+ file.getFileExt();
//				String fileinfo = myup.getRequest().getParameter("fileinfo");
//				String uptime = StringHandler.timeTostr(date);
//				FileBean vo = new FileBean();
//				vo.setFile_filename(filename);
//				vo.setFile_filesize(filesize+" M");
//				vo.setFile_filetype(filetype);
//				vo.setFile_savename(savename);
//				vo.setFile_fileinfo(fileinfo);
//				vo.setFile_uptime(uptime);
//
//				JsonBean jVo = new JsonBean();
//				if(service.addFileInfo(vo) > 0) {
//					file.saveAs(filedir + savename, File.SAVEAS_VIRTUAL);
//					jVo.setSuccess(true);
//					jVo.setMsg("文件 [" + file.getFilePathName() + "] 上传成功！");
//					
//					JSONObject jsonObj = new JSONObject().fromObject(jVo);
//					String jsonS = jsonObj.toString();
//					out.write(jsonS);
//				} else {
//					jVo.setSuccess(false);
//					jVo.setMsg("文件 [" + file.getFilePathName() + "] 上传失败！");
//					
//					JSONObject jsonObj = new JSONObject().fromObject(jVo);
//					String jsonS = jsonObj.toString();
//					out.write(jsonS);
//				}
//			}
//		} catch (SmartUploadException e) {
//			e.printStackTrace();
//		}
//	}

	private void downloadview(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String sPage = request.getParameter("page");
		String sRows = request.getParameter("rows");
		String order = request.getParameter("order");
		String sort = request.getParameter("sort");
		
		int page = 0;
		int rows = 0;
		if (sPage != null && sRows != null) {
			page = Integer.parseInt(sPage);
			rows = Integer.parseInt(sRows);
		}
		
		FileService service = new FileService();
		List filelist = service.getFileList(page, rows, order, sort);
		int total = service.count();
		
		Map m = new HashMap();
		m.put("total", total);
		m.put("rows", filelist);
		JSONObject jsonObj = new JSONObject().fromObject(m);
		String jsonS = jsonObj.toString();
		out.write(jsonS);
//		request.setAttribute("filelist", filelist);
//		request.getRequestDispatcher("/jsp/common/downloadfile.jsp").forward(request, response);
	}

//	private void download(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		String filedir = "/files/";
//		String downfilename = request.getParameter("downname");
//		FileBean file = null;
//
//		try {
//			FileService service = new FileService();
//			file = service.getFileSingle(downfilename);
//			if (file != null) {
//				String filename = new String(file.getFile_filename().getBytes(
//						"UTF-8"), "ISO-8859-1");
//				SmartUpload mydown = new SmartUpload();
//				mydown.initialize(getServletConfig(), request, response);
//				mydown.setContentDisposition(null);
//				mydown.downloadFile(filedir + downfilename, file.getFile_filetype(),
//						filename);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			String message = "× 下载失败！文件 <b><font color='red'>"
//					+ file.getFile_filename() + "</font></b> 不存在或已经被删除！<br>";
//			message += "<a href='javascript:window.history.go(-1)'>返回</a>";
//			request.setAttribute("message", message);
//			RequestDispatcher rd = request.getRequestDispatcher("/message.jsp");
//			rd.forward(request, response);
//		}
//	}
}
