<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc/meta.jsp"></jsp:include>
<jsp:include page="../../inc/easyui.jsp"></jsp:include>
<script type="text/javascript">
	function upload() {
		$('#uploadForm').form('submit', {
			url : sy.bp() + '/file?method=upload',
			success : function(r) {
				var d = $.parseJSON(r);
				$.messager.show({
					title : '提示',
					msg : d.msg
				});
				if (d.success == true) {
					$('#uploadFormPath').val('');
					$('#uploadFormDisc').val('');
				}
			}
		});
	}
</script>
</head>

<body>
	<center>
		<table border="1" bordercolor="#BFD3E1" bordercolorlight="#BFD3E1"
			bordercolordark="white" cellpadding="0" cellspacing="0" rules="cols">
			<form id="uploadForm" enctype="multipart/form-data" name="uploadform" method="post">
			<tr>
				<td valign="top" style="padding-left:30;padding-top:10"
					bgcolor="white">资料路径：<br> <input id="uploadFormPath"
					type="file" name="file" size="60"><br> 资料描述：<br>
					<textarea id="uploadFormDisc" rows="5" cols="69" name="fileinfo"></textarea><br>
					<hr color="black"> <input style="float: right;" type="button"
					value="上传" onclick="upload()"> <input style="float: right;"
					type="reset" value="重置"> <br>
				<br></td>
			</tr>
			</form>
		</table>
		</form>
	</center>
</body>
</html>
