<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
	<head>
		<jsp:include page="../../inc/meta.jsp"></jsp:include>
		<jsp:include page="../../inc/easyui.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="../../css/baseCss.css"></link>
	</head>
	
	<script type="text/javascript">
		sy.ns('admin.exp');
		admin.exp.editRow = undefined;
		$(function(){
			
			//数据表格
			admin.exp.datagrid=$('#admin_exp_datagrid').datagrid({
				url : sy.bp()+'/experimentMsg?method=get',
				pagination : true,
				pageSize : 10,
				pageList : [10,20,30,40,50],
				fit : true,
				fitColumns : true,
				nowrap : false,
				border : false,
				idField : 'id',
				sortName : 'experiment_name',
				sortOrder : 'asc',
				columns : [[{
					title : '',
					field : 'id',
					checkbox : true
				},{
					title : '实验项目名称',
					field : 'experment_name',
					width : 200,
					align : 'center'
				},{
					title : '课程名称',
					field : 'exp_course_name',
					width : 100,
					align : 'center'
				},{
					title : '实验学时',
					field : 'experment_time',
					width : 80,
					align : 'center'
				},{
					title : '实验类型',
					field : 'experment_type',
					width : 80,
					align : 'center'
				},{
					title : '开课对象',
					field : 'experment_obj',
					width : 180,
					align : 'center'
				},{
					title : '实验室',
					field : 'labroom_name',
					width : 180,
					align : 'center'
				},{
					title : '查看详细',
					field : 'experment_num',
					width : 60,
					align : 'center',
					formatter : function(value, rowData, rowIndex) {
						return '<span style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span><a href="javascript:void(0);" onclick="admin.exp.showSinger(' + rowIndex + ');">查看</a>';
					}
				}]],
				toolbar : ['-',{
					text : '增加',
					iconCls : 'icon-add',
					handler : function(){
						admin.exp.addDialog.dialog('open');
						}
				},'-',{
					text : '删除',
					iconCls : 'icon-remove',
					handler : function(){
						var rows = admin.exp.datagrid.datagrid('getSelections');
						if(rows.length > 0) {
							$.messager.confirm('请确认','您确定要删除所选条目吗？',function(b){
								if(b){
									var ids = [];
									for(var i=0;i<rows.length;i++){
										ids.push(rows[i].id);
									}
									$.ajax({
										url : sy.bp()+'/experimentMsg?method=del',
										data : {
											ids : ids.join(',')
										},
										dataType : 'json',
										success : function(r){
											admin.exp.datagrid.datagrid('load'),
											admin.exp.datagrid.datagrid('unselectAll'),
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
						admin.exp.editRow = undefined;
						admin.exp.datagrid.datagrid('rejectChanges');
						admin.exp.datagrid.datagrid('unselectAll');
					}
				},'-']
			});
			
			//增加表单
			admin.exp.addForm = $('#admin_exp_addForm').form({
					url : sy.bp()+'/experimentMsg?method=add', 
					success : function(r){
						var d = $.parseJSON(r);
						if(d.success){
							admin.exp.addDialog.dialog('close');
							admin.exp.datagrid.datagrid('load');
						}else{
							admin.exp.addForm.find('input[name=experment_num]').val('');
							admin.exp.addForm.find('input[name=experment_num]').focus();
						}
						$.messager.show({
								msg : d.msg,
								title : '提示'
							});
					}
				}
			);
			//add dialog
			admin.exp.addDialog = $('#admin_exp_addDialog').show().dialog({
						title : '增加实验',
						iconCls : 'icon-add',
 						modal:true,
 						closed : true,
 						width : 640,
 						buttons : [{
 							text : '保存',
 							iconCls : 'icon-save',
 							plain : true,
 							handler : function(){
 								admin.exp.addForm.submit();
 							}
 						},{
 							text : '重写',
 							iconCls : 'icon-undo',
 							plain : true,
 							handler : function(){
 								admin.exp.addForm.find('input').val('');
 								admin.exp.addForm.find('textarea').val('');
 							}
 						}],
 						onOpen : function() {
							setTimeout(function() {
								admin.exp.addForm.find('input[name=experment_num]').focus();
							}, 1);
						},
						onClose : function() {
								admin.exp.addForm.find('input').val('');
						} 
					}); 
			
			//修改表单
			admin.exp.editForm = $('#admin_exp_editForm').form({
				url : sy.bp()+'/experimentMsg?method=edit&exp_id=' + admin.exp.id, 
				success : function(r){
					var d = $.parseJSON(r);
					if(d.success){
						admin.exp.addDialog.dialog('close');
						admin.exp.datagrid.datagrid('load');
					}else{
						admin.exp.addForm.find('input[name=experiment_num]').val('');
						admin.exp.addForm.find('input[name=experiment_num]').focus();
					}
					$.messager.show({
							msg : d.msg,
							title : '提示'
						});
					}
				}
			);
			
			//修改dialog
			admin.exp.editDialog = $('#admin_exp_editDialog').show().dialog({
						title : '修改实验',
						iconCls : 'icon-edit',
 						modal:true,
 						closed : true,
 						width : 640,
 						buttons : [{
 							text : '保存',
 							iconCls : 'icon-save',
 							plain : true,
 							handler : function(){
 									alert(admin.exp.id);
 									admin.exp.editForm.submit(admin.exp.id);
 							}
 						},{
 							text : '重写',
 							iconCls : 'icon-undo',
 							plain : true,
 							handler : function(){
 								admin.exp.editForm.find('input').val('');
 								admin.exp.editForm.find('textarea').val('');
 							}
 						}],
 						onOpen : function() {
							setTimeout(function() {
								admin.exp.editForm.find('input[name=experiment_num]').focus();
							}, 1);
						},
						onClose : function() {
								admin.exp.editForm.find('input').val('');
						} 
					});
			
			
			function edit() {
				var rows = admin.exp.datagrid.datagrid('getSelections');
				if(rows.length == 1) {
					$.messager.progress({
						text : 'progressing...',
						intervar : 100
					});
					admin.exp.id = rows[0].id;
					$.ajax({
						url : sy.bp()+'/experimentMsg?method=getSinger',
						data : {
							exp_id : admin.exp.id
						},
						dataType : 'json',
						cache : false,
						success : function(r) {
							admin.exp.editForm.form('load',r);
							admin.exp.editDialog.dialog('open');
							$.messager.progress('close');
						}
					});
				} else {
					$.messager.alert('提示', '请选择一项要编辑的记录！', 'error');
				}
			}
					
			admin.exp.showDialog = $('#admin_exp_showDialog').show().dialog({
				title : '详细信息',
				modal : true
			}).dialog('close');
			
			//查看详情
			admin.exp.showSinger = function(index) {
				var rows = admin.exp.datagrid.datagrid('getRows');
				var row = rows[index];
				$.messager.progress({
					text : 'progressing...',
					interval : 100
				});
				$.ajax({
					url : sy.bp()+'/experimentMsg?method=getSinger',
					data : {
						exp_id : row.id
					},
					dataType : 'json',
					cache : false,
					success : function(response) {
						if (response) {
							admin.exp.showDialog.find('td[name=experiment_num]').html(response.experiment_num);
							admin.exp.showDialog.find('td[name=labroom_name]').html(response.labroom_name);
							admin.exp.showDialog.find('td[name=experment_name]').html(response.experment_name);
							admin.exp.showDialog.find('td[name=totalStuNum]').html(response.totalStuNum);
							admin.exp.showDialog.find('td[name=exp_course_name]').html(response.exp_course_name);
							admin.exp.showDialog.find('td[name=experment_require]').html(response.experment_require);
							admin.exp.showDialog.find('td[name=experment_time]').html(response.experment_time);
							admin.exp.showDialog.find('td[name=experment_type]').html(response.experment_type);
							admin.exp.showDialog.find('td[name=experment_obj]').html(response.experment_obj);
							admin.exp.showDialog.find('td[name=experment_grounp]').html(response.experment_grounp);
							admin.exp.showDialog.find('td[name=experment_grounp_now]').html(response.experment_grounp_now);
							admin.exp.showDialog.find('td[name=experment_state]').html(response.experment_state);
							admin.exp.showDialog.dialog('open');
						}
						$.messager.progress('close');
					}
				});
				admin.exp.datagrid.datagrid('unselectAll');
				
			}
			
		});
	</script>

	<body class="easyui-layout" fit="true" border="false">
		<div region="north" title="检索" split="true" style="height: 100px;overflow: hidden;">
			<form action="">
				<table class="tableForm datagrid-toolbar"
						style="width: 100%; height: 100%;">
						<tr>
							<td align="right">请选择实验室</td>
							<td>
								<select name="labroom_name" style="width: 335px;">
									<option value="">请选择...</option>
									<option value="网络化控制系统实验室">网络化控制系统实验室</option>
									<option value="嵌入式系统实验室">嵌入式系统实验室</option>
									<option value="自动控制原理实验室">自动控制原理实验室</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right">或&nbsp;&nbsp;&nbsp;输入实验名称</td>
							<td><input name="major_name" style="width: 335px;" />
							<a href="javascript:void(0);" class="easyui-linkbutton"
									onclick="sy.admin.user.search();">查询</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									onclick="sy.admin.user.cleanSearch();">清空</a></td>
						</tr>
					</table>
			</form>
		</div>
		
		<div region="center" title="实验信息" border="false">
			<form id="admin_exp_datagrid"></form>
		</div>
		
		<div id="admin_exp_addDialog" >  
    		<form id="admin_exp_addForm" method="post">
    			<table class="tableForm datagrid-toolbar">
					<tr>
						<td align="right">实验编号</td>
						<td><input name="experment_num" style="width: 200px;" /></td>
						<td align="right">实验室</td>
						<td>
							<select name="labroom_name" style="width: 200px;">
								<option value="网络化控制系统实验室">网络化控制系统实验室</option>
								<option value="嵌入式系统实验室">嵌入式系统实验室</option>
								<option value="自动控制原理实验室">自动控制原理实验室</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">实验项目名称</td>
						<td><input name="experment_name" style="width: 200px;" /></td>
						<td align="right">总人数</td>
						<td><input name="totalStuNum" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">课程名称</td>
						<td><input name="exp_course_name" style="width: 200px;" /></td>
						<td align="right">实验要求</td>
						<td rowspan="10"><textarea cols="21" rows="10" name="experment_require"></textarea></td>
					</tr>
					<tr>
						<td align="right">实验学时</td>
						<td><input name="experment_time" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">实验类型</td>
						<td>
							<select name="experment_type" style="width: 200px;">
								<option value="验证设计">验证设计</option>
								<option value="设计综合">设计综合</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">开设对象</td>
						<td>
							<select name="experment_obj" style="width: 200px;">
								<option value="本科生">本科生</option>
								<option value="研究生">研究生</option>
								<option value="博士生">博士生</option>
								<option value="本科生,研究生">本科生,研究生</option>
								<option value="研究生,博士生">研究生,博士生</option>
								<option value="本科生,研究生,博士生">本科生,研究生,博士生</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">需要组数</td>
						<td><input name="experment_grounp" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">现有组数</td>
						<td><input name="experment_grounp_now" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">实验状态</td>
						<td><input name="experment_state" style="width: 200px;" /></td>
					</tr>
				</table>
    		</form>
		</div> 
		
		<div id="admin_exp_editDialog" >  
    		<form id="admin_exp_editForm" method="post">
    			<table class="tableForm datagrid-toolbar">
					<tr>
						<td align="right">实验编号</td>
						<td><input name="experment_num" style="width: 200px;" /></td>
						<td align="right">实验室</td>
						<td>
							<select name="labroom_name" style="width: 200px;">
								<option value="网络化控制系统实验室">网络化控制系统实验室</option>
								<option value="嵌入式系统实验室">嵌入式系统实验室</option>
								<option value="自动控制原理实验室">自动控制原理实验室</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">实验项目名称</td>
						<td><input name="experment_name" style="width: 200px;" /></td>
						<td align="right">总人数</td>
						<td><input name="totalStuNum" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">课程名称</td>
						<td><input name="exp_course_name" style="width: 200px;" /></td>
						<td align="right">实验要求</td>
						<td rowspan="10"><textarea cols="21" rows="10" name="experment_require"></textarea></td>
					</tr>
					<tr>
						<td align="right">实验学时</td>
						<td><input name="experment_time" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">实验类型</td>
						<td>
							<select name="experment_type" style="width: 200px;">
								<option value="验证设计">验证设计</option>
								<option value="设计综合">设计综合</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">开设对象</td>
						<td>
							<select name="experment_obj" style="width: 200px;">
								<option value="本科生">本科生</option>
								<option value="研究生">研究生</option>
								<option value="博士生">博士生</option>
								<option value="本科生,研究生">本科生,研究生</option>
								<option value="研究生,博士生">研究生,博士生</option>
								<option value="本科生,研究生,博士生">本科生,研究生,博士生</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right">需要组数</td>
						<td><input name="experment_grounp" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">现有组数</td>
						<td><input name="experment_grounp_now" style="width: 200px;" /></td>
					</tr>
					<tr>
						<td align="right">实验状态</td>
						<td><input name="experment_state" style="width: 200px;" /></td>
					</tr>
				</table>
    		</form>
		</div> 
		<div id="admin_exp_showDialog" >  
    			<table class="tableForm datagrid-toolbar">
					<tr>
						<td align="right" width="100px">实验编号</td>
						<td name="experiment_num" width="200px"></td>
						<td align="right" width="100px">实验室</td>
						<td name="labroom_name" width="200px"></td>
					</tr>
					<tr>
						<td align="right">实验项目名称</td>
						<td name="experment_name"></td>
						<td align="right">总人数</td>
						<td name="totalStuNum"></td>
					</tr>
					<tr>
						<td align="right">课程名称</td>
						<td name="exp_course_name"></td>
						<td align="right">实验要求</td>
						<td name="experment_require"></td>
					</tr>
					<tr>
						<td align="right">实验学时</td>
						<td name="experment_time"></td>
					</tr>
					<tr>
						<td align="right">实验类型</td>
						<td name="experment_type"></td>
					</tr>
					<tr>
						<td align="right">开设对象</td>
						<td name="experment_obj"></td>
					</tr>
					<tr>
						<td align="right">需要组数</td>
						<td name="experment_grounp"></td>
					</tr>
					<tr>
						<td align="right">现有组数</td>
						<td name="experment_grounp_now"></td>
					</tr>
					<tr>
						<td align="right">实验状态</td>
						<td name="experment_state"></td>
					</tr>
				</table>
		</div>
	</body>
</html>
