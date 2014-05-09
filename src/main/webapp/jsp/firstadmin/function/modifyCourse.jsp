<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<jsp:include page="../../../commonTop.jsp"></jsp:include>  
  </head>
  <style type="text/css">
  	#selectTable td{
  		background:#E0ECFF;
		font-family: "微软雅黑";
		font-size: 12px;
		cellpadding:5px;
		width:440PX;
  	}
  	#northpan{
  		background:#EDF4FE;
  	}
  	#regCenter{
  		background:#EDF4FE;
  	}
  </style>
  <script type="text/javascript" charset="UTF-8">
  var exp;
  	$(function(){  
  		 var labname = $('#labname').combobox({
        url:sy.bp()+'/CourseSearch?method=byCuname',
        editable:false,
        valueField:'id',
        textFiled:'name',
        onSelect:function(data){
        console.info(data.id);
        console.info(data.kebiaoname);
        	 cuname.combobox('loadData',data.kebiaoname); 
        	  createTime.combobox('loadData',data.createDate);
        }
        });
        var cuname = $('#cuname').combobox({
      
        editable:false,
        valueField:'id',
        textFiled:'name'
        });
        var createTime = $('#createTime').combobox({
        editable:false,
        valueField:'id',
        textFiled:'name' });
  
   			$('#cuname').combobox('disable');
			$('#createTime').combobox('disable');  
});
function onsub(){  
	/*
      	alert($('#selectLab').combobox('getValue')+"--"+$('#dd').combobox('getValue')+"--"+
      	$('#ee').combobox('getValue')+"--"+$('#cc').combobox('getValue')+""+$('#ff').combobox('getValue')
      	+"--"+$('input:radio[name="weekend"]:checked').val()+"---"+$('#exp').combobox('getText')
      	);*/
	 			var cuname1 = $('#cuname').combobox('getText');
	 			var dateStart1 = $('#createTime').combobox('getText');
	 			var cuname=   encodeURIComponent(cuname1);
	 			var dateStart = encodeURIComponent(dateStart1);
	 			var labname1 = $('#labname').combobox('getText');
	 			var labname = encodeURIComponent(labname1);
	 			if(labname==""){
	 				$.messager.alert('提示',"请选择实验室");
	 					return;
	 			}
	 			
	 			if(cuname==""&&dateStart==""){
	 					$.messager.alert('提示',"请选择课表名或开始时间");
	 					return;
	 			}
	 			window.location ="/lims/KeBiaoServlet?searchMethod=modify&cuname="+cuname+"&dateStart="+dateStart;
      	
      	}
      	function onsubblank(){  
	/*
      	alert($('#selectLab').combobox('getValue')+"--"+$('#dd').combobox('getValue')+"--"+
      	$('#ee').combobox('getValue')+"--"+$('#cc').combobox('getValue')+""+$('#ff').combobox('getValue')
      	+"--"+$('input:radio[name="weekend"]:checked').val()+"---"+$('#exp').combobox('getText')
      	);*/
	 			var cuname1 = $('#cuname').combobox('getText');
	 			var dateStart1 = $('#createTime').combobox('getText');
	 			var cuname=   encodeURIComponent(cuname1);
	 			var dateStart = encodeURIComponent(dateStart1);
	 			var labname1 = $('#labname').combobox('getText');
	 			var labname = encodeURIComponent(labname1);
	 			if(labname==""){
	 				$.messager.alert('提示',"请选择实验室");
	 					return;
	 			}
	 			
	 			if(cuname==""&&dateStart==""){
	 					$.messager.alert('提示',"请选择课表名或开始时间");
	 					return;
	 			}
	 			window.open("/lims/KeBiaoServlet?searchMethod=modify&cuname="+cuname+"&dateStart="+dateStart,"_blank");
      	
      	}
      	function reload(){  
	 			window.location = "/lims/jsp/firstadmin/function/modifyCourse.jsp";
      	
      	}
		function disable(){
			$('#cuname').combobox('clear');
		
			$('#cuname').combobox('disable');
			
       		$('#createTime').datebox('enable');
       		
		}
		function enable(){
			$('#createTime').datebox('clear');
			$('#createTime').datebox('disable');
      		$('#cuname').combobox('enable');
       		
		}	
  </script>
  <body class="easyui-layout" style="background:#EDF4FE">
    	<div id="regCenter" region="center" border="false" title="课表修改">
  			<form method="get" action="<%=request.getContextPath()%>/KeBiaoServlet?searchMethod=chakan" id="seleform">
    		<table id="selectTable" cellpadding="5px" align="center">
    		<th align="center" colspan="2" style="font-family: '微软雅黑';font-size: 14px;">课表修改</th>
    		
    		
    		<tr>
    			<td align="right">选择方式：</td>
    			<td align="left"><a class="easyui-linkbutton" plain="true" name="date"  onclick="enable()">按课表名称</a>
或者
		<a  class="easyui-linkbutton" plain="true" name="week"  onclick="disable()" >按创建课表时间</a>
    			</td>
    		</tr>
    		<tr>
    			<td align="right">请选择实验室:</td>
    			<td align="left"><select id="labname" name="labname" style="width:200px;"></select></td>
    		</tr>
    		<tr>
    			<td align="right">请选择课表的名称:</td>
    			<td align="left"><select id="cuname" name="cuname" style="width:200px;"></select></td>
    		</tr>
    		<tr>
    			<td align="right">请选择课表的创建时间:</td>
    			<td align="left"><select id="createTime" name="createTime" style="width:200px;"></select></td>
    		</tr>
    		<tr>
    		<td align="right">搜索...</td>
    		<td><a onclick="onsub();" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
    			<a onclick="reload();" class="easyui-linkbutton" iconCls="icon-reload">刷新</a>
    		</td>
    		</tr>
    		<tr>
    		<td align="right">搜索,并在新窗口打开...</td>
    		<td><a onclick="onsubblank();"class="easyui-linkbutton" iconCls="icon-search" target="_blank">搜索，并在新窗口打开</a></td>
    		</tr>
    		</table>
    		
    		</form>	 
    	</div>  
    </body>
</html>
