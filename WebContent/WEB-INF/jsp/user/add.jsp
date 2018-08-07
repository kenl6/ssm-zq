<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
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
<script type="text/javascript"
	src="<%=path%>/static/jquery/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/bootstrap/css/bootstrap.min.css"></link>
</head>
<body>
<div>
	<form action="" class="form-horizontal">
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">人员姓名</label>
			<div class="col-sm-2">
				<input type="text" name="name" class="form-control" id="inputName">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputSex" class="col-sm-2 col-form-label">性别</label>
			<div class="form-check-inline">
				<input class="form-check-input" type="radio" name="sex" value="0"
					checked="checked"> <label class="form-check-label">
					男 </label> <input class="form-check-input" type="radio" name="sex"
					value="1"> <label class="form-check-label">
					女 </label>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputAge" class="col-sm-2 col-form-label">年龄</label>
			<div class="col-sm-2">
				<input type="text" name="age" class="form-control" id="inputAge">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPass" class="col-sm-2 col-form-label">密码</label>
			<div class="col-sm-2">
				<input type="text" name="password" class="form-control" id="inputPass">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputDate" class="col-sm-2 col-form-label">注册时间</label>
			<div class="col-sm-2">
				<input type="text" name="registerTime" class="form-control" id="inputDate">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputRemarks" class="col-sm-2 col-form-label">备注</label>
			<div class="col-sm-2">
				<input type="text" name="remarks" class="form-control" id="inputRemarks">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputStatus" class="col-sm-2 col-form-label">备注</label>
			<div class="col-sm-2">
				<select name="status" class="form-control" id="inputStatus">
				<option value="0">注销</option>
				<option value="1" selected="selected">运行</option>
				<option value="2">暂停</option>
			</div>
		</div>
		<button type="button" id="btn-save" class="btn">保存</button>
		<button type="button" id="btn-query" class="btn">查询</button>
	</form>
	</div>
	<div>
		<table class="table" id="user-table">
			<thead class="thead">
				<tr class="tr">
					<td>选择</td>
					<td>ID</td>
					<td>人员姓名</td>
					<td>性 别</td>
					<td>年 龄</td>
					<td>密 码</td>
					<td>注册日期</td>
					<td>备 注</td>
					<td>状 态</td>
					<td>操 作</td>
				</tr>
			</thead>
			<tbody class="tbody">
			</tbody>
		</table>
	</div>


	<script type="text/javascript">
		$("#btn-save").on("click",function(){
			$.ajax({
				url:"<%=path%>/user/add",
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
		
		query();
		
		function query(){
			$.ajax({
				url:"<%=path%>
		/user/query",
						data : {
							name : $("[name='name']").val()
						},
						success : function(data) {
							var html = "";
							$(data)
									.each(
											function() {
												debugger;
												html += "<tr class='tr'>";
												html += "<td><input type='checkbox' value='"+this.id+"'/></td>";
												html += "<td>" + this.id
														+ "</td>";
												html += "<td>"
														+ (this.name == null ? ''
																: this.name)
														+ "</td>";
												html += "<td>"
														+ (this.sex == 0 ? '男'
																: '女')
														+ "</td>";
												html += "<td>"
														+ (this.age == null ? ''
																: this.age)
														+ "</td>";
												html += "<td>"
														+ (this.password == null ? ''
																: this.password)
														+ "</td>";
												html += "<td>"
														+ (this.registerTime == null ? ''
																: this.registerTime)
														+ "</td>";
												html += "<td>"
														+ (this.remarks == null ? ''
																: this.remarks)
														+ "</td>";
												html += "<td>"
														+ (this.remarks == 0 ? '注销'
																: (this.remarks == 1 ? '运行'
																		: '暂停'))
														+ "</td>";
												html += "<td><button class='btn-del' value='"+this.id+"'>删除</input></td>";
												html += "</tr>";
											})
							$("#user-table tbody").html(html);
						}
					})
		}
	</script>
</body>
</html>