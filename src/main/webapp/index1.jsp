<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>

	<body>
	<center><h1>这是主页</h1></center>
	<hr/>
	<c:if test="${role==null }">
		<a href="${pageContext.request.contextPath}/login.jsp" style="float: right;">登录</a>
	</c:if>
	<c:if test="${teacher!=null }">
	<div align="right">
		欢迎您：${teacher.teacher_name } 老师   
  	  	<a href="${pageContext.request.contextPath}/logout">注销</a></div>
	</c:if>
	<c:if test="${student!=null }">
	<div align="right">
		欢迎你：${student.sname } 学生   
  	  	<a href="${pageContext.request.contextPath}/login.do?method=logout">注销</a></div>
	</c:if>
	</body>
</html>
