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
        url:sy.bp()+'/TeaFuctionServlet?method=expSearchQD',
        editable:true,
        valueField:'id',
        textFiled:'name'
        });
      });
  	function onsub(){
  	var exp = $('#exp');
  	var expriment = exp.combobox('getText');
  	var exprimentid =  exp.combobox('getValue');
  		window.location=sy.bp()+"/TeaFuctionServlet?method=stuQD&exp="+exprimentid;
	 }
  </script>
  <body class="easyui-layout">
    		<div region="center" id="northpan" border="false" title="搜索我的实验" style="height:170px;overflow:hidden">
    		<form method="post" id="seleform">
    		<br>
    		<table id="selectTable" cellpadding="5px" align="center">
    		
    		<tr>
    			<td align="right">请选择实验:</td>
    			<td align="left"><input type="text" name="exp"  id="exp" style="width:200px">
</td>
    		</tr>
    		<tr>
    		<td align="center" colspan="2"><a class="easyui-linkbutton" iconCls="icon-tick" plain="true" onclick="onsub();">开始签到</a></td>
    		</tr>
    		</table>
    		</form>	 
    	</div>  
    </body>
</html>
