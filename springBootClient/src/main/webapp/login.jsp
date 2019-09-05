<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<script type="text/javascript" src="/jsp/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	$(function () {
			$("#findname").change(function () {
				var username=$('input[name="username"]').val();
				$.ajax({
					url:"${pageContext.request.contextPath}/user/findUserByUname",
					data:"username="+username,
					type:"post",
					dataType:"json",
					success:function(re){
						console.log(re);
					 	if (re.success=="success") {
					 		$("#re").text()
						}else{
							$("#re").text(re.msg)
						} 
					}
					
				})
			}); 
			$("#login").click(function () {
				var username=$('input[name="username"]').val();
				var password=$('input[name="password"]').val();
				$.ajax({
					url:"${pageContext.request.contextPath}/user/login",
					data:"username="+username+"&password="+password,
					type:"post",
					dataType:"json",
					success:function(re){
						console.log(re);
					 	if (re.success=="success") {
					 		/* window.location.href="${pageContext.request.contextPath}/user/register.action"; */
						}else{
							$("#re").text(re.msg)
						} 
					}
					
				})
			});

	/* 注册 */
		$("#register").click(function () {
			window.location.href="${pageContext.request.contextPath}/register.jsp";
		});
				
	});
	</script>
</head>
<body>
		<h4 align="center">用户登录</h4>
		<div align="center"><span id="re" style="color: red;align-content: center;"></span></div>
		<table align="center" border="0">
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="username" id="findname"></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="登录" id="login"></td>
				<td align="left"><input type="button" value="注册" id="register"></td>
			</tr>
		</table>
</body>
</html>