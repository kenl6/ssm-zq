<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员管理</title>
<%
	String path = request.getContextPath();
%>
</head>
<body>
	<form action="">
		人员姓名：<input type="text" name="name"><br/>
		性       别：<input type="radio" value="0" checked="checked">男</input> <input type="radio" value="1">女</input><br/>
		年       龄：<input type="text" name="age"><br/>
		密       码：<input type="text" name="password"><br/>
		注册日期：<input type="text" name="registerTime"><br/>
		备       注：<input type="text" name="remarks"><br/>
		状       态：<select name="status">
				<option value="0">注销</option>
				<option value="1" selected="selected">运行</option>
				<option value="2">暂停</option>
			</select><br/>
		<button type="button" id="btn-save">保存</button>
	</form>
	
	<script type="text/javascript" src="<%=path %>/static/jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">
		$("#btn-save").on("click",function(){
			$.ajax({
				url:"<%=path %>/user/add",
				data:{
					name : $("[name='name']").val(),
					sex : $("[name='sex']:checked").val(),
					age : $("[name='age']").val(),
					registerTime : $("[name='registerTime']").val()
				},
				success:function(data){
					if(data.result == "success"){
						alert("保存成功");
					}else{
						alert("保存失败")
					}
				}
			})
		})
	
	</script>
</body>
</html>