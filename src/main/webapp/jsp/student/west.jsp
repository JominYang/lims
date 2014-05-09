<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style type="text/css">
	a { color: #000; text-decoration: none; }
	a:hover { color: #F00; }
	.menuList { width: 100px; border: 1px solid #CCC; }
	.menuList ul { list-style: none; margin: 0px; padding: 0px; }
	.menuList ul li { background: #eefef0; padding: 0px 8px; height: 26px; line-height: 26px; border-bottom: 1px solid #CCC; } 
	.menuList ul li:hover {background: #afeeee;}
	.menuList ul li div {
		padding-left: 50px;
	}
</style>
<script type="text/javascript" charset="utf-8">
	var tree;
	var menuPanel;
	$(function() {
		menuPanel = $('#menuPanel').panel({
			tools : [ {
				iconCls : 'icon-reload',
				handler : function() {
					tree.tree('reload');
				}
			}, {
				iconCls : 'icon-redo',
				handler : function() {
					var node = tree.tree('getSelected');
					if (node) {
						tree.tree('expandAll', node.target);
					} else {
						tree.tree('expandAll');
					}
				}
			}, {
				iconCls : 'icon-undo',
				handler : function() {
					var node = tree.tree('getSelected');
					if (node) {
						tree.tree('collapseAll', node.target);
					} else {
						tree.tree('collapseAll');
					}
				}
			} ]
		});

		tree = $('#menu').tree({
			url : sy.bp()+'/jsp/student/student_tree.json',
			//url:sy.bp()+'/MenuServlet',
			lines : true,
			onClick : function(node) {
				addTab(node);
			},
			onDblClick : function(node) {
				if (node.state == 'closed') {
					$(this).tree('expand', node.target);
				} else {
					$(this).tree('collapse', node.target);
				}
			}
		});
	});
</script>
<div class="easyui-accordion" fit="true" border="false">
	
	<div class="menuList" iconCls="icon-export" title="&nbsp;&nbsp;&nbsp;资源中心">
		<ul>
			<li><div><a href="javascript:void(0);" onclick="addTab({text : '资源下载',attributes : {url : '../common/downloadfile.jsp'}});"><span>资源下载</span></a></div></li>
		</ul>
	</div>
	<div class="menuList" iconCls="icon-export" title="&nbsp;&nbsp;&nbsp;选课中心">
		<ul>
			<li><div><a href="javascript:void(0);" onclick="addTab({text : '学生选课',attributes : {url : '/lims/jsp/student/studentsXK.jsp'}});"><span>学生选课</span></a></div></li>
		</ul>
	</div>
	<div class="menuList" iconCls="icon-export" title="&nbsp;&nbsp;&nbsp;成绩中心">
		<ul>
			<li><div><a href="javascript:void(0);" onclick="addTab({text : '查看成绩',attributes : {url : '/lims/jsp/student/studentsXK.jsp'}});"><span>查看成绩</span></a></div></li>
		</ul>
	</div>
	<div class="menuList" iconCls="icon-export" title="&nbsp;&nbsp;&nbsp;我的课表">
		<ul>
			<li><div><a href="javascript:void(0);" onclick="addTab({text : '查看课表',attributes : {url : '/lims/jsp/student/stuCourse.jsp'}});"><span>查看课表</span></a></div></li>
		</ul>
	</div>
	<div class="menuList" iconCls="icon-export" title="&nbsp;&nbsp;&nbsp;邮件服务">
		<ul>
			<li><div><a href="javascript:void(0);" onclick="addTab({text : '发送邮件',attributes : {url : 'http://mail.sina.com.cn/'}});"><span>发送邮件</span></a></div></li>
		</ul>
	</div>
	<div iconCls="icon-export" title="&nbsp;&nbsp;&nbsp;在线用户" href="./onlineuser.jsp">
	</div>
	<div iconCls="icon-export" title="&nbsp;&nbsp;&nbsp;日历" href="./calendar.jsp" style="padding-bottom: 20px;" selected="true"></div>
	
</div>