<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中南大学自动与控制实验中心</title>
<meta name="author" content="Jquery-School" />
<meta name="Copyright" content="Jquery-School,www.jq-school.com" />
<meta name="keywords" content="Jquery,Jquery资源,前端设计,div+css" />
<meta name="description" content="JquerySchool是一个专门分享jquery资源、插件、特效的一个网站,完全开放源代码,把实际开发中应用最多、最实用的Jquery资源抽取出来再加以精心编排,让广大网友能以最短的时间、花最少的精力去真正掌握jQuery开发的知识。" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="robots" content="index, follow" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css1/reset.css" />
<link rel="stylesheet" media="screen,projection" type="text/css" href="css1/main.css" />
<!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="css/main-msie.css" /><![endif]-->
<link rel="stylesheet" media="screen,projection" type="text/css" href="css1/style.css" />
<link rel="stylesheet" media="print" type="text/css" href="css1/print.css" />
<link rel="stylesheet" media="print" type="text/css" href="css1/header.css" />
<link rel="stylesheet" type="text/css" href="./css1/jquery.slider.css" />
<!--[if IE 6]>
	<link rel="stylesheet" type="text/css" href="./css/jquery.slider.ie6.css" />
<![endif]-->
<style>
img {
	border: none;
}
.slider3 {
	margin-top:50px
}
</style>
<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.2.6/imagejs/jcarousellite_1.0.1.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.2.6/imagejs/jquery.easing.1.1.js"></script>
<script type="text/javascript" src="js/jquery.slider.min.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	$(".mainNav a").mouseover(function(){
		$(".mainNav a").attr("class","");
		$("#"+this.id).attr("class","actived");
		var currentMenuNo = parseInt(this.id.substring(1));
		$(".secondNav div").each(function(){
			$(this).hide();
			$("#subNav"+currentMenuNo).show();
		});
	});
  $("#slider3").slideshow({
    width      : 900,
    height     : 325,
    transition : 'squareRandom'
  });
  $(".auto").jCarouselLite({
		auto: 3000,
		speed: 3000,
		visible: 2
	});
});
</script>
</head>
<style type="text/css">
#content {
	width: 960px;
	
	background-color: #FFFAFA;
}
#left {
	width: 220px;
	float: left;
	margin-right: 10px;
	margin-top:5px;
	border: 1px solid #4397df;
}
#right {
	width: 700px;
	margin-top:5px;
	float: right;
	margin-left: 10px;
	border: 1px solid #6aafdc;
}
#right_inner {
	margin: auto;
	padding: 10px;
	color: #000;
	width: 680px;
}
a {
	color: #000;
	text-decoration: none;
}
a:hover {
	color: #00F;
	font-weight:bold;
}
#left ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}
#left ul li {
	padding: 0px 8px;
	height: 26px;
	line-height: 26px;
	border-bottom: 1px solid #d8d8e8;
	background-color: #e9eef2;
	list-style-position: inside;
	list-style-image: url(design/resultset_next.png);
}
#left ul li:hover {
	padding: 0px 8px;
	height: 26px;
	line-height: 26px;
	border-bottom: 1px solid #CCC;
	background-color: #9C9;
	list-style-position: inside;
	list-style-image: url(design/star.png);
}
#title {
	font-size: 13px;
	font-weight: bold;
	background-color: #4397df;
	text-align: center;
	width: 220px;
	padding-top: 10px;
	padding-bottom: 7px;
	border-bottom-width: 3px;
	border-bottom-style: solid;
	border-bottom-color: #d8d8e8;
}
#title1 {
	font-size: 13px;
	font-weight: bold;
	background-color: #6aafdc;
	text-align: center;
	width: 700px;
	padding-top: 10px;
	padding-bottom: 7px;
	border-bottom-width: 3px;
	border-bottom-style: solid;
	border-bottom-color: #d8d8e8;
}
#right_inner ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}
#right_inner ul li {
	height: 30px;
	line-height: 26px;
	list-style-position: inside;
	list-style-image: url(design/newspaper.png);
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #333333;
	padding-top: 4px;
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 12px;
}
#lian {
	height:30px;
	width:680px;

	margin-bottom:10px;
}
#txt {
	float:right;
	width: 340px;
}
#inner_bottom {
	float: right;
}
#upfooter{
	float:left;
	width: 958px;
	margin-top:2px;
	height: 30px;
	border: 1px solid #6aafdc;
}
#footer {
    float:left;
	width: 960px;
	background-attachment: scroll;
	background-image: url(design/bj.png);
	background-repeat: repeat-x;
	background-position: 0px -34px;
	margin-top:2px;
	height: 55px;
}
#footer h3 {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 12px;
	color: #000;
	text-decoration: none;
	margin: auto;
}
#footer h3 a {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 12px;
	color: #000;
	text-decoration: none;
}
#footer h3 a:hover {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 12px;
	color: #F00;
	text-decoration: none;
}
</style>
<body>
<div id="main">
  <div id="header"> <img src="design/tb.png"  border="0" alt="" /> </div>
  <div class="head">
    <div class="padder">
      <div class="nav">
        <div class="navLaftBg">
          <div class="navRightBg">
            <div class="mainNav"> <a href="${pageContext.request.contextPath}" id="n1" class="actived">首页</a>
             <a href="${pageContext.request.contextPath}/News?method=select&cat=1&page=1" id="n2">新闻中心</a> 
             <a href="${pageContext.request.contextPath}/News?method=select&cat=1&page=1" id="n3">通知/公告</a> 
             <a href="http://www.865171.cn/css-code/" id="n5">资料中心</a>
              <a href="http://www.865171.cn/css-menu/" id="n6">论坛</a> 
              <a href="http://www.865171.cn/css-menu/" id="n7">相关链接</a> 
              <c:if test="${role==null }">
				<a href="/lims/login.jsp" id="n8">登录</a>
			</c:if>
			<c:if test="${teacher!=null }">
  	  			<a href="${pageContext.request.contextPath}/jsp/layout/innerIndex.jsp" id="n8">进入后台</a>
			</c:if>
			<c:if test="${student!=null }">
  	  			<a href="${pageContext.request.contextPath}/jsp/layout/innerIndex.jsp" id="n9">进入后台</a>
			</c:if> 
			 </div>
          </div>
        </div>
      </div>
      <div class="secondNav">
        <div id="subNav1" class="subNav1"> <a href="http://www.865171.cn/icons/ico/" class="actived">信息院首页</a> <a href="http://www.865171.cn/icons/ico/" class="actived">轨道交通安全运行控制与通信研究所首页</a> </div>
        <div id="subNav6" class="subNav6"> <a href="http://www.865171.cn/icons/ico/" class="actived">ICO图标</a> <a href="http://www.865171.cn/icons/gif/">GIF图片</a> <a href="http://www.865171.cn/icons/png/">PNG图标</a> </div>
      </div>
    </div>
  </div>
  <div id="content">
    <div id="left">
      <div id="title">网站地图</div>
      <ul>
        <a href="#">
        <li>新闻中心</li>
        </a> <a href="#">
        <li>通知/公告</li>
        </a> <a href="#">
        <li>资料中心</li>
        </a> <a href="#">
        <li>论坛</li>
        </a>
      </ul>
    </div>
    <div id="right">
      <div id="title1">详细内容</div>
      <div id="right_inner">
          <h2><center>${detailnews.news_title}</center></h2>
                      发布人：${detailnews.teacher_name}   <span style="float:right">  时间：[${detailnews.news_date}]</span><hr>
             <p>${detailnews.new_cont} </p>
      </div>
    </div>
    <div id="left">
      <div id="title">常用链接</div>
      <ul>
        <a href="#">
        <li>中南大学</li>
        </a> <a href="#">
        <li>中南大学铁道学院</li>
        </a> <a href="#">
        <li>中南大学湘雅医学院</li>
        </a> <a href="#">
        <li>教务管理系统</li>
        </a> <a href="#">
        <li>就业指导中心</li>
        </a> <a href="#">
        <li>交通运输学院</li>
        </a> <a href="#">
        <li>信息科学与工程学院</li>
        </a> <a href="#">
        <li>物理科学与工程学院</li>
        </a>
      </ul>
    </div>
  </div>
  <hr class="noscreen" />
  <div id="upfooter">
  	<c:if test="${lastnews!=null }">
        <span style="float:left;margin-top:5px"><a href="${pageContext.request.contextPath}/News?method=selectDetail&newsId=${lastnews.id}">上一篇：${lastnews.news_title}</a></span>
        </c:if>
        <c:if test="${nextnews!=null }">
        <span style="float:right;margin-top:5px"><a href="${pageContext.request.contextPath}/News?method=selectDetail&newsId=${nextnews.id}" >下一篇：${nextnews.news_title}</a></span>
        </c:if>
  </div>
  <div id="footer">
    <center>
      <h3>Copyright &copy;&nbsp;2012 <strong><a href="http://www.865171.cn/">中南大学轨道交通安全运行控制与通信研究所</a></strong>, All Rights Reserved &reg;</h3>
    </center>
    <center>
      <h3>地址：中南大学铁道学院电子楼</h3>
    </center>
  </div>
</div>
</body>
</html>
