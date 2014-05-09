<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <jsp:include page="../../inc/meta.jsp"></jsp:include>
	<jsp:include page="../../inc/easyui.jsp"></jsp:include>
	<script type="text/javascript">
		sy.ns('fileres');
		$(function(){
			fileres.datagrid = $('#download_file_list').datagrid({
				url : sy.bp()+'/file?method=downloadview',
				pagination : true,
				pageSize : 10,
				pageList : [10,20,30,40,50],
				fit : true,
				fitColumns : true,
				nowrap : false,
				border : false,
				idField : 'id',
				sortName : 'file_uptime',
				sortOrder : 'desc',
				columns : [[{
					title : '资源名称',
					field : 'file_filename',
					width : 100,
					align : 'center'
				},{
					title : '资源大小',
					field : 'file_filesize',
					width : 50,
					align : 'center'
				},{
					title : '上传时间',
					field : 'file_uptime',
					width : 100,
					align : 'center'
				},{
					title : '描述信息',
					field : 'file_fileinfo',
					width : 200,
					align : 'center'
				},{
					title : '编辑',
					field : 'file_savename',
					width : 50,
					align : 'center',
					formatter : function(value, rowData, rowIndex) {
						return '<span style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span><a href="${pageContext.request.contextPath }/file?method=download&downname='+value+'">下载</a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="fileres.del(' + rowIndex + ');">删除</a>';
					}
				}]]
			});
			
			//删除文件
			fileres.del = function(index){
				var rows = fileres.datagrid.datagrid('getRows');
				var row = rows[index];
				$.messager.confirm('请确认','您确定要删除所选条目吗？',function(b){
					if(b) {
						id = row.id;
						$.ajax({
								url : sy.bp()+'/file?method=del',
								data : {
									id : id
								},
								dataType : 'json',
								success : function(r){
									fileres.datagrid.datagrid('load'),
									fileres.datagrid.datagrid('unselectAll'),
									$.messager.show({
										title : '提示',
										msg : '删除成功！'
									});
								}
							});
					}
				});
			};
		});
	</script>
  </head>
  
  <body class="easyui-layout" fit="true" border="false">
    <div region="center" title="" border="false" style="font-size: 14px;">
		<form id="download_file_list"></form>
	</div>
  </body>
</html>
