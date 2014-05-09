<%@ page language="java" import="java.util.*,com.lims.dao.CurseDao,com.lims.bean.KechengBiao,com.lims.tools.PaikeService" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<jsp:include page="../../../commonTop.jsp"></jsp:include>  
  </head>
  <script type="text/javascript" charset="utf-8">

	$(function(){
		$('.drag').draggable({
			proxy:'clone',
			revert:true,
			cursor:'auto',
			onStartDrag:function(){
				$(this).draggable('option').cursor='auto';
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
					if ($(source).hasClass('assigned')){
						$(this).append(source);
					} else {
						var c = $(source).clone().addClass('assigned');
						$(this).append(c);
						c.draggable({
							revert:true
						});
					}
				}
			});
	})
	
	
</script>
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
</style>
<% 
	PaikeService pk = new PaikeService();
	List<KechengBiao> alist = (List)request.getAttribute("alist");

	int curentpage = alist.get(0).getWeekpage();
	int maxpage =(Integer)request.getAttribute("maxpage");
	System.out.println("maxpage======"+maxpage);
	
	System.out.println("maxpage="+maxpage);
	String kebiaoname =(String)request.getAttribute("kebiaoname");
%>
  <body>
  <div id="source" style="border:1px solid #ccc;height:160px;margin:5px;overflow-x:hidden;overflow-y:scroll">
    <div id="d1" class="drag">基于以太网简单控制系统简单控制系统
    	<div sytle:"background:#e3e3e2;">长老手</div>
    </div>
     <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
     <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
     <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
     <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div>
     <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div> <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div>
    <div id="d2" class="drag">Drag 2</div>
    <div id="d3" class="drag">Drag 3</div>
    <div id="d1" class="drag">基于以太网简单控制系统</div>
   
 
  </div>
  <div id="target" class="right" style="border:1px solid #ccc;height:500px;margin:5px;">
  <table align="center">
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
						 if(kecheng !=null){System.out.println("每次都到这里？？？？"+i);
								%>
								<td class="drop">
								<div id="<%=6*i+jie %>" class="drag"><%=kecheng.getExperiment_name() %></div>
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
				<td class="title" colspan="2"><a href="<%=request.getContextPath() %>/KeBiaoServlet?weekpage=<%=(curentpage-1)%>&cuname=<%=kebiaoname %>">上一周</a></td>
				<%} else{%>
				<td class="title" colspan="2">没有上一周</td>
				<%} %>
				<td></td>
				<td></td>
				<%if(curentpage < maxpage) {%>
				<td class="title" colspan="2"><a href="<%=request.getContextPath() %>/KeBiaoServlet?weekpage=<%=(curentpage+1)%>&cuname=<%=kebiaoname %>" ">下一周</a></td>
				<%} else{%>
				<td class="title" colspan="2">没有下一周</td>
				<%} %>
			</tr>
		</table> 
  </div>
</div>
  </body>