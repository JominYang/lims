<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<jsp:include page="../../inc/meta.jsp"></jsp:include>
	<jsp:include page="../../inc/easyui.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="../../css/baseCss.css"></link>
	<script type="text/javascript">
		$(function(){
			$('#editProfileButton').click(function(){
				$('#showProfile').addClass("display-none");
				$('#editProfile').removeClass("display-none");
			});
		});
	</script>
  </head>
  
  <body style="background-color: #EDF4F1;">
  	<center>
  		<div id="showProfile" style="width: 600px;">  
    	<h3 align="left" style="margin-left: 20px;">个人信息</h3>
  		<hr/>
  		<c:if test="${!empty teacher }">
    			<table>
					<tr>
						<td align="right" width="100px">教工号:</td>
						<td name="t_num" width="200px">${teacher.teacher_num }</td>
						<td align="right" width="100px">联系方式:</td>
						<td name="t_phone" width="200px">${teacher.teacher_phone }</td>
					</tr>
					<tr>
						<td align="right">教师姓名:</td>
						<td name="t_name">${teacher.teacher_name }</td>
						<td align="right">简介:</td>
						<td name="t_intro" rowspan="10">${teacher.teacher_introduction }</td>
					</tr>
					<tr>
						<td align="right">性别:</td>
						<td name="t_sex">${teacher.teacher_sex }</td>
						
					</tr>
					<tr>
						<td align="right">学位:</td>
						<td name="t_degree">${teacher.teacher_degree }</td>
					</tr>
					<tr>
						<td align="right">职称:</td>
						<td name="t_title">${teacher.teacher_titles }</td>
					</tr>
					<tr>
						<td align="right">学院:</td>
						<td name="t_col">${teacher.college_name }</td>
					</tr>
					<tr>
						<td align="right">专业:</td>
						<td name="t_major">${teacher.major_name }</td>
					</tr>
					<tr>
						<td align="right">电子邮箱:</td>
						<td name="t_email">${teacher.teacher_email }</td></tr>
				</table>
				</c:if>
				<c:if test="${!empty student }">
					
				</c:if>
				<br/>
			<hr/>
			<input id="editProfileButton" type="button" value="编辑信息" style="margin-right: 30px; float: right;"/>
		</div> 
		</center>
		
		<center>
		<div id="editProfile" style="width: 600px;" class="display-none">
			<h3 align="left" style="margin-left: 20px;">编辑信息</h3>
  			<hr/> 
  			<c:if test="${!empty teacher }">
    		<form method="post" action="${pageContext.request.contextPath }/teacherMsg?method=editMy">
    			<table>
					<tr>
						<td align="right" width="100px">教工号:</td>
						<td name="teacher_num" width="200px">${teacher.teacher_num }<input type="hidden" name="teacher_num" value="${teacher.teacher_num }" style="width: 200px;" /></td>
						<td align="right" width="100px">联系方式</td>
						<td><input name="teacher_phone" value="${teacher.teacher_phone }" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">教师姓名</td>
						<td><input name="teacher_name" value="${teacher.teacher_name }" style="width: 200px;" /></td>
						<td align="right">简介</td>
						<td rowspan="10"><textarea value="${teacher.teacher_introduction }" cols="21" rows="10" name="teacher_introduction"></textarea></td>
					</tr>
					<tr>
						<td align="right">性别</td>
						<td>
							<select name="teacher_sex" style="width: 200px;">
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">学位</td>
						<td><input name="teacher_degree" value="${teacher.teacher_degree }" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">职称</td>
						<td><input name="teacher_titles" value="${teacher.teacher_titles }" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">学院</td>
						<td><input name="college_name" value="${teacher.college_name }" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">专业</td>
						<td><input name="major_name" value="${teacher.major_name }" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">电子邮箱</td>
						<td><input name="teacher_email" value="${teacher.teacher_email }" style="width: 200px;" /></td>
					</tr>
				</table>
				</c:if>
				<c:if test="${!empty student }">
					
				</c:if>
				<br/>
			<hr/>
			<input id="updateProfileButton" type="submit" value="更新信息" style="margin-right: 30px; float: right;"/>
    		</form>
		</div></center>
		
  </body>
</html>
