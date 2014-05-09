package com.lims.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lims.bean.Expriment;
import com.lims.bean.Labroom;
import com.lims.dao.LabDao;
/**
 * 
 * @author 廖金铭
 *功能：得到实验室列表以及实验的列表。
 */
public class PaikeSelectLab extends HttpServlet {

	private static final long serialVersionUID = 499914302353928278L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LabDao labdao = new LabDao();
		JSONObject jsonObject=null;
		JSONObject jsonObject1=null;
		JSONArray jsonArray = new JSONArray();
		JSONArray jsonArray1 = new JSONArray();
		ArrayList<Labroom> alist = null;
		
		//得到所有实验室的名称
		alist = labdao.select();
		for(int i=0;i<alist.size();i++){
			String labroom_name = alist.get(i).getLabroom_name();
			jsonObject = new JSONObject();
			jsonObject.put("id", labroom_name);
			jsonObject.put("text", labroom_name);
			ArrayList<Expriment> explist = new ArrayList<Expriment>();
//			Iterator<Expriment> it = explist.iterator();
//			for(;it.hasNext();){
//				System.out.println(it.next().getExperimentS_name());
//			}
			
			explist = labdao.selectExpByLabname(labroom_name);
			
			for(int j=0;j<explist.size();j++){
				
				jsonObject1 = new JSONObject();
				jsonObject1.put("id", i+"-"+j);
				jsonObject1.put("text", explist.get(j).getExperimentS_name());
				jsonArray1.add(jsonObject1);
			}
			
			jsonObject.put("expname", jsonArray1);
			jsonArray1.clear();
			jsonArray.add(jsonObject);
		}
		response.getWriter().write(jsonArray.toString());
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
