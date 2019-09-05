<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	 $(function () {
			$("#register").click(function () {
				 var formData = new FormData($("#itemForm")[0]);
					$.ajax({
						url:"${pageContext.request.contextPath}/user/register",
						data:formData,
						type:"post",
						dataType:"json",
						processData: false,
						contentType: false,
						success:function(data){
								if (data.success=="success") {
									$("#re").text("注册成功!")
									window.location.href="${pageContext.request.contextPath}/login.jsp";
								}else{
									$("#re").text(data.msg)
								} 
						}
				})
			})
	}); 

</script>

</head>
<body>	
	<h4 align="center">用户注册</h4>
		<div align="center"><span id="re" style="color: red;align-content: center;"></span></div>
		<form id="itemForm"  enctype="multipart/form-data">

		<table align="center" border="0">
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password" ></td>
			</tr>
			<tr>
				<td>姓名:</td>
				<td><input type="text" name="name" ></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td><input type="radio" name="sex"  value="男">男<input type="radio" name="sex" value="女">女
				</td>
			</tr>
			<tr>
				<td>年龄:</td>
				<td><input type="number" name="age" ></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="button" value="注册" id="register"></td>
			</tr>
		</table>
	</form>
</body>
</html>