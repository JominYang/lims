<%@ page language="java" import="java.util.*,com.lims.bean.KechengBiao,com.lims.bean.Student,com.lims.tools.DateUtil" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DCJInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:include page="../../commonTop.jsp"></jsp:include>  
  </head>
 
  <style type="text/css">
.bgth{
	font-family: "微软雅黑";
	font-size: 15px;
	font-weight: bold;
	color: #06B;
	background-color:#0CD;
	text-decoration: none;
	text-align: center;	
	height:30px;
}
.bglist{
	font-family: "微软雅黑";
	font-size: 12px;
	color: #000;
	text-decoration: none;
	text-align: center;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #CCC;
}
.bglist select{
	width:5px;
}
#tab{
	border-top-width: 3px;
	border-top-style: solid;
	border-top-color: #999;
	border-right-color: #999;
	border-bottom-color: #999;
	border-left-color: #999;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;	
}
#spant{
	font-family: "Arial Unicode MS", "华文";
	font-size: 15px;
	color: #000;
	margin-bottom: 15px;
	height: 30px;
	width: 400px;
}
</style>
 <%
  	KechengBiao kb =  (KechengBiao)request.getAttribute("kbInfo");
  	ArrayList<Student> stuList = new ArrayList<Student>();
  	stuList=  (ArrayList<Student>)request.getAttribute("stuList");
  	DateUtil dateutil = new DateUtil();
  	ArrayList stuNumList = new ArrayList();
  	int kbId = kb.getId();
  	for(int i=0;i<stuList.size();i++){
  		stuNumList.add(stuList.get(i).getStu_num());
  		
  	}
  
   %>
    <script type="text/javascript">
   function sub(){ 
   var list  = new Array();
   var allNumList  =new Array();
   for(var i = 0;i<<%=stuList.size()%>;i++){
   		var t = '#a'+i;
   		var t1 = '#b'+i;
   		var t2 = '#c'+i;
   	
       var a =  $(t).combobox('getText'); 
       var b =  $(t1).combobox('getText'); 
       var c =  $(t2).combobox('getText'); 
     
       list.push(a);
       list.push(b);
       list.push(c);
    }
    var allCJ = list.toString();
    
    <%for(int j=0;j<stuNumList.size();j++){%>
    <%System.out.println("bianhao:::"+stuNumList.get(j).toString());%>
   		var t = '<%out.write(","+stuNumList.get(j).toString());%>';
   		
       allNumList.push(t);
     	
    <%}%>
    allNum = allNumList.toString();

    $.ajax({
    		
	 			url:sy.bp()+'/TeaDCJServlet?sub=DCJ',
	 			async: false,
	 			data:{
	 				allCJ:allCJ,
	 				allNum:allNum,
	 				kbId:<%=kbId%>
	 			},
	 			dataType:'json',
	 			cache:false,
	 			success:function(r){
	 				if(r){
	 					$.messager.show({title:'提示',msg:r.msg});
	 				}else{
	 					$.messager.alert('提示',"提交失败");
	 				}
	 			}
	 		});
    }
    
  </script>
<body>
<center>
<span id="spant">实验名：<%=kb.getExperiment_name()%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="spant">实验时间：[<%=kb.getCurentday()%>]</span>
</center>
<center>
<form method="post" >
	<table id="tab" width="800" cellspacing="0px" cellpadding="5px" bordercolor="#CCCCCC">
    	<tr>
	        <th class="bgth">学号</th>
            <th class="bgth">姓名</th>
            <th class="bgth">专业</th>
        	<th class="bgth">成绩一</th>
            <th class="bgth">成绩二</th>
            <th class="bgth">成绩三</th>
          <th class="bgth">最后成绩</th>
        </tr>
        <%for(int i=0;i<stuList.size();i++){ %>
        <tr>
	        <td class="bglist"  ><a class="easyui-linkbutton" plain="true" href="javaScript:void(0);" id="<%="d"+i%>" value="<%=stuList.get(i).getStu_num()%>"><%=stuList.get(i).getStu_num()%></a></td>
            <td class="bglist"><%=stuList.get(i).getStu_name() %></td>
            <td class="bglist"><%=stuList.get(i).getMajor_name() %></td>
        	<td class="bglist"><select class="easyui-combobox"  id="<%="a"+i%>" name="<%="a"+i%>" >
          <%for(int x=100;x>=0;x--){ %>
          <option  value="<%=x %>"> <%=x %> </option>
          <%} %>
</select></td>
            <td class="bglist"><select class="easyui-combobox"  id="<%="b"+i%>" name="<%="b"+i%>" >
           <%for(int x=100;x>=0;x--){ %>
          <option  value="<%=x %>"> <%=x %> </option>
          <%} %>
</select></td>
            <td class="bglist"><select class="easyui-combobox"  id="<%="c"+i%>" name="<%="c"+i%>" >
           <%for(int x=100;x>=0;x--){ %>
          <option  value="<%=x %>"> <%=x %> </option>
          <%} %>
</select></td>
            <td class="bglist">系统自动计算</td>
        </tr>
        
<%} %>
		<tr>
			<td colspan="3" sytle="font-family:'微软雅黑',font-size: 13px;" align="center">提交:</td>
			<td colspan="3"><input type="button" onclick="sub();" value="提交"></td>
		</tr>
    </table>
    </form>
</center>
</body>
</html>
