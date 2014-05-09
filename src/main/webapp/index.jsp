<%@ page language="java" import="java.util.*,com.lims.dao.NewsDao,com.lims.bean.News" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
#footer {
	width: 960px;
	background-attachment: scroll;
	background-image: url(design/bj.png);
	background-repeat: repeat-x;
	background-position: 0px -34px;
	margin-top:-5px;
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
<script type="text/javascript" src="js/jquery-easyui-1.2.6/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.2.6/imagejs/jcarousellite_1.0.1.min.js"></script>
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
    height     : 295,
    transition : 'squareRandom'
  });
  $(".auto").jCarouselLite({
		auto: 1000,
		speed: 1000,
		visible: 8
	});
});
</script>
<%
		NewsDao newsdao = new NewsDao();
		ArrayList<News> alist = newsdao.getNews();
		ArrayList<News> alist1 = newsdao.getNote();
		ArrayList<News> alist2 = newsdao.getZiliao();
		if(alist !=null){
			request.setAttribute("newsList", alist);
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		if(alist1!=null){
			request.setAttribute("newsList1", alist1);
		}
		if(alist2!=null){
			request.setAttribute("newsList2", alist2);
		}
%>
</head>
<style type="text/css"></style>
<body>
<div id="main">
  <div id="header"> <img src="design/tb.png"  border="0" alt="" /> </div>
  <div class="head">
    <div class="padder">
      <div class="nav">
        <div class="navLaftBg">
          <div class="navRightBg">
            <div class="mainNav"> 
            <a href="${pageContext.request.contextPath}" id="n1" class="actived">首页</a> 
            <a href="${pageContext.request.contextPath}/News?method=select&cat=1&page=1" id="n2">新闻中心</a>
             <a href="${pageContext.request.contextPath}/News?method=select&cat=2&page=1" id="n3">通知/公告</a>
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
  <div id="col-top"></div>
  <div id="col" class="box">
    <div id="ribbon"></div>
    <center>
      <div id="slider3">
        <div> <img src="images/templatemo_content_top.jpg" alt=""/> </div>
        <div> <img src="images/slide002.jpg" alt=""/> </div>
        <div> <img src="images/templatemo_content_top.jpg" alt=""/> </div>
        <div> <img src="images/slide002.jpg" alt=""/> </div>
      </div>
    </center>
  </div>
  <div id="col-bottom"></div>
  <hr class="noscreen" />
  <div id="cols3-top"></div>
  <div id="cols3" class="box">
    <div class="col">
      <h3><a href="http://www.865171.cn/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新闻中心</a></h3>
      <div class="col-text">
        <ul class="ul-01">
           <c:forEach begin="0" end="6" items="${newsList}" var="news">
          <li><a href="${pageContext.request.contextPath}/News?method=selectDetail&newsId=${news.id}">${news.news_title}</a><span style="float:right">[${news.news_date}]</span></li>
         </c:forEach>
         
        </ul>
      </div>
      <div class="col-more"><a href="http://www.865171.cn/"><img src="design/cols3-more2.png" alt="" /></a></div>
    </div>
    <hr class="noscreen" />
    <div class="col">
      <h3><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通知/公告</a></h3>
      <div class="col-text">
        <ul class="ul-01">
  
        <c:forEach begin="0" end="6" items="${newsList1}" var="news">
          <li><a href="${pageContext.request.contextPath}/News?method=selectDetail&newsId=${news.id}">${news.news_title}</a><span style="float:right">[${news.news_date}]</span></li>
         </c:forEach>
         
        </ul>
      </div>
      <div class="col-more"><a href="http://www.865171.cn/"><img src="design/cols3-more2.png" alt="" /></a></div>
    </div>
    <hr class="noscreen" />
    <div class="col last">
      <h3><a href="http://www.865171.cn/">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;资料中心</a></h3>
      <div class="col-text">
        <ul class="ul-01">
         <c:forEach begin="0" end="6" items="${newsList2}" var="news">
          <li><a href="${pageContext.request.contextPath}/DetailsNewsServlet?newsId=${news.id}">${news.news_title}&hellip;</a><span style="float:right">[${news.news_datetime}]</span></li>
         </c:forEach>
        
        </ul>
      </div>
      <div class="col-more"><a href="#"><img src="design/cols3-more2.png" alt=""/></a></div>
    </div>
    <hr class="noscreen" />
  </div>
  <div id="cols3-bottom"></div>
  <div id="cols2-top"></div>
  <div id="cols2" class="box">
    <div id="col-left">
      <div class="title">
        <h4>实验室动态</h4>
      </div>
      <ul class="ul-list nomb">
        
        <li><span class="f-right"><a href="http://www.865171.cn/" class="ico-comment">已选17人</a></span> <span class="date">27.09.2008</span> <a href="http://www.865171.cn/" class="article">液位控制即将上课</a></li>
        
      </ul>
    </div>
    <hr class="noscreen" />
    <div id="col-right">
      <h4><span>实验室简介</span></h4>
      <div class="box">
        <p>先进控制与智能自动化湖南省工程实验室以我校信息科学与工程学院为牵头单位组建，负责人为吴敏教授。实验室主要围绕提高我国制造业的信息化、自动化水平与产品附加值的问题，开展高端自动化系统...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">更多</a><p>
      </div>
    </div>
  </div>
  <div id="cols2-bottom"></div>
  <div class="auto">
    <ul>
      <li><img src="images/1.jpg" alt="" width="120" height="120" ></li>
      <li><img src="images/2.jpg" alt=""  width="120" height="120" ></li>
      <li><img src="images/3.jpg" alt=""  width="120" height="120" ></li>
      <li><img src="images/4.jpg" alt="" width="120" height="120" ></li>
      <li><img src="images/1.jpg" alt="" width="120" height="120" ></li>
      <li><img src="images/5.jpg" alt=""  width="120" height="120" ></li>
      <li><img src="images/6.jpg" alt=""  width="120" height="120" ></li>
      <li><img src="images/7.jpg" alt="" width="120" height="120" ></li>
    </ul>
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
