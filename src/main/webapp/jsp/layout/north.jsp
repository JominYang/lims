<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	#top{
		height:70px;
		background-image: url(/lims/img/xinxi2.jpg);
		background-repeat: repeat-x;
		background-position: 0px 0px;
	}
	#layout_north_zxMenu{
		margin-right:40px;
	}
</style>
<script type="text/javascript" charset="UTF-8">
	var changePwdWindow;
	function logout(b) {
		$.post(sy.bp()+'/logout', function() {
			if (b) {
				//清楚缓存和session，退到主页
				if (sy.isLessThanIe8()) {
					loginAndRegDialog.dialog('open');
				} else {
					location.replace(sy.bp()+'/index.jsp');
				}
			} else {
				//清除缓存和session，退到登录界面
				location.replace(sy.bp()+'/login.jsp');
			}
		});
	}

	function userInfo() {
		addTab({
			text : '个人信息',
			attributes : {   
            	url : '../common/profile.jsp' 
            	}
		});
	}
	function index(){
		window.location.href=sy.bp();
	}
	function editPwd(){
		changePwdWindow = $('<div/>').window({
			modal : true,
			title : '修改密码',
			width : 350,
			height : 200,
			collapsible : false,
			minimizable : false,
			maximizable : false,
			href : '../common/editpwd.jsp',
			onClose : function() {
				$(this).window('destroy');
			}
		});
	}
	
</script>
<div id="top">
<div  style="position: absolute; right: 160px; bottom: 0px; color: red; font-size: 13px;">
	欢迎您:
	<a href="javascript:void(0);" class="easyui-menubutton" menu="#layout_north_zxMenu" iconCls="icon-user" style="font-size: 13px;"><c:if test="${!empty teacher }">${teacher.teacher_name }</c:if><c:if test="${!empty student }">${student.stu_name }</c:if></a><c:if test="${!empty teacher }">老师</c:if><c:if test="${!empty student }">学生</c:if>
</div>
<div id="layout_north_zxMenu" style="width: 100px; display: none;">
	<div onclick="userInfo();" style="font-size: 13px;">个人信息</div>
	<div onclick="editPwd();" style="font-size: 13px;">修改密码</div>
	<div class="menu-sep"></div>
	<div onclick="index();" style="font-size: 13px;">回到前台</div>
	<div onclick="logout();" style="font-size: 13px;">重新登录</div>
	<div onclick="logout(true)" style="font-size: 13px;">退出系统</div>
</div>
</div>