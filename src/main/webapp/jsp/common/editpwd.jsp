<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	var changeTpwdForm;
	var changeSpwdForm;
	$(function(){
		changeTpwdForm = $('#changetpwd').form({
			url : sy.bp()+'/teacherMsg?method=changePwd',
			success : function(data) {
				var d = $.parseJSON(data);
				if (d.success) {
					changePwdWindow.window('close');
				}
				$.messager.show({
					msg : d.msg,
					title : '提示'
				});
			}
		});
		changeSpwdForm = $('#changespwd').form({
			url : sy.bp()+'/studentMsg?method=changePwd',
			success : function(data) {
				var d = $.parseJSON(data);
				if (d.success) {
					changePwdWindow.window('close');
				}
				$.messager.show({
					msg : d.msg,
					title : '提示'
				});
			}
		});
	});
	
	</script>

	<div align="center">
		<br/>
		<br/>
		<c:if test="${!empty teacher }">
		<form id="changetpwd" method="post">
			<table>
				<tr>
					<th align="right" style="font-size: 12px;">原密码</th>
					<td><input name="oldPwd" type="password"
						class="easyui-validatebox" required="true" missingMessage="请填写原密码" style="width: 140px;" />
						<input type="hidden" name="usernum" value="${teacher.teacher_num }" />
					</td>
					<td></td>
				</tr>
				<tr>
					<th align="right" style="font-size: 12px;">新密码</th>
					<td><input name="cpwd" type="password"
						class="easyui-validatebox" required="true" missingMessage="请填写新密码" style="width: 140px;margin-right: 80px;" />
					</td>
					<td></td>
				</tr>
				<tr>
					<th align="right" style="font-size: 12px;">重复密码</th>
					<td><input name="rePassword" type="password"
						class="easyui-validatebox" required="true"
						missingMessage="请再次填写密码"
						validType="eqPassword['#changetpwd input[name=cpwd]']" style="width: 140px;" />
					</td>
					
				</tr>
				<tr>
					<td colspan="2" align="right"><a name="btn" class="easyui-linkbutton"
						onclick="changeTpwdForm.submit();">确认修改</a>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		<c:if test="${!empty student }">
		<form id="changespwd" method="post">
			<table>
				<tr>
					<th align="right" style="font-size: 12px;">原密码</th>
					<td><input name="oldPwd" type="password"
						class="easyui-validatebox" required="true" missingMessage="请填写原密码" style="width: 140px;" />
						<input type="hidden" name="usernum" value="${student.stu_num }" />
					</td>
					<td></td>
				</tr>
				<tr>
					<th align="right" style="font-size: 12px;">新密码</th>
					<td><input name="cpwd" type="password"
						class="easyui-validatebox" required="true" missingMessage="请填写新密码" style="width: 140px;margin-right: 80px;" />
					</td>
					<td></td>
				</tr>
				<tr>
					<th align="right" style="font-size: 12px;">重复密码</th>
					<td><input name="rePassword" type="password"
						class="easyui-validatebox" required="true"
						missingMessage="请再次填写密码"
						validType="eqPassword['#changepwd input[name=cpwd]']" style="width: 140px;" />
					</td>
					
				</tr>
				<tr>
					<td colspan="2" align="right"><a name="btn" class="easyui-linkbutton"
						onclick="changeSpwdForm.submit();">确认修改</a>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
	</div>

