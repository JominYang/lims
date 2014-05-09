<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<jsp:include page="../../commonTop.jsp"></jsp:include>  
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
  </style>
  <script type="text/javascript" charset="UTF-8">
  	var datagrid;
  	$(function(){ 
        var exp = $('#exp').combobox({
        url:sy.bp()+'/StuFuctionServlet?method=expSearch',
        editable:true,
        valueField:'id',
        textFiled:'name'
      });
      
  		datagrid = $('#datagrid').datagrid({
  				url: sy.bp()+'/CourseSearch?method=searchAllbyStu',
				title: '实验课程信息表',
				iconCls:'icon-save',
				fit:true,
				pagination:true,
				pageSize:10,
				pageList:[10,20,30,40,50,60,70,80,90,100],
				height:200,
				fitColumns: true,
				striped:true,
				nowrap:false,
				border:false,
				idField:'id',
				columns:[[
					{field:'id',title:'id',width:100,hidden:true},
					{field:'experiment_name',title:'实验名称',	width : 100},
					{field:'curentDate',title:'日期',	width : 100},
					{field:'xingqiji',title:'星期几',	width : 100},
					{field:'dijijie',title:'第几节',	width : 100},
					{field:'teacher_name',title:'上课教师',	width : 100}
				]],
  		});
  	});
  	
  	function onsub(){
  	var exp = $('#exp');
  	var expriment = exp.combobox('getText');
  	var dateStart = $('#dd');
  	var statdate = dateStart.combobox('getValue');
  	var dateEnd = $('#ee');
  	var enddate = dateEnd.combobox('getText');
  	
	 	datagrid.datagrid('load',{
	 		exp:expriment,
	 		statdate:statdate,
	 		enddate:enddate	
	 	});
	 }
	 		
      	
  
  	function clearFun() {
		$('#seleform input').val('');
		datagrid.datagrid('load', {});
	}
  </script>
  <body class="easyui-layout">
    		<div region="north" id="northpan" border="false" title="搜索我的实验" style="height:170px;overflow:hidden">
    		<form method="post" id="seleform">
    		<br>
    		<table id="selectTable" cellpadding="5px" align="center">
    		
    		<tr>
    			<td align="right">请选择实验:</td>
    			<td align="left"><input type="text" name="exp"  id="exp" style="width:200px">
</td>
    		</tr>
    		<tr>
					<td align="right">开始日期(必填)和结束日期(可以不填):</td>
					<td align="left"><input id="dd" name="dateStart" class="easyui-datebox" editable="false" style="width: 155px;" />至<input id="ee" name="dateEnd" class="easyui-datebox" editable="false" style="width: 155px;" /></td>
				</tr>
    		<tr>
    		<td align="right">搜索:</td>
    		<td><a class="easyui-linkbutton" iconCls="icon-tick" plain="true" onclick="onsub();">搜索</a><a class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="clearFun();" href="javascript:void(0);">清空</a></td>
    		</tr>
    		</table>
    		</form>	 
    	</div> 
    	<div id="regCenter" region="center" border="false" title="课表查询">
    	<div class="easyui-tabs" fit="true" border="false">
  			<div title="课程安排" border="false">
  				<table id="datagrid"></table>
  			</div>
  			</div>
    	</div>  
    </body>
</html>
