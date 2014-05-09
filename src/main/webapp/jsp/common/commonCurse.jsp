
  <%@ page language="java" import="java.util.*,com.lims.dao.CurseDao,com.lims.bean.KechengBiao,com.lims.tools.PaikeService" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<jsp:include page="../../commonTop.jsp"></jsp:include>  
  </head>
<style type="text/css">
.drag {
	width:90px;
	height:55px;
	padding:3px;
	margin:2px;
	border:1px solid #ccc;
	background:#AACCFF;
	float:left;
	font-family: "微软雅黑";
	font-size: 12px;
	color: #000;
	overflow-x:hidden;
	overflow-y:hidden;
	
}
.drag1 {
	width:90px;
	height:20px;
	padding:3px;
	margin:2px;
	border:1px solid #ccc;
	background:#8d4e51;
	float:left;
	font-family: "微软雅黑";
	font-size: 12px;
	color: #000;
	overflow-x:hidden;
	overflow-y:hidden;
	
}
.dp {
	opacity:0.5;
	filter:alpha(opacity=50);
}
.over {
	background:#FBEC88;
}
#source div {
	float:left;
	font-family: "微软雅黑";
	font-size: 12px;
	color: #000;
}
#source div div{
	float:left;
	font-family: "微软雅黑";
	font-size: 12px;
	color: #600;
	background-color: #09C;
	height: 16px;
	width: 70px;
	border: 1px dashed #333;
}
#target div div{
	float:left;
	font-family: "微软雅黑";
	font-size: 12px;
	color: #600;
	background-color: #09C;
	height: 16px;
	width: 70px;
	border: 1px dashed #333;
}
#tea{
background: #8d4e51;
}
.right{
		
		}
		.right table{
			background:#E0ECFF;
			
			font-family: "微软雅黑";
			font-size: 12px;
		}
		.right td{
			background:#fafafa;
			text-align:center;
			padding:2px;
			
		}
		.right td{
			background:#E0ECFF;
		}
		.right td.drop{
			background:#fafafa;
			width:100px;
			height:67px;
		}
		.right td.over{
			background:#FBEC88;
		}
		.item{
			text-align:center;
			border:1px solid #499B33;
			background:#fafafa;
			width:100px;
		}
		.assigned{
			border:1px solid #BC2A4D;
		}
</style>

<% 
	PaikeService pk = new PaikeService();
	
	List<KechengBiao> alist = (List)request.getAttribute("alist");
	System.out.println(alist.toString());
	int curentpage = alist.get(0).getWeekpage();
	int maxpage =(Integer)request.getAttribute("maxpage");
	
	String kebiaoname =(String)request.getAttribute("kebiaoname");
	//获得开始时间
	String sdate = alist.get(0).getStarDate();
	String edate = alist.get(0).getEndDate();
%>
  <body>
  
  <div id="target" class="right" style="border:2px solid #fafafa;height:520px;margin:5px;">
  <table align="center">
  	<tr>
  		<td align="right">课表名：</td>
  		<td align="left"><%=kebiaoname%></td>
  		<td align="right">开始时间：</td>
  		<td align="left"><%=sdate %></td>
  		<td align="right">结束时间:</td>
  		<td align="left"><%=edate %></td>
  	</tr>
			<tr>
				<td class="blank"></td>
				<td class="title">星期一</td>
				<td class="title">星期二</td>
				<td class="title">星期三</td>
				<td class="title">星期四</td>
				<td class="title">星期五</td>
                <td class="title">星期六</td>
				<td class="title">星期天</td>
			</tr>
			
				
				<% 
				for(int jie=0;jie<6;jie++){%>
				<tr>
					<td class="time">第<%=jie+1%>节</td>
					<% 
					for(int i=0;i<7;i++){
						KechengBiao kecheng = pk.getCurentCurse(alist, i, jie);
						 if(kecheng !=null){
								%>
								<td class="drop">
								<div id="<%=6*i+jie %>" class="drag"><%=kecheng.getExperiment_name() %></div>
								<%if(kecheng.getTeacher_name()!=null&&kecheng.getTeacher_name()!=""&&!kecheng.getTeacher_name().equals(null)) {%>
								<div id="<%=6*i+jie %>" class="drag1" ><%=kecheng.getTeacher_name() %></div>
								<%} %>
								</td>
								<% 
							}else{
						
						%><td class="drop"></td><%}
					}%></tr><%
					}
				%>
			<tr>
				<td class="blank"></td>
				<%if(curentpage!=1) {%>
				<td class="title" colspan="2"><a href="<%=request.getContextPath() %>/KeBiaoServlet?searchMethod=chakan&weekpage=<%=(curentpage-1)%>&cuname=<%=kebiaoname %>">上一周</a></td>
				<%} else{%>
				<td class="title" colspan="2">没有上一周</td>
				<%} %>
				<td></td>
				<td></td>
				<%if(curentpage < maxpage) {
					System.out.println("curentpage====="+curentpage);
					System.out.println("maxpage====="+maxpage);
				%>
				<td class="title" colspan="2"><a href="<%=request.getContextPath() %>/KeBiaoServlet?searchMethod=chakan&weekpage=<%=(curentpage+1)%>&cuname=<%=kebiaoname %>">下一周</a></td>
				<%} else{%>
				<td class="title" colspan="2">没有下一周</td>
				<%} %>
			</tr>
			<tr>
				<td colspan="10"><a class="easyui-linkbutton" plain="true" iconCls="icon-redo" href="<%=request.getContextPath()%>/jsp/common/serchCourse.jsp">返回课表中心</a></td>
			</tr>
		</table> 
		
  </div>
</div>
  </body>