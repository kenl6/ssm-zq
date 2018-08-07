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
<script type="text/javascript" src="<%=path %>/static/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/static/bootstrap/js/bootstrap-table.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/static/bootstrap/css/bootstrap.css"></link>
</head>
<body>
	<form action="">
		人员姓名：<input type="text" name="name"><br/>
		性       别：<input type="radio" name="sex" value="0" checked="checked">男</input> <input type="radio" name="sex" value="1">女</input><br/>
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
	<div></div>
	<div>
		<table class="table" id="user-table">
			<thead class="thead">
				<tr class="tr">
					<td>人员姓名</td>
					<td>性       别</td>
					<td>年       龄</td>
					<td>密       码</td>
					<td>注册日期</td>
					<td>备       注</td>
					<td>状       态</td>
					<td>操       作</td>
				</tr>	
			</thead>
			<tbody class="tbody">
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		$("#btn-save").on("click",function(){
			$.ajax({
				url:"<%=path %>/user/add",
				data:{
					name : $("[name='name']").val(),
					sex : $("[name='sex']:checked").val(),
					age : $("[name='age']").val(),
					password : $("[name='password']").val(),
					registerTime : $("[name='registerTime']").val(),
					remarks : $("[name='remarks']").val(),
					status : $("[name='status']").val()					
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
		
		
		function init(){
			$("#user-table").bootstrapTable({
				columns:[{
					field : "id",
					sortable : true,
					sorOrder : "asc",
					title : "id",
					align : "center",
				},
				{
					field : "name",
					sortable : true,
					sorOrder : "asc",
					title : "姓名",
					align : "center",
				},
				{
					field : "sex",
					sortable : true,
					sorOrder : "asc",
					title : "性别",
					align : "center",
				},
				{
					field : "age",
					sortable : true,
					sorOrder : "asc",
					title : "年龄",
					align : "center",
				},
				{
					field : "password",
					sortable : true,
					sorOrder : "asc",
					title : "密码",
					align : "center",
				},
				{
					field : "register-time",
					sortable : true,
					sorOrder : "asc",
					title : "注册日期",
					align : "center",
				},
				{
					field : "remarks",
					sortable : true,
					sorOrder : "asc",
					title : "备注",
					align : "center",
				},
				{
					field : "status",
					sortable : true,
					sorOrder : "asc",
					title : "状态",
					align : "center",
				}
				]
			})
		}
		
		
		function query(){
			$.ajax({
				url:"<%=path %>/user/query",
				data:{
					name:$("[name='name']").val()
				},
				succecc:function(data){
					if(data.result=="success"){
						
					}
				}
			})
		}
	
	</script>
</body>
</html>