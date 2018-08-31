<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();
%>
</head>
<body>
	<form action="<%=path%>/role.add">
		角色名称：<input name="name" value=""> 备注：<input name="remarks"
			value=""> 日期：<input name="resgist-time" value="">
		<button id="btn-save" type="button">保存</button>
		<button id="btn-query" type="button">查询</button>
	</form>
	<div>已经保存的数据：</div>
	<div>
		<table id="role-table">
			<thead>
				<td><input type="checkbox" /></td>
				<td>id</td>
				<td>角色名称</td>
				<td>备注</td>
				<td>操作</td>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<script type="text/javascript"
		src="<%=path%>/static/jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript"
		src="<%=path%>/static/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		//Jquery选择器，#id, .class, html元素, [属性名=属性值],
		$("#btn-save").on("click", function() {
			$.ajax({
				url:"<%=path%>/role/add",
				data : {
					name : $("[name='name']").val(),
					remarks : $("[name='remarks']").val()
				},
				success : function(data) {
					if (data.resultCode == "200") {
						alert("新增成功");
						$("[name='name']").val("");
						$("[name='remarks']").val("")
						query();
					} else {
						alert("新增失败")
					}
				}
			});
		});
		
		//查询数据
		$("#btn-query").on("click",function(){
			query();
		});
		
		function query(){
			$.ajax({
				url:"<%=path%>/role/query",
						data : {
							name : $("[name='name']").val(),
							remarks : $("[name='remarks']").val()
						},
						success : function(data) {
							var html = "";
							$(data)
									.each(
											function() {
												debugger;
												html += "<tr>";
												html += "<td><input type='checkbox' value='"+this.id+"'/></td>";
												html += "<td>" + this.id
														+ "</td>";
												html += "<td>" + (this.name == null?'':this.name)
														+ "</td>";
												html += "<td>" + (this.remarks == null?'':this.remarks)
													+ "</td>";
												html += "<td><button class='btn-del' value='"+this.id+"'>删除</input></td>";
												html += "</tr>";
											})
							$("#role-table tbody").html(html);
						}
					});
		};

		//加载页面是自动加载数据
		query();
		
		//动态绑定事件
		$("#role-table").on("click",".btn-del",function(){
			var tr = $(this).parents("tr");
			$.ajax({
				url:"<%=path%>/role/delete",
				data : {
					id : $(this).val()
				},
				success : function(data) {
					if (data.result == "success") {
						//debugger;
						tr.remove();
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
				},
			})
		});

		//$("[name='resgist-time']").on("click",)
	</script>
</body>
</html>