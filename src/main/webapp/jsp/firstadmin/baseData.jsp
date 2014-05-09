<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<jsp:include page="../../inc/meta.jsp"></jsp:include>
		<jsp:include page="../../inc/easyui.jsp"></jsp:include>
	</head>
	<style type="text/css">
.tableForm td {
	background: #E0ECFF;
	font-family: "微软雅黑";
	font-size: 12px;
	cellpadding: 5px;
	width: 440PX;
}
</style>
<script type="text/javascript">
	sy.ns('admin.baseData');
	$(function(){
		admin.baseData.editRow = undefined;
		admin.baseData.selectedCName = undefined;
		
		admin.baseData.college = $('#college').combobox({
        url:sy.bp()+'/collegeMsg?method=getName',
        editable : false,
        valueField :'id',
        textField : 'college_name',
        
        onSelect:function(data){
        	var college_name = encodeURIComponent(data.college_name);
        	admin.baseData.selectedCName = college_name;
        	
        	admin.baseData.major = $('#majorName').combobox({
        		url : sy.bp()+'/majorMsg?method=getName&colName='+admin.baseData.selectedCName,
        		editable : false,
        		valueField :'id',
        		textField : 'major_name',
        		onSelect:function(data){
        			admin.baseData.selectedMId = data.id;
	        		admin.baseData.classNum = $('#classNum').combobox({
		        		url : sy.bp()+'/classesMsg?method=getName&majorId='+admin.baseData.selectedMId,
		        		editable : false,
		        		valueField :'id',
		        		textField : 'class_num',
		        		onSelect : function(data){
		        			admin.baseData.selectedCId = data.id;
		        		}
        			});
        		}
        	});
        }
        });
        
        admin.baseData.datagrid = $('#admin_baseData_datagrid').datagrid({
			url : sy.bp() + '/collegeMsg?method=get',
			title : '学院信息',
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50 ],
			fit : true,
			fitColumns : true,
			nowrap : false,
			border : false,
			idField : 'id',
			sortName : 'college_num',
			sortOrder : 'asc',
			columns : [ [ {
				title : '编号',
				field : 'id',
				width : 100,
				sortable : true,
				checkbox : true
			}, {
				title : '学院编号',
				field : 'college_num',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			}, {
				title : '学院名称',
				field : 'college_name',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			}, {
				title : '学院状态',
				field : 'college_state',
				width : 100,
				sortable : true,
				editor : {
					type : 'validatebox',
					options : {
						required : true
					}
				}
			} ] ],toolbar : [ '-',{
					text : '增加',
					iconCls : 'icon-add',
					handler : function() {
					
						if(admin.baseData.editRow != undefined) {
							admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
						}
						
						if(admin.baseData.editRow == undefined){
							admin.baseData.datagrid.datagrid('insertRow',{
								index : 0,
								row : {
									college_num : '',
									college_name : ''
								}
							});
							admin.baseData.datagrid.datagrid('beginEdit' , 0);
							admin.baseData.editRow = 0;
						}
						
					}
				}, '-', {
					text : '删除',
					iconCls : 'icon-remove',
					handler : function() {
						var rows = admin.baseData.datagrid.datagrid('getSelections');
						if(rows.length > 0){
							$.messager.confirm('请确认','您确定要删除当前所有选择的项目吗？',function(b){
								if(b) {
									var ids = [];
									for(var i=0;i<rows.length;i++){
										ids.push(rows[i].id);
									}
									$.ajax({
										url : sy.bp()+'/collegeMsg?method=del',
										data : {
											ids : ids.join(',')
										},
										dataType : 'json',
										success : function(r){
											admin.baseData.datagrid.datagrid('load');
											admin.baseData.datagrid.datagrid('unselectAll');
											$.messager.show({
												title:'提示',
												msg:'删除成功！'
											});
										}
									});
								}
							});
						}else {
							$.messager.alert('提示','请选择要删除的记录！','warning');
						}
					}
				}, '-', {
					text : '修改',
					iconCls : 'icon-edit',
					handler : function() {
						var rows = admin.baseData.datagrid.datagrid('getSelections');
						if(rows.length == 1) {
							//admin.baseData.datagrid.datagrid('removeEditor','college_num');
							if(admin.baseData.editRow != undefined) {
								admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
							}
							
							if(admin.baseData.editRow == undefined){
								var index = admin.baseData.datagrid.datagrid('getRowIndex' , rows[0]);
								admin.baseData.datagrid.datagrid('beginEdit' , index);
								admin.baseData.editRow = index;
								admin.baseData.datagrid.datagrid('unselectAll');
							}
						}
					}
				}, '-','','-', {
					text : '保存',
					iconCls : 'icon-save',
					handler : function() {
						admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
					}
				},'-' ,{
					text : '取消',
					iconCls : 'icon-undo',
					handler : function() {
						admin.baseData.editRow = undefined;
						admin.baseData.datagrid.datagrid('rejectChanges');
						admin.baseData.datagrid.datagrid('unselectAll');
					}
				},'-' ],
				onAfterEdit : function(rowIndex,rowData,changes){
					var inserted = admin.baseData.datagrid.datagrid('getChanges','inserted');
					var updated = admin.baseData.datagrid.datagrid('getChanges','updated');
					var url = '';
					if(inserted.length > 0) {
						url = sy.bp()+'/collegeMsg?method=add';
					}
					if(updated.length > 0) {
						url = sy.bp()+'/collegeMsg?method=edit';
					}
					$.ajax({
						url : url,
						data : rowData,
						dataType : 'json',
						success : function(r) {
							if(r && r.success){
								admin.baseData.datagrid.datagrid('acceptChanges');
								$.messager.show({
									msg : r.msg,
									title : '成功'
								});
							}else{
								admin.baseData.datagrid.datagrid('rejectChanges');
								$.messager.alert('错误',r.msg,'error');
							}
							admin.baseData.editRow = undefined;
							admin.baseData.datagrid.datagrid('unselectAll');
						}
					});
				}
		});
        
        admin.baseData.searchMajor = function() {
			if(!admin.baseData.college.combobox('getValue')) {
				alert('请选择学院名称！');
			} else { 
			admin.baseData.datagrid = $('#admin_baseData_datagrid').datagrid({
				url : sy.bp() + '/majorMsg?method=get&cName='+admin.baseData.selectedCName,
				title : '专业信息',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 40, 50 ],
				fit : true,
				fitColumns : true,
				nowrap : false,
				border : false,
				idField : 'id',
				sortName : 'major_num',
				sortOrder : 'asc',
				columns : [ [ {
					title : '编号',
					field : 'id',
					width : 100,
					sortable : true,
					checkbox : true
				}, {
					title : '专业编号',
					field : 'major_num',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : true
						}
					}
				}, {
					title : '专业名称',
					field : 'major_name',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : true
						}
					}
				}, {
					title : '所属学院',
					field : 'college_name',
					width : 100,
					sortable : true
				}, {
					title : '专业状态',
					field : 'major_state',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : false
						}
					}
				} ] ],toolbar : [ '-',{
						text : '增加',
						iconCls : 'icon-add',
						handler : function() {
						
							if(admin.baseData.editRow != undefined) {
								admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
							}
							
							if(admin.baseData.editRow == undefined){
								admin.baseData.datagrid.datagrid('insertRow',{
									index : 0,
									row : {
										major_num : '',
										major_name : ''
									}
								});
								admin.baseData.datagrid.datagrid('beginEdit' , 0);
								admin.baseData.editRow = 0;
							}
							
						}
					}, '-', {
						text : '删除',
						iconCls : 'icon-remove',
						handler : function() {
							var rows = admin.baseData.datagrid.datagrid('getSelections');
							if(rows.length > 0){
								$.messager.confirm('请确认','您确定要删除当前所有选择的项目吗？',function(b){
									if(b) {
										var ids = [];
										for(var i=0;i<rows.length;i++){
											ids.push(rows[i].id);
										}
										$.ajax({
											url : sy.bp()+'/majorMsg?method=del',
											data : {
												ids : ids.join(',')
											},
											dataType : 'json',
											success : function(r){
												admin.baseData.datagrid.datagrid('load');
												admin.baseData.datagrid.datagrid('unselectAll');
												$.messager.show({
													title:'提示',
													msg:'删除成功！'
												});
											}
										});
									}
								});
							}else {
								$.messager.alert('提示','请选择要删除的记录！','warning');
							}
						}
					}, '-', {
						text : '修改',
						iconCls : 'icon-edit',
						handler : function() {
							var rows = admin.baseData.datagrid.datagrid('getSelections');
							if(rows.length == 1) {
								if(admin.baseData.editRow != undefined) {
									admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
								}
								
								if(admin.baseData.editRow == undefined){
									var index = admin.baseData.datagrid.datagrid('getRowIndex' , rows[0]);
									admin.baseData.datagrid.datagrid('beginEdit' , index);
									admin.baseData.editRow = index;
									admin.baseData.datagrid.datagrid('unselectAll');
								}
							}
						}
					}, '-','','-', {
						text : '保存',
						iconCls : 'icon-save',
						handler : function() {
							admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
						}
					},'-' ,{
						text : '取消',
						iconCls : 'icon-undo',
						handler : function() {
							admin.baseData.editRow = undefined;
							admin.baseData.datagrid.datagrid('rejectChanges');
							admin.baseData.datagrid.datagrid('unselectAll');
						}
					},'-' ],
					onAfterEdit : function(rowIndex,rowData,changes){
						var inserted = admin.baseData.datagrid.datagrid('getChanges','inserted');
						var updated = admin.baseData.datagrid.datagrid('getChanges','updated');
						var url = '';
						if(inserted.length > 0) {
							url = sy.bp()+'/majorMsg?method=add&cName='+admin.baseData.selectedCName;
						}
						if(updated.length > 0) {
							url = sy.bp()+'/majorMsg?method=edit';
						}
						$.ajax({
							url : url,
							data : rowData,
							dataType : 'json',
							success : function(r) {
								if(r && r.success){
									admin.baseData.datagrid.datagrid('acceptChanges');
									$.messager.show({
										msg : r.msg,
										title : '成功'
									});
								}else{
									admin.baseData.datagrid.datagrid('rejectChanges');
									$.messager.alert('错误',r.msg,'error');
								}
								admin.baseData.editRow = undefined;
								admin.baseData.datagrid.datagrid('unselectAll');
							}
						});
					}
			});
			}
		};	
		admin.baseData.searchClass = function(){
			if(!admin.baseData.college.combobox('getValue')) {
				alert('请选择学院名称！');
			} else if (!admin.baseData.major.combobox('getValue')) {
				alert('请选择专业名称！');
			} else {
			admin.baseData.datagrid = $('#admin_baseData_datagrid').datagrid({
				url : sy.bp() + '/classesMsg?method=get&majorId='+admin.baseData.selectedMId,
				title : '班级信息',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 40, 50 ],
				fit : true,
				fitColumns : true,
				nowrap : false,
				border : false,
				idField : 'id',
				sortName : 'class_num',
				sortOrder : 'asc',
				columns : [ [ {
					title : '编号',
					field : 'id',
					width : 100,
					sortable : true,
					checkbox : true
				}, {
					title : '班号',
					field : 'class_num',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : true
						}
					}
				}, {
					title : '班级状态',
					field : 'class_state',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : true
						}
					}
				} ] ],toolbar : [ '-',{
						text : '增加',
						iconCls : 'icon-add',
						handler : function() {
						
							if(admin.baseData.editRow != undefined) {
								admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
							}
							
							if(admin.baseData.editRow == undefined){
								admin.baseData.datagrid.datagrid('insertRow',{
									index : 0,
									row : {
									}
								});
								admin.baseData.datagrid.datagrid('beginEdit' , 0);
								admin.baseData.editRow = 0;
							}
							
						}
					}, '-', {
						text : '删除',
						iconCls : 'icon-remove',
						handler : function() {
							var rows = admin.baseData.datagrid.datagrid('getSelections');
							if(rows.length > 0){
								$.messager.confirm('请确认','您确定要删除当前所有选择的项目吗？',function(b){
									if(b) {
										var ids = [];
										for(var i=0;i<rows.length;i++){
											ids.push(rows[i].id);
										}
										$.ajax({
											url : sy.bp()+'/classesMsg?method=del',
											data : {
												ids : ids.join(',')
											},
											dataType : 'json',
											success : function(r){
												admin.baseData.datagrid.datagrid('load');
												admin.baseData.datagrid.datagrid('unselectAll');
												$.messager.show({
													title:'提示',
													msg:'删除成功！'
												});
											}
										});
									}
								});
							}else {
								$.messager.alert('提示','请选择要删除的记录！','warning');
							}
						}
					}, '-', {
						text : '修改',
						iconCls : 'icon-edit',
						handler : function() {
							var rows = admin.baseData.datagrid.datagrid('getSelections');
							if(rows.length == 1) {
								if(admin.baseData.editRow != undefined) {
									admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
								}
								
								if(admin.baseData.editRow == undefined){
									var index = admin.baseData.datagrid.datagrid('getRowIndex' , rows[0]);
									admin.baseData.datagrid.datagrid('beginEdit' , index);
									admin.baseData.editRow = index;
									admin.baseData.datagrid.datagrid('unselectAll');
								}
							}
						}
					}, '-','','-', {
						text : '保存',
						iconCls : 'icon-save',
						handler : function() {
							admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
						}
					},'-' ,{
						text : '取消',
						iconCls : 'icon-undo',
						handler : function() {
							admin.baseData.editRow = undefined;
							admin.baseData.datagrid.datagrid('rejectChanges');
							admin.baseData.datagrid.datagrid('unselectAll');
						}
					},'-' ],
					onAfterEdit : function(rowIndex,rowData,changes){
						var inserted = admin.baseData.datagrid.datagrid('getChanges','inserted');
						var updated = admin.baseData.datagrid.datagrid('getChanges','updated');
						var url = '';
						if(inserted.length > 0) {
							url = sy.bp()+'/classesMsg?method=add&majorId='+admin.baseData.selectedMId;
						}
						if(updated.length > 0) {
							url = sy.bp()+'/classesMsg?method=edit';
						}
						$.ajax({
							url : url,
							data : rowData,
							dataType : 'json',
							success : function(r) {
								if(r && r.success){
									admin.baseData.datagrid.datagrid('acceptChanges');
									$.messager.show({
										msg : r.msg,
										title : '成功'
									});
								}else{
									admin.baseData.datagrid.datagrid('rejectChanges');
									$.messager.alert('错误',r.msg,'error');
								}
								admin.baseData.editRow = undefined;
								admin.baseData.datagrid.datagrid('unselectAll');
							}
						});
					}
			});
			}
		};
		
		admin.baseData.searchStudent = function(){
			if(!admin.baseData.college.combobox('getValue')) {
				alert('请选择学院名称！');
			} else if (!admin.baseData.major.combobox('getValue')) {
				alert('请选择专业名称！');
			} else if(!admin.baseData.classNum.combobox('getValue')) {
				alert('请选择班级号！');
			} else {
			admin.baseData.datagrid = $('#admin_baseData_datagrid').datagrid({
				url : sy.bp() + '/studentMsg?method=get&classId='+admin.baseData.selectedCId,
				title : '学生信息',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 40, 50 ],
				fit : true,
				fitColumns : true,
				nowrap : false,
				border : false,
				idField : 'id',
				sortName : 'stu_num',
				sortOrder : 'asc',
				columns : [ [ {
					title : '编号',
					field : 'id',
					width : 100,
					sortable : true,
					checkbox : true
				}, {
					title : '学号',
					field : 'stu_num',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : true
						}
					}
				}, {
					title : '姓名',
					field : 'stu_name',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : true
						}
					}
				}, {
					title : '性别',
					field : 'stu_sex',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : true
						}
					}
				}, {
					title : '学生状态',
					field : 'stu_state',
					width : 100,
					sortable : true,
					editor : {
						type : 'validatebox',
						options : {
							required : false
						}
					}
				} ] ],toolbar : [ '-',{
						text : '增加',
						iconCls : 'icon-add',
						handler : function() {
						
							if(admin.baseData.editRow != undefined) {
								admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
							}
							
							if(admin.baseData.editRow == undefined){
								admin.baseData.datagrid.datagrid('insertRow',{
									index : 0,
									row : {
									}
								});
								admin.baseData.datagrid.datagrid('beginEdit' , 0);
								admin.baseData.editRow = 0;
							}
							
						}
					}, '-', {
						text : '删除',
						iconCls : 'icon-remove',
						handler : function() {
							var rows = admin.baseData.datagrid.datagrid('getSelections');
							if(rows.length > 0){
								$.messager.confirm('请确认','您确定要删除当前所有选择的项目吗？',function(b){
									if(b) {
										var ids = [];
										for(var i=0;i<rows.length;i++){
											ids.push(rows[i].id);
										}
										$.ajax({
											url : sy.bp()+'/studentMsg?method=del',
											data : {
												ids : ids.join(',')
											},
											dataType : 'json',
											success : function(r){
												admin.baseData.datagrid.datagrid('load');
												admin.baseData.datagrid.datagrid('unselectAll');
												$.messager.show({
													title:'提示',
													msg:'删除成功！'
												});
											}
										});
									}
								});
							}else {
								$.messager.alert('提示','请选择要删除的记录！','warning');
							}
						}
					}, '-', {
						text : '修改',
						iconCls : 'icon-edit',
						handler : function() {
							var rows = admin.baseData.datagrid.datagrid('getSelections');
							if(rows.length == 1) {
								if(admin.baseData.editRow != undefined) {
									admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
								}
								
								if(admin.baseData.editRow == undefined){
									var index = admin.baseData.datagrid.datagrid('getRowIndex' , rows[0]);
									admin.baseData.datagrid.datagrid('beginEdit' , index);
									admin.baseData.editRow = index;
									admin.baseData.datagrid.datagrid('unselectAll');
								}
							}
						}
					}, '-','','-', {
						text : '保存',
						iconCls : 'icon-save',
						handler : function() {
							admin.baseData.datagrid.datagrid('endEdit',admin.baseData.editRow);
						}
					},'-' ,{
						text : '取消',
						iconCls : 'icon-undo',
						handler : function() {
							admin.baseData.editRow = undefined;
							admin.baseData.datagrid.datagrid('rejectChanges');
							admin.baseData.datagrid.datagrid('unselectAll');
						}
					},'-' ],
					onAfterEdit : function(rowIndex,rowData,changes){
						var inserted = admin.baseData.datagrid.datagrid('getChanges','inserted');
						var updated = admin.baseData.datagrid.datagrid('getChanges','updated');
						var url = '';
						if(inserted.length > 0) {
							url = sy.bp()+'/studentMsg?method=add&classId='+admin.baseData.selectedCId;
						}
						if(updated.length > 0) {
							url = sy.bp()+'/studentMsg?method=edit&classId='+admin.baseData.selectedCId;
						}
						$.ajax({
							url : url,
							data : rowData,
							dataType : 'json',
							success : function(r) {
								if(r && r.success){
									admin.baseData.datagrid.datagrid('acceptChanges');
									$.messager.show({
										msg : r.msg,
										title : '成功'
									});
								}else{
									admin.baseData.datagrid.datagrid('rejectChanges');
									$.messager.alert('错误',r.msg,'error');
								}
								admin.baseData.editRow = undefined;
								admin.baseData.datagrid.datagrid('unselectAll');
							}
						});
					}
			});
		};	
		}
	});
