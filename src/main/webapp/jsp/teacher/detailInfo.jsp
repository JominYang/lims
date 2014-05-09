<%@ page language="java" import="java.util.*,com.lims.bean.KechengBiao,com.lims.bean.Student,com.lims.tools.DateUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detailInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style type="text/css">
  	#selectTable td{
  			background:#B7E8FB;
		font-family: "微软雅黑";
		font-size: 12px;
		cellpadding:5px;
		width:440PX;
  	}
		#selectTable1{
  		background:#68b5fc;
		font-family: "微软雅黑";
		font-size: 12px;
		cellpadding:5px;
  	}
#sp {
	font-family: "华文新魏";
	font-size: 15px;
	font-weight: bold;
	text-decoration: none;
	width: 25px;
	margin-top: 15px;
	margin-right: 5px;
	margin-bottom: 15px;
	margin-left: 40px;
	height: 38px;
	padding: 15px;
}
	#selectTable1 td{
		width:440PX;
			background:#B7E8FB;
		font-family: "微软雅黑";
		font-size: 12px;
		cellpadding:5px;
  	}
	#selectTable2 td{
		width:440PX;
		background:#B7E8FB;
		font-family: "微软雅黑";
		font-size: 12px;
		cellpadding:5px;
  	}
  	#northpan{
  		background:#EDF4FE;
  	}
	.font{
		font-family: "微软雅黑";
		font-size: 16px;
		font-weight:bold;
	}
	
	body{
		background:#E7EEFE;
	}
	#hr{
	border-top-width: 2px;
	border-top-style: double;
	border-top-color: #4085dd;
	height: 10px;
	margin-top: 5px;
	}
	
  </style>
  <%
  	KechengBiao kb =  (KechengBiao)request.getAttribute("kbInfo");
  	ArrayList<Student> stuList = new ArrayList<Student>();
  	stuList=  (ArrayList<Student>)request.getAttribute("stuList");
  	DateUtil dateutil = new DateUtil();
   %>
<body>
<span id="sp">课程信息:</span><div id="hr"></div>
	<table id="selectTable1" cellpadding="5px" align="center">
    		
   		  <tr>
    			<td align="right"  class="font">老师:</td>
    			<td align="left" style="background-color:#cBFAFB"><%=kb.getTeacher_name()%></td>
    		
    			<td align="right" class="font" >实验室:</td>
    			<td align="left" style="background-color:#cBFAFB"><%=kb.getLabroomName()%></td>
                <td align="right" class="font">实验名:</td>
    			<td align="left" style="background-color:#cBFAFB"><%=kb.getExperiment_name()%></td>
                </tr>
            <tr>
				<td align="right"  class="font">上课日期：</td>
    			<td align="left" style="background-color:#cBFAFB"><%=kb.getCurentday()%>&nbsp;&nbsp;&nbsp;&nbsp;<%=dateutil.changeWeekDay(kb.getXingqiji())%>&nbsp;&nbsp;&nbsp;&nbsp;第<%=kb.getDijijie()%>节</td>
                
		
				<td align="right" class="font">核定人数：</td>
    			<td align="left" style="background-color:#cBFAFB"><%=kb.getTotalStuNum()%>人</td>
                <td align="right" class="font">已选人数：</td>
    			<td align="left" style="background-color:#cBFAFB"><%=kb.getCurentStuNum()%>人</td>
			</tr>
            </table>
   
<br><span id="sp">学生详细信息:</span><div id="hr"></div>
             <table id="selectTable1" cellpadding="5px" align="center">
            
            
            <tr>
			  <td align="center" class="font" >学号：</td>
                <td align="center" class="font">姓名:</td>
   			  <td align="center" class="font">学院:</td>
              <td align="center" class="font">专业：</td>
			</tr>
			<%for(int i=0;i<stuList.size();i++){ 
				
			%>
            <tr>
				<td align="center" style="background-color:#cBFAFB"><%=stuList.get(i).getStu_num() %></td>
                <td align="center" style="background-color:#cBFAFB"><%=stuList.get(i).getStu_name() %></td>
    			<td align="center" style="background-color:#cBFAFB" ><%=stuList.get(i).getCollege_name() %></td>
                <td align="center" style="background-color:#cBFAFB"><%=stuList.get(i).getMajor_name() %></td>
			</tr>
			<%} %>
    		</table>
</body>
</html>
