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
  </style>
  <script type="text/javascript" charset="utf-8">
  var exp;
  	$(function(){  
        var selectLab = $('#selectLab').combobox({
        url:sy.bp()+'/PaikeSelectLab',
        editable:true,
        valueField:'id',
        textFiled:'name',
       
      });
   
      	
});
function onsub(){  
	/*
      	alert($('#selectLab').combobox('getValue')+"--"+$('#dd').combobox('getValue')+"--"+
      	$('#ee').combobox('getValue')+"--"+$('#cc').combobox('getValue')+""+$('#ff').combobox('getValue')
      	+"--"+$('input:radio[name="weekend"]:checked').val()+"---"+$('#exp').combobox('getText')
      	);*/
	 				
      		$.ajax({
	 			url:sy.bp()+'/PaikeSubServlet?sub=paikeByhand',
	 			async: false,
	 			data:{
	 				cuname:$('#seleform input[id=cuname]').val(),
	 				Labroom:$('#selectLab').combobox('getText'),
	 				dateStart:$('#dd').combobox('getValue'),
	 				dateEnd:$('#ee').combobox('getValue')
	 
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
      	function search(){  
	/*
      	alert($('#selectLab').combobox('getValue')+"--"+$('#dd').combobox('getValue')+"--"+
      	$('#ee').combobox('getValue')+"--"+$('#cc').combobox('getValue')+""+$('#ff').combobox('getValue')
      	+"--"+$('input:radio[name="weekend"]:checked').val()+"---"+$('#exp').combobox('getText')
      	);*/
	 		var kebiaoname = $('#selectLab').combobox('getText');	
      		
      	}	
  </script>
  <body class="easyui-layout">
    	<div region="center" id="northpan" border="false" title="第一步" style="height:300px;overflow:hidden">
    		<form method="post" id="seleform" action="/lims/PaikeSubServlet?sub=paikeByhand">
    		<table id="selectTable" cellpadding="5px" align="center">
    		<th align="center" colspan="2" style="font-family: '微软雅黑';font-size: 12px;">排课的要求</th>
    		<tr>
    			<td align="right">（任意名称或编号，但不要同以前的重复）请输入课程表名称或者编号:</td>
    			<td align="left"><input type="text" name="cuname" id="cuname"></input></td>
    		</tr>
    		<tr>
    			<td align="right">请选择实验室:</td>
    			<td align="left"><select id="selectLab" name="Labroom" style="width:200px;"></select></td>
    		</tr>
    		<tr>
					<td align="right">开始和结束日期:</td>
					<td align="left"><input id="dd" name="dateStart" class="easyui-datebox" editable="false" style="width: 155px;" />至<input id="ee" name="dateEnd" class="easyui-datebox" editable="false" style="width: 155px;" /></td>
				</tr>
    		<tr>
    		<td align="right">确认无误后,请提交...</td>
    		<td><input type="submit" value="提交"></input></td>
    		</tr>
    		</table>
    		</form>	 
    	</div> 
    	
    </body>
</html>
