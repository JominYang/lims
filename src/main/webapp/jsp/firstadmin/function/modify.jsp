
  <%@ page language="java" import="java.util.*,com.lims.dao.TeacherDao,com.lims.dao.CurseDao,com.lims.bean.Expriment,com.lims.bean.KechengBiao,com.lims.bean.Teacher,com.lims.tools.PaikeService,com.lims.dao.LabDao" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<jsp:include page="../../../commonTop.jsp"></jsp:include>  
  </head>
  <% 
	PaikeService pk = new PaikeService();
	List<KechengBiao> alist = (List)request.getAttribute("alist");

	int curentpage = alist.get(0).getWeekpage();
	int maxpage =(Integer)request.getAttribute("maxpage");
	
	String kebiaoname =(String)request.getAttribute("kebiaoname");
	//获得开始时间
	String sdate = alist.get(0).getStarDate();
	String edate = alist.get(0).getEndDate();
	String labname = alist.get(0).getLabroomName();
	LabDao labdao = new LabDao();
	TeacherDao teacherdao = new TeacherDao();
	//获得该实验室的所有的实验
	ArrayList<Expriment> expnamelist = labdao.selectExpByLabname(labname);
	
	//从session中取得所在所在的学院
	String college = (String)session.getAttribute("teacher_College");
	//获得该学院的所有的老师
	ArrayList<Teacher> teacherList = teacherdao.getAllTeahcerByCollege(college);

	
%>
<style type="text/css">
.drag {
	width:90px;
	padding:3px;
	margin:2px;
	border:1px solid #ccc;
	background:#AACCFF;
	float:right;
	font-family: "微软雅黑";
	font-size: 12px;
	color: #000;
	overflow-x:hidden;
	overflow-y:hidden;
	
}
#d2{
		background: #8d4e51;
}
.drag1{
	width:90px;

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
		span{
			background:#E0ECFF;
			font-family: "微软雅黑";
			font-size: 15px;
		}
		#haha{
			height:30px;
		}
</style>
<script type="text/javascript" charset="utf-8">

	$(function(){
		$('.drag').draggable({
			proxy:'clone',
			revert:true,
			cursor:'auto',
			onStartDrag:function(){
				$(this).draggable('option').cursor='not-allowed';
				$(this).draggable('proxy').addClass('dp');
			},
			onStopDrag:function(){
				$(this).draggable('options').cursor='auto';
			}
		});
			$('.drag1').draggable({
			proxy:'clone',
			revert:true,
			cursor:'auto',
			onStartDrag:function(){
				$(this).draggable('option').cursor='not-allowed';
				$(this).draggable('proxy').addClass('dp');
			},
			onStopDrag:function(){
				$(this).draggable('options').cursor='auto';
			}
		});
		$('.right td.drop').droppable({
				onDragEnter:function(){
					$(this).addClass('over');
				},
				onDragLeave:function(){
					$(this).removeClass('over');
				},
				onDrop:function(e,source){
					$(this).removeClass('over');
					if ($(source).hasClass('drag1')){
						$(this).append(source);
					} else {
						var c = $(source).clone().addClass('drag1');
						$(this).append(c);
						c.draggable({
							revert:true
						});
					}
				}
			});
		$('#new').linkbutton('disable');
	});
	var alist = new Array();
	function baocun_form()
    {
       //alert(jQuery("#tableList").children("tr").length);
     // alert( jQuery("#tableList").find("tr").length);
        //jQuery("#tableList tr").click(function()
        $('#new').linkbutton('enable');
		var i = 0;
		var j=0;
        jQuery("tr").each(function () {
			i++;
            jQuery(this).children("td,div").each(function() {
                		alist[i*8+j] = jQuery(this).text();
                       // alert(jQuery(this).text());          
               j++;
            });
        });
        console.info(alist);
    }
   
    function sub(){
    alert('<%=labname%>');
  
    	
     	$.ajax({
	 			url:sy.bp()+'/PaikeSubServlet?sub=modify',
	 			async: false,
	 			data:{
	 				culist:alist,
	 				labname:'<%=labname%>',
	 				startDate:'<%=sdate%>',
	 				endDate:'<%=edate%>',
	 				kebiaoname:'<%=kebiaoname%>',
	 				weekPage:<%=curentpage%>
	 				
	 			},
	 			dataType:'json',
	 			type:'POST',
	 			cache:false,
	 			success:function(r){
	 				if(r){
	 					$.messager.show({title:'提示',msg:r.msg});
	 				}else{
	 					$.messager.alert('提示',"新的课表生成失败");
	 				}
	 			}
	 		});
    
    }
	
</script>

  <body>
  <span>该实验室能开放的所有实验</span>
  <hr color="blue"></hr>
   <div id="source" style="border:1px solid #ccc;height:80px;margin:5px;overflow-x:hidden;overflow-y:scroll">
    <%for(int i=0;i<expnamelist.size();i++){ %>
   	 <div id="d1" class="drag"><%=expnamelist.get(i).getExperimentS_name()%></div>
  <%} %>
  </div>
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
								<div id="<%=6*i+jie %>" class="drag1"><%=kecheng.getExperiment_name()%></div>
								</td>
								<% 
							}else{
						
						%><td id="<%=6*i+jie %>" class="drop"></td><%}
					}%></tr><%
					}
				%>
			<tr>
				<td class="blank"></td>
				<%if(curentpage!=1) {%>
				<td class="title" colspan="2"><a href="<%=request.getContextPath() %>/KeBiaoServlet?searchMethod=modify&weekpage=<%=(curentpage-1)%>&cuname=<%=kebiaoname %>">上一周</a></td>
				<%} else{%>
				<td class="title" colspan="2">没有上一周</td>
				<%} %>
				<td></td>
				<td></td>
				<%if(curentpage < maxpage) {%>
				<td class="title" colspan="2"><a href="<%=request.getContextPath() %>/KeBiaoServlet?searchMethod=modify&weekpage=<%=(curentpage+1)%>&cuname=<%=kebiaoname %>">下一周</a></td>
				<%} else{%>
				<td class="title" colspan="2">没有下一周</td>
				<%} %>
			</tr>
			<tr>
			
				<td colspan="5"><a class="easyui-linkbutton" plain="true" iconCls="icon-redo" href="<%=request.getContextPath()%>/jsp/firstadmin/functioin/modifyCourse.jsp">返回课表修改</a></td>
				<td><a class="easyui-linkbutton" onclick="baocun_form();" plain="true" id="save" iconCls="icon-save" >保存修改</a></td>
				<td><a class="easyui-linkbutton" onclick="sub();" plain="true" id="new" iconCls="icon-ok" >生成课表</a></td>
			</tr>
		</table> 
  </div>
  <div id="haha"></div>
  <br/>
  <span>所有老师</span>
  <hr color="blue"></hr>
   <div id="source" style="border:1px solid #ccc;height:80px;margin:5px;overflow-x:hidden;overflow-y:scroll">
    <%for(int i=0;i<teacherList.size();i++){ %>
   	 <div id="d2" class="drag"><%=teacherList.get(i).getTeacher_name()%></div>
  <%} %>
  </div>
</div>
  </body>