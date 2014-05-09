<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addNews.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
   <script type="text/javascript" src="/lims/ckeditor/ckeditor.js"></script>
  <style type="text/css">
  	#table{
		border="1px";
		margin-top=0px;
	}
	#table td{
		width:880PX;
		font-family: "微软雅黑";
		font-size: 12px;
		cellpadding:5px;
  
	}
  </style>
  <body> 
  <center>
  <form action="/lims/AddNewsServlet" method="post"> <br><br>
  <table  id="table" border="0" bordercolor="#123456"   cellspacing="0" cellpadding="6px">
  <tr>
  <td colspan="2" ><strong>标题：</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="title" size="50" name="title" ></input></td>
  </tr>
  <tr>
  <td colspan="2" "><strong>选择分类：</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <select  name="leibie" >
  <option value="1">最新新闻</option>
  <option value="2">通知/公告</option>
  </select></td>
  </tr>
  <tr>
  <td colspan="2"><strong>新闻/通告正文：</strong>(由于该编辑器功能不完善，建议用DreamWeaver布局好页面，再在浏览器中打开，复制内容粘贴在编辑框内，或从其他网站复制内容，粘贴)</td>
  </tr>
  <tr>
   <td colspan="2"><textarea rows="40" cols="50" name="editor01"></textarea></td>
   <tr>
   <script type="text/javascript">
   CKEDITOR.replace('editor01',
{
toolbar :
[
['Source','-','NewPage'],
['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
'/',
['Link','Unlink','Anchor'],
    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
    ,
['Styles','Format','Font','FontSize'],
['TextColor','BGColor'],
['Maximize', 'ShowBlocks']
], uiColor : '#86caff'
});
</script>
   <tr>
   <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>发布时间：</strong>(系统将自动获取发布时的时间)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<strong>发布者：</strong>(系统将自动获取)</td>
   </tr>
   <tr>
   <td colspan="2" align="center"><input type="submit" value="提交"/></td>
   </tr>
   </table>
   </form>
   </center>
  </body>
</html>
