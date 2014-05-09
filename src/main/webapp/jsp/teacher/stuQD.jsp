<%@ page language="java" import="java.util.*,com.lims.bean.KechengBiao,com.lims.bean.Student" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../commonTop.jsp"></jsp:include> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuQD.jsp' starting page</title>
    
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
	font-family: "微软雅黑";
	font-size: 12px;
	cellpadding:10px;
	font-weight:bold;
	width:130px;
	height:22px;
  	}
	.img{
	float: left;
	height: 110px;
	width: 220px;
	background-image: url(/lims/jsp/teacher/stuimg/qiandao_3.jpg);
	background-repeat: no-repeat;
	background-position: 0px 0px;
	margin: 2px;
	border: 1px solid #CF9;
	}
	.img1{
	float: left;
	height: 110px;
	width: 220px;
	background-image: url(/lims/jsp/teacher/stuimg/qiandao_4.jpg);
	background-repeat: no-repeat;
	background-position: 0px 0px;
	margin: 2px;
	border: 1px solid #CF9;
	}
	.name{
		float: right;
		font-family: "微软雅黑";
		font-size: 12px;
		font-weight:bold;
	}
	body{
		background:#eeffee;
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
  	String expID = (String)request.getAttribute("expId");
  	int kb_id = new Integer(expID);
   %>
   <script type="text/javascript" charset="UTF-8">
  	var kb_id = <%=kb_id%>;
  	function onSub(){
  	var stuid = document.getElementById("stuId");
  	alert(kb_id);
  	var stu_num = stuid.value;
  			$.ajax({
	 			url:sy.bp()+'/TeaFuctionServlet?method=QD',
	 			async: false,
	 			data:{
	 					stu_num:stu_num,
	 					kb_id:kb_id
	 			},
	 			dataType:'json',
	 			cache:false,
	 			success:function(r){
	 				if(r){
	 					$.messager.show({title:'提示',msg:r.msg});
	 				}else{
	 					$.messager.alert('提示',"签到失败");
	 				}
	 			}
	 		});
	 }
	 function reload(){
  		window.location=sy.bp()+"/TeaFuctionServlet?method=stuQD&exp="+kb_id;
	 }
  </script>
 
<body>
  <table id="selectTable">
        	<tr>
            <td></td>
            <td align="right" colspan="2">请输入学号：</td>
             <td align="left"><input type="text" id="stuId"></input></td>
            <td align="right">签到：</td>
            <td align="left" colspan="2"><input type="button"  value="点击签到" href="javascript:void(0)" onclick="onSub()"></td>
              <td align="right">更新后，请刷新页面：</td>
            <td align="left"><input type="button" value="刷新" href="javascript:void(0)" onclick="reload()"></td>
            </tr>
  </table>
<div id="hr"></div>
<%for(int i=0;i<stuList.size();i++){ 
if(stuList.get(i).getQD_state()==1){
			%>
<div class="img1">
  <table id="selectTable">
        	<tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getStu_num() %></td>
            </tr>
            <tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getStu_name() %></td>
            </tr>
            <tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getCollege_name() %></td>
            </tr>
            <tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getMajor_name() %></td>
            </tr>
  </table>			
</div>
<%}else{ %>
<div class="img">
  <table id="selectTable">
        	<tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getStu_num() %></td>
            </tr>
            <tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getStu_name() %></td>
            </tr>
            <tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getCollege_name() %></td>
            </tr>
            <tr>
            <td></td>
            <td align="left"><%=stuList.get(i).getMajor_name() %></td>
            </tr>
  </table>			
</div>
<%}} %>
</body>
</html>
