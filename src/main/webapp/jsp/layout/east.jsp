<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
	var onlineDatagrid;
	var onlinePanel;
	var calendar;
	$(function() {

		calendar = $('#calendar').calendar({
			fit : true,
			current : new Date(),
			border : false,
			onSelect : function(date) {
				$(this).calendar('moveTo', new Date());
			}
		});

		onlinePanel = $('#onlinePanel').panel({
			tools : [ {
				iconCls : 'icon-reload',
				handler : function() {
					if (onlineDatagrid.datagrid('options').url) {
						onlineDatagrid.datagrid('reload');
					}
				}
			} ]
		});

		onlineDatagrid = $('#onlineDatagrid').datagrid({
			/*url : 'onlineAction!datagrid.action',*/
			title : '',
			iconCls : '',
			fit : true,
			fitColumns : true,
			pagination : false,
			pageSize : 10,
			pageList : [ 10 ],
			nowarp : false,
			border : false,
			idField : 'cid',
			sortName : 'cdatetime',
			sortOrder : 'desc',
			frozenColumns : [ [ {
				title : '编号',
				field : 'cid',
				width : 150,
				hidden : true
			} ] ],
			columns : [ [ {
				title : '登录名',
				field : 'cname',
				width : 150,
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return sy.fs('<span title="{0}">{1}</span>', value, value);
				}
			}, {
				title : 'IP',
				field : 'cip',
				width : 150,
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return sy.fs('<span title="{0}">{1}</span>', value, value);
				}
			}, {
				title : '登录时间',
				field : 'cdatetime',
				width : 150,
				sortable : true,
				formatter : function(value, rowData, rowIndex) {
					return sy.fs('<span title="{0}">{1}</span>', value, value);
				}
			} ] ],
			onClickRow : function(rowIndex, rowData) {
				var t = '<table class="tableForm">';
				t += '<tr>';
				t += '<th>登录名</th><td>{0}</td>';
				t += '</tr>';
				t += '<tr>';
				t += '<th>IP</th><td>{1}</td>';
				t += '</tr>';
				t += '<tr>';
				t += '<th>登录时间</th><td>{2}</td>';
				t += '</tr>';
				t += '</table>';
				$.messager.alert('信息', sy.fs(t, rowData.cname, rowData.cip, rowData.cdatetime));
				$(this).datagrid('unselectAll');
			}
		});

	});
</script>
<div class="easyui-layout" fit="true" border="false">
	<div region="north" border="false" style="height:180px;">
		<div id="calendar"></div>
	</div>
	<div region="center" border="false">
		<div id="onlinePanel" fit="true" border="false" title="用户在线列表">
			<table id="onlineDatagrid"></table>
		</div>
	</div>
</div>