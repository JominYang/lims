<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<jsp:include page="../../inc/meta.jsp"></jsp:include>
		<jsp:include page="../../inc/easyui.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="../../css/baseCss.css"></link>
	</head>
	
	<script type="text/javascript">
		sy.ns('admin.teacher');
		admin.teacher.editRow = undefined;
		$(function(){
			
			//数据表格
			admin.teacher.datagrid=$('#admin_teacher_datagrid').datagrid({
				url : sy.bp()+'/teacherMsg?method=get',
				pagination : true,
				pageSize : 10,
				pageList : [10,20,30,40,50],
				fit : true,
				fitColumns : true,
				nowrap : false,
				border : false,
				idField : 'id',
				sortName : 'teacher_num',
				sortOrder : 'asc',
				columns : [[{
					title : '',
					field : 'id',
					checkbox : true
				},{
					title : '教工号',
					field : 'teacher_num',
					width : 120,
					align : 'center'
				},{
					title : '教师姓名',
					field : 'teacher_name',
					width : 80,
					align : 'center'
				},{
					title : '职称',
					field : 'teacher_titles',
					width : 60,
					align : 'center'
				},{
					title : '专业',
					field : 'major_name',
					width : 200,
					align : 'center'
				},{
					title : '电话',
					field : 'teacher_phone',
					width : 180,
					align : 'center'
				},{
					title : '邮箱',
					field : 'teacher_email',
					width : 180,
					align : 'center'
				},{
					title : '查看详细',
					field : 'password',
					width : 100,
					align : 'center',
					formatter : function(value, rowData, rowIndex) {
						return '<span style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span><a href="javascript:void(0);" onclick="admin.teacher.showSinger(' + rowIndex + ');">查看</a>';
					}
				}]],
				toolbar : ['-',{
					text : '增加',
					iconCls : 'icon-add',
					handler : function(){
						admin.teacher.addDialog.dialog('open');
						}
				},'-',{
					text : '删除',
					iconCls : 'icon-remove',
					handler : function(){
						var rows = admin.teacher.datagrid.datagrid('getSelections');
						if(rows.length > 0) {
							$.messager.confirm('请确认','您确定要删除所选条目吗？',function(b){
								if(b){
									var ids = [];
									for(var i=0;i<rows.length;i++){
										ids.push(rows[i].id);
									}
									$.ajax({
										url : sy.bp()+'/teacherMsg?method=del',
										data : {
											ids : ids.join(',')
										},
										dataType : 'json',
										success : function(r){
											admin.teacher.datagrid.datagrid('load'),
											admin.teacher.datagrid.datagrid('unselectAll'),
											$.messager.show({
												title : '提示',
												msg : '删除成功！'
											});
										}
									});
								}
							});
						}else {
							$.messager.alert('提示','请选择要删除的记录！','warning');
						}
					}
				},'-',{
					text : '修改',
					iconCls : 'icon-edit',
					handler : function(){
						edit();
					}
				},'-',{
					text : '取消',
					iconCls : "icon-undo",
					handler : function(){
						admin.teacher.editRow = undefined;
						admin.teacher.datagrid.datagrid('rejectChanges');
						admin.teacher.datagrid.datagrid('unselectAll');
					}
				},'-'],
				onAfterEdit : function(rowIndex,rowData,changes){
					var inserted = sy.admin.user.datagrid.datagrid('getChanges','inserted');
					var updated = sy.admin.user.datagrid.datagrid('getChanges','updated');
					var url = '';
					if(inserted.length > 0) {
						url = sy.bp()+'/teacherMsg?method=add';
					}
					if(updated.length > 0) {
						url = sy.bp()+'';
					}
					$.ajax({
						url : url,
						data : rowData,
						dataType : 'json',
						success : function(r) {
							if(r && r.success){
								sy.admin.user.datagrid.datagrid('acceptChanges');
								$.messager.show({
									msg : r.msg,
									title : '成功'
								});
							}else{
								sy.admin.user.datagrid.datagrid('rejectChanges');
								$.messager.alert('错误',r.msg,'error');
							}
							sy.admin.user.editRow = undefined;
							sy.admin.user.datagrid.datagrid('unselectAll');
						}
					});
				}
			});
			
			//注册表单
			admin.teacher.addForm = $('#admin_teacher_addForm').form({
					url : sy.bp()+'/teacherMsg?method=add', 
					success : function(r){
						var d = $.parseJSON(r);
						if(d.success){
							admin.teacher.addDialog.dialog('close');
							admin.teacher.datagrid.datagrid('load');
						}else{
							admin.teacher.addForm.find('input[name=teacher_num]').val('');
							admin.teacher.addForm.find('input[name=teacher_num]').focus();
						}
						$.messager.show({
								msg : d.msg,
								title : '提示'
							});
					}
				}
			);
			//注册dialog
			admin.teacher.addDialog = $('#admin_teacher_addDialog').show().dialog({
						title : '增加教师',
						iconCls : 'icon-add',
 						modal:true,
 						closed : true,
 						width : 640,
 						buttons : [{
 							text : '保存',
 							iconCls : 'icon-save',
 							plain : true,
 							handler : function(){
 								admin.teacher.addForm.submit();
 							}
 						},{
 							text : '重写',
 							iconCls : 'icon-undo',
 							plain : true,
 							handler : function(){
 								admin.teacher.addForm.find('input').val('');
 								admin.teacher.addForm.find('textarea').val('');
 							}
 						}],
 						onOpen : function() {
							setTimeout(function() {
								admin.teacher.addForm.find('input[name=teacher_num]').focus();
							}, 1);
						},
						onClose : function() {
								admin.teacher.addForm.find('input').val('');
						} 
					}); 
			
			//修改表单
			admin.teacher.editForm = $('#admin_teacher_editForm').form({
				url : sy.bp()+'/teacherMsg?method=edit', 
				success : function(r){
					var d = $.parseJSON(r);
					if(d.success){
						admin.teacher.addDialog.dialog('close');
						admin.teacher.datagrid.datagrid('load');
					}else{
						admin.teacher.addForm.find('input[name=teacher_num]').val('');
						admin.teacher.addForm.find('input[name=teacher_num]').focus();
					}
					$.messager.show({
							msg : d.msg,
							title : '提示'
						});
					}
				}
			);
			
			//修改dialog
			admin.teacher.editDialog = $('#admin_teacher_editDialog').show().dialog({
						title : '修改教师',
						iconCls : 'icon-edit',
 						modal:true,
 						closed : true,
 						width : 640,
 						buttons : [{
 							text : '保存',
 							iconCls : 'icon-save',
 							plain : true,
 							handler : function(){
 									admin.teacher.editForm.submit();
 							}
 						},{
 							text : '重写',
 							iconCls : 'icon-undo',
 							plain : true,
 							handler : function(){
 								admin.teacher.addForm.find('input').val('');
 								admin.teacher.addForm.find('textarea').val('');
 							}
 						}],
 						onOpen : function() {
							setTimeout(function() {
								admin.teacher.addForm.find('input[name=teacher_num]').focus();
							}, 1);
						},
						onClose : function() {
								admin.teacher.addForm.find('input').val('');
						} 
					});
			admin.teacher.showDialog = $('#admin_teacher_showDialog').show().dialog({
				title : '详细信息',
				modal : true
			}).dialog('close');
			
			function edit() {
				var rows = admin.teacher.datagrid.datagrid('getSelections');
				if(rows.length == 1) {
					$.messager.progress({
						text : 'progressing...',
						intervar : 100
					});
					$.ajax({
						url : sy.bp()+'/teacherMsg?method=getSinger',
						data : {
							teacher_num : rows[0].teacher_num
						},
						dataType : 'json',
						cache : false,
						success : function(r) {
							admin.teacher.editForm.form('load',r);
							admin.teacher.editDialog.dialog('open');
							$.messager.progress('close');
						}
					});
				} else {
					$.messager.alert('提示', '请选择一项要编辑的记录！', 'error');
				}
			}
			//查看详情
			admin.teacher.showSinger = function(index) {
				var rows = admin.teacher.datagrid.datagrid('getRows');
				var row = rows[index];
				$.messager.progress({
					text : 'progressing...',
					interval : 100
				});
				$.ajax({
					url : sy.bp()+'/teacherMsg?method=getSinger',
					data : {
						teacher_num : row.teacher_num
					},
					dataType : 'json',
					cache : false,
					success : function(response) {
						if (response) {
							admin.teacher.showDialog.find('td[name=t_num]').html(response.teacher_num);
							admin.teacher.showDialog.find('td[name=t_name]').html(response.teacher_name);
							admin.teacher.showDialog.find('td[name=t_col]').html(response.college_name);
							admin.teacher.showDialog.find('td[name=t_sex]').html(response.teacher_sex);
							admin.teacher.showDialog.find('td[name=t_degree]').html(response.teacher_degree);
							admin.teacher.showDialog.find('td[name=t_title]').html(response.teacher_titles);
							admin.teacher.showDialog.find('td[name=t_major]').html(response.major_name);
							admin.teacher.showDialog.find('td[name=t_permission]').html(response.teacher_state);
							admin.teacher.showDialog.find('td[name=t_phone]').html(response.teacher_phone);
							admin.teacher.showDialog.find('td[name=t_email]').html(response.teacher_email);
							admin.teacher.showDialog.find('td[name=t_intro]').html(response.teacher_introduction);
							
							admin.teacher.showDialog.dialog('open');
						}
						$.messager.progress('close');
					}
				});
				admin.teacher.datagrid.datagrid('unselectAll');
				
			}
			admin.teacher.cleanAdd = function(){
				//$('#admin_teacher_addForm').find('input[name=tno]').val('');
			};
			admin.teacher.saveAdd = function(){
				
			};
		});
	</script>

	<body class="easyui-layout" fit="true" border="false">
		<div region="north" title="查询条件" split="true" style="height: 100px;overflow: hidden;">
			<form action="">
				<table class="tableForm datagrid-toolbar"
						style="width: 100%; height: 100%;">
						<tr>
							<td align="right">姓名</td>
							<td><input name="teacher_name" style="width: 335px;" />
							</td>
						</tr>
						<tr>
							<td align="right">专业</td>
							<td><input name="major_name" style="width: 335px;" />
							<a href="javascript:void(0);" class="easyui-linkbutton"
									onclick="sy.admin.user.search();">查询</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									onclick="sy.admin.user.cleanSearch();">清空</a></td>
						</tr>
					</table>
			</form>
		</div>
		<div region="center" title="教师信息" border="false">
			<form id="admin_teacher_datagrid"></form>
		</div>
		
		<div id="admin_teacher_addDialog" >  
    		<form id="admin_teacher_addForm" method="post">
    			<table class="tableForm datagrid-toolbar">
					<tr>
						<td align="right">教工号</td>
						<td><input name="teacher_num" style="width: 200px;" /></td>
						<td align="right">联系方式</td>
						<td><input name="teacher_phone" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">教师姓名</td>
						<td><input name="teacher_name" style="width: 200px;" /></td>
						<td align="right">电子邮箱</td>
						<td><input name="teacher_email" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">密码</td>
						<td><input name="password" style="width: 200px;" /></td>
						<td align="right">简介</td>
						<td rowspan="10"><textarea cols="21" rows="10" name="teacher_introduction"></textarea></td>
					</tr>
					<tr>
						<td align="right">重复密码</td>
						<td><input name="repassword" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">性别</td>
						<td><input name="teacher_sex" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">学位</td>
						<td><input name="teacher_degree" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">职称</td>
						<td><input name="teacher_titles" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">学院</td>
						<td><input name="college_name" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">专业</td>
						<td><input name="major_name" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">角色</td>
						<td><input name="teacher_state" style="width: 200px;" /></td>
					</tr>
				</table>
    		</form>
		</div> 
		
		<div id="admin_teacher_editDialog" >  
    		<form id="admin_teacher_editForm" method="post">
    			<table class="tableForm datagrid-toolbar">
					<tr>
						<td align="right">教工号</td>
						<td><input name="teacher_num" style="width: 200px;" /></td>
						<td align="right">联系方式</td>
						<td><input name="teacher_phone" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">教师姓名</td>
						<td><input name="teacher_name" style="width: 200px;" /></td>
						<td align="right">电子邮箱</td>
						<td><input name="teacher_email" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">密码</td>
						<td><input name="password" style="width: 200px;" /></td>
						<td align="right">简介</td>
						<td rowspan="10"><textarea cols="21" rows="10" name="teacher_introduction"></textarea></td>
					</tr>
					<tr>
						<td align="right">重复密码</td>
						<td><input name="repassword" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">性别</td>
						<td><input name="teacher_sex" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">学位</td>
						<td><input name="teacher_degree" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">职称</td>
						<td><input name="teacher_titles" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">学院</td>
						<td><input name="college_name" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">专业</td>
						<td><input name="major_name" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">角色</td>
						<td><input name="teacher_state" style="width: 200px;" /></td>
					</tr>
				</table>
    		</form>
		</div> 
		
		<div id="admin_teacher_showDialog" >  
    			<table class="datagrid-toolbar showDetail">
					<tr>
						<td align="right" width="60px">教工号:</td>
						<td name="t_num" width="150px"></td>
						<td align="right" width="60px">联系方式:</td>
						<td name="t_phone" width="150px"></td>
					</tr>
					<tr>
						<td align="right">教师姓名:</td>
						<td name="t_name"></td>
						<td align="right">电子邮箱:</td>
						<td name="t_email"></td>
					</tr>
					<tr>
						<td align="right">性别:</td>
						<td name="t_sex"></td>
						<td align="right">简介:</td>
						<td name="t_intro" rowspan="10"></td>
					</tr>
					<tr>
						<td align="right">学位:</td>
						<td name="t_degree"></td>
					</tr>
					<tr>
						<td align="right">职称:</td>
						<td name="t_title"></td>
					</tr>
					<tr>
						<td align="right">学院:</td>
						<td name="t_col"></td>
					</tr>
					<tr>
						<td align="right">专业:</td>
						<td name="t_major"></td>
					</tr>
					<tr>
						<td align="right">角色:</td>
						<td name="t_permission"></td>
					</tr>
				</table>
		</div> 
	</body>
</html>