</script>

	<body class="easyui-layout" fit="true" border="flase">
		<div region="north" border="flase" style="height: 150px; overflow: hidden;">
			<form action="" method="POST">
				<table class="tableForm" cellpadding="5px" align="center">
					<tr>
						<td colspan="2" align="center"><b>基础数据管理</b></td>
					</tr>
					<tr>
    					<td align="right"><b>1、检索专业</b>&emsp;（请选择学院）</td>
    					<td align="left"><select id="college" name="college" style="width:200px;"></select><a onclick="admin.baseData.searchMajor();" class="easyui-linkbutton" iconCls="icon-search" style="float: right" plain="true">检索</a></td>
    				</tr>
    				<tr>
    					<td align="right"><b>2、检索班级</b>&emsp;（请选择专业）</td>
    					<td align="left"><select id="majorName" name="majorName" style="width:200px;"></select><a onclick="admin.baseData.searchClass();" class="easyui-linkbutton" iconCls="icon-search" style="float: right" plain="true">检索</a></td>
    				</tr>
    				<tr>
    					<td align="right"><b>3、检索学生</b>&emsp;（请选择班级）</td>
    					<td align="left"><select id="classNum" name="classNum" style="width:200px;"></select><a onclick="admin.baseData.searchStudent();" class="easyui-linkbutton" iconCls="icon-search" style="float: right" plain="true">检索</a></td>
    				</tr>
				</table>
			</form>
		</div>
		<div region="center" border="flase">
			<table id="admin_baseData_datagrid"></table>
		</div>
	</body>
</html>