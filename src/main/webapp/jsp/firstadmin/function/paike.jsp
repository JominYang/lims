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
        onSelect:function(data){
        console.info(data.id);
        console.info(data.expname);
        	 exp.combobox('loadData',data.expname);  
        }
      });
      	exp = $('#exp').combobox({
        editable:true,
        valueField:'id',
        textFiled:'name',
      });
      
    $('#cc').combobox('disable');
			$('#ff').combobox('disable');
       		$('#dd').datebox('disable');
      		$('#ee').datebox('disable');   
      	
});
function onsub(){  
	/*
      	alert($('#selectLab').combobox('getValue')+"--"+$('#dd').combobox('getValue')+"--"+
      	$('#ee').combobox('getValue')+"--"+$('#cc').combobox('getValue')+""+$('#ff').combobox('getValue')
      	+"--"+$('input:radio[name="weekend"]:checked').val()+"---"+$('#exp').combobox('getText')
      	);*/
	 				
      		$.ajax({
	 			url:sy.bp()+'/PaikeSubServlet?sub=subCondition',
	 			async: false,
	 			data:{
	 				cuname:$('#seleform input[id=cuname]').val(),
	 				Labroom:$('#selectLab').combobox('getText'),
	 				dateStart:$('#dd').combobox('getValue'),
	 				dateEnd:$('#ee').combobox('getValue'),
	 				/*weekStart:$('#cc').combobox('getValue'),"*/
	 				/*weekEnd:$('#ff').combobox('getValue'),*/
	 				/*ifweekend:$('input:radio[name="weekend"]:checked').val(),*/
	 				exp:$('#exp').combobox('getText')
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
		function enable(){
			$('#cc').combobox('clear');
		
			$('#cc').combobox('disable');
				$('#ff').combobox('clear');
			$('#ff').combobox('disable');
			
       		$('#dd').datebox('enable');
      		$('#ee').datebox('enable');
       		
		}
		
		function disable(){
			$('#dd').datebox('clear');
			$('#dd').datebox('disable');
		$('#ee').datebox('clear');
			$('#ee').datebox('disable');
			
       		$('#cc').combobox('enable');
      		$('#ff').combobox('enable');
       		
		}	
  </script>
  <body class="easyui-layout">
    	<div region="center" id="northpan" border="false" title="第一步" style="height:300px;overflow:hidden">
    		<form method="post" id="seleform">
    		<table id="selectTable" cellpadding="5px" align="center">
    		<th align="center" colspan="2" style="font-family: '微软雅黑';font-size: 12px;">排课的要求</th>
    		<tr>
    			<td align="right">（任意名称或编号，但不要同以前的重复）请输入课程表名称或者编号:</td>
    			<td align="left"><input type="text" id="cuname"></input></td>
    		</tr>
    		<tr>
    			<td align="right">请选择实验室:</td>
    			<td align="left"><select id="selectLab" name="Labroom" style="width:200px;"><option value="请选择..."></option></select></td>
    		</tr>
    		<tr>
    			<td align="right">时段选择方式：</td>
    			<td align="left"><a class="easyui-linkbutton" plain="true" name="date"  onclick="enable()">按日期</a>
(该日期内，所有实验只排一次，且不排周六周日，请确认！)
    			</td>
    		</tr>
    		<tr>
					<td align="right">开始和结束日期:</td>
					<td align="left"><input id="dd" name="dateStart" class="easyui-datebox" editable="false" style="width: 155px;" />至<input id="ee" name="dateEnd" class="easyui-datebox" editable="false" style="width: 155px;" /></td>
				</tr>
				<!--  <tr>
					<td align="right">(如果选择周次方式，所选的周次课程表一样)开始周数和结束周数:</td><td align="left">
					<select id="cc" class="easyui-combobox" name="weekStart" style="width:155px;" required="true">
		<option value="0"></option>
		<option value="1">第一周</option>
		<option value="2">第二周</option>
		<option value="3">第三周</option>
		<option value="4">第四周</option>
		<option value="5">第五周</option>
		<option value="6">第六周</option>
		<option value="7">第七周</option>
		<option value="8">第八周</option>
		<option value="9">第九周</option>
		<option value="10">第十周</option>
		<option value="11">第十一周</option>
		<option value="12">第十二周</option>
		<option value="13">第十三周</option>
		<option value="14">第十四周</option>
		<option value="15">第十五周</option>
		<option value="16">第十六周</option>
		<option value="17">第十七周</option>
		<option value="18">第十八周</option>
		<option value="19">第十九周</option>
		<option value="20">第二十周</option>
		<option value="21">第二十一周</option>
		<option value="22">第二十二周</option>
		<option value="23">第二十三周</option>
		<option value="24">第二十四周</option>
	</select>至<select id="ff" class="easyui-combobox" name="weekEnd" style="width:155px;" required="true">
		<option value="0"></option>
		<option value="1">第一周</option>
		<option value="2">第二周</option>
		<option value="3">第三周</option>
		<option value="4">第四周</option>
		<option value="5">第五周</option>
		<option value="6">第六周</option>
		<option value="7">第七周</option>
		<option value="8">第八周</option>
		<option value="9">第九周</option>
		<option value="10">第十周</option>
		<option value="11">第十一周</option>
		<option value="12">第十二周</option>
		<option value="13">第十三周</option>
		<option value="14">第十四周</option>
		<option value="15">第十五周</option>
		<option value="16">第十六周</option>
		<option value="17">第十七周</option>
		<option value="18">第十八周</option>
		<option value="19">第十九周</option>
		<option value="20">第二十周</option>
		<option value="21">第二十一周</option>
		<option value="22">第二十二周</option>
		<option value="23">第二十三周</option>
		<option value="24">第二十四周</option>
	</select></td>
				</tr>
				<tr>
				<td align="right">星期六星期天是否排课：</td>
				<td><input type="radio" name="weekend" value="paike" id="Paike">排课</input>
				<input type="radio" name="weekend" value="bupaike" id="Paike">不排课</input></td>
				</tr>-->
    		<tr>
    			<td align="right">请选择该时段内开放的实验:</td>
    			<td align="left"><input type="text" name="exp"  multiple="true" id="exp" style="width:400px">
</td>
    		</tr>
    		<tr>
    		<td align="right">确认无误后,请提交...</td>
    		<td><a class="easyui-linkbutton" iconCls="icon-tick"  onclick="onsub();">提交</a></td>
    		</tr>
    		</table>
    		</form>	 
    	</div> 
    	
    </body>
</html>
