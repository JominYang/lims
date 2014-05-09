<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/layout.css" />
    
	<title>WFmanager</title>
  	<link rel="stylesheet" href="css/LoginPage.css">
	<link rel="stylesheet" href="css/Tour.css">
	<link rel="stylesheet" href="css/LoginForm.css">
	<script src="js/jquery-easyui-1.2.6/jquery-1.7.2.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
  	function reload(img){
  		img.src = img.src + "?" + new Date().getTime();
  	}
  </script>

<body>
	<div class="logo-bar">
			<span>中南大学</span><h2>信息与控制综合基础实验教学中心（后台登陆）</h2>
		
      	</div>
  
  
  
		<div id="container-boundingbox" class="wrapper">
      		<div id="container" class="wrapper">
        		<div class="LoginPage">
					<div class="page-header">
    					<h1></h1>
    				</div>
					<div id="left-main">
						
					</div>
	
	
					<div class="column11">
						<div class="LoginForm">
							<div class="callout-box" style="height:400px">
							
								<div class="reg-header">
								<br><br>
								<br>
							
									<h3><strong>请登录</strong></h3><br>
								</div>
								<div class="signin">
									<form id="login_form" name="login_form" action="<%=request.getContextPath()%>/login" method="post">
										<div>&nbsp;&nbsp;<strong>帐号：</strong><input name="usernum" class="text" type="text" placeholder="学号／教工号"/></div>
										<div>&nbsp;&nbsp;<strong>密码：</strong><input name="password" class="text" type="password"/></div>
										<div style="height: 45px;">&nbsp;&nbsp;<strong>验证码：</strong><input name="code" class="text" type="text" style="width: 80px;"/>
											<div style="float: right;width: 110px;"><img src="<%=request.getContextPath()%>/CodeServlet" height="33px;" width="80px;" cursor="pointer" onclick="reload(this)" title="换一张" /></div></div>
										<div style="margin-bottom: 20px;margin-top: 5px;">&nbsp;&nbsp;<strong>角色：</strong>&nbsp;
											<input type="radio" name="role" value="student">学生</input>
											<input type="radio" name="role" value="teacher">教师</input></div>
										
										
										<div align="center">
											<input name="login" value="登录" class="super-emphasize" type="submit"/>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="shadow wrapper">
  			<img width="1000" src="img/curved-drop-shadow.png" />
		</div>

		<div class="footer wrapper" style="margin-top: 10px;">
			<span sytle="font-family: Tahoma, Geneva, sans-serif;font-size: 12px;">Copyright © 2012 中南大学信息与控制综合基础实验教学中心</span><br/>
			<div style="font-family: Tahoma, Geneva, sans-serif;font-size: 12px,margin-top: 10px;"><span>有问题联系:xxx@mail.csu.edu.cn</span></div>
		</div>
</body>
</html>
