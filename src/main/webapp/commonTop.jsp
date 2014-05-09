<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript"  src="/lims/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript"   src="/lims/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css"    href="/lims/js/jquery-easyui-1.2.6/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css"  href="/lims/js/jquery-easyui-1.2.6/themes/icon.css" /></link>
<script type="text/javascript"   src="/lims/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/lims/js/jquery.cookie.js"></script>
<script type="text/javascript"   src="/lims/js/syUtils.js"></script>
