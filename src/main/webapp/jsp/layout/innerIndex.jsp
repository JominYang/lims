<%@ page language="java" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>CSULAB</title>
    <jsp:include page="../../inc/meta.jsp"></jsp:include>
	<jsp:include page="../../inc/easyui.jsp"></jsp:include>
  </head>
  
  <body>
    <body id="indexLayout" class="easyui-layout" fit="true">
	<div region="north" href="north.jsp" style="height:70px;overflow: hidden;" border="false"></div>
	<div region="west" href="<%=request.getContextPath() %>/outWest" title="导航菜单" split="false" style="width:200px;overflow: hidden;"></div>
	<div region="center" href="center.jsp" title="" style="overflow: hidden;"></div>
	<div region="south" href="south.jsp" style="height:30px;overflow: hidden;" border="false"></div>
  </body>
</html>
