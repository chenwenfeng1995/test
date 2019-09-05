<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书籍信息</title>

<style type="text/css">
	a:hover {
		color: red;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
		$(function () {
		
			//跳转页码
			$("#jump").click(function () {
				var jumpNum=$("#jumpNum").val();
				var pageMax=$("#pageMax").val();
				var a=parseInt(jumpNum)
				var b=parseInt(pageMax)
				if (parseInt(jumpNum)>parseInt(pageMax)) {
						alert("页码超范围")
						pageData(1);
				}else{
					pageData(jumpNum);
				}
			})
			
			//全选
			$("#checkAll").click(function () {
				if ($(this).attr("checked")) {
		            $("input[name=bids]").each(function() {
		                $(this).attr("checked", true);
		            });
		        } else {
		            $("input[name=bids]").each(function() {
		                $(this).attr("checked", false);
		            });
		        }
			})
			//删除
			$("#delOne").click(function{
				var bid = 
				location.href="${pageContext.request.contextPath}/book/del.action?="+;
			})
			
			//批量删除
			$()
			
		});
		
		
		//分页
		function pageData(num) {
			location.href="${pageContext.request.contextPath}/book/pageIndex.action?pageIndex="+num;
		}
	

</script>


</head>
<body>
	<table align="center" border="0">
			<tr>
				<td>物资名称:<input type="text">
					厂商:<select>
						<option>-请选择-</option>						
					</select>
					价格:<input type="text">--<input type="text">
				</td>
			</tr>
			<tr>
				<th><input type="checkbox" id="checkAll">全选</th>
				<th>用户名</th>
				<th>物资规格编号</th>
				<th>物资名称</th>
				<th>物资数量</th>
				<th>物资单价</th>
				<th>生产厂商</th>
				<th>操作</th>
			</tr>
				<c:forEach items="${books}" var="book">
			<tr>
				<td><input type="checkbox" name="bids" value="${book.bId }"></td>
				<td>${book.bId }</td>
				<td><a href="" style="text-decoration: none;">${book.bname }</a></td>
				<td>${book.img}</td>
				<td>${book.author }</td>
				<td>${book.price }</td>
				<td><f:formatDate  value="${book.publishDate }" pattern="yyyy-MM-dd"/></td>
				<td><input type="button" value="删除" id="delOne"></td>
			</tr>
				</c:forEach>
				
			<tr>
				<td><input type="button" value="批量删除" id="delMore"></td>
				<td>
				<input type="hidden" id="pageMax" value="${page.totalPage}">
				<c:choose>
					<c:when test="${page.pageIndex>1}">
						<a href="javaScript:void(0)" onclick="pageData(1)">首页</a>
						<a href="javaScript:void(0)" onclick="pageData(${page.pageIndex-1})">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="javaScript:void(0)">第一页</a>
					</c:otherwise>
				</c:choose>
				
		<c:choose>
			<c:when test="${page.totalPage<=3 }">
				<c:set var="start" value="1" />
				<c:set var="end" value="${page.totalPage}" />
			</c:when>
			<c:otherwise>
				<c:set var="start" value="${page.pageIndex - 1 }" />
				<c:set var="end" value="${page.pageIndex + 1}" />

				<c:if test="${start < 1 }">
					<c:set var="start" value="1" />
					<c:set var="end" value="${start + 2}" />
				</c:if>
				<c:if test="${end > page.totalPage}">
					<c:set var="end" value="${page.totalPage }" />
					<c:set var="start" value="${end - 2 }" />
				</c:if>
			</c:otherwise>
		</c:choose>
		<c:forEach begin="${start }" end="${end }" var="i">
			<c:choose>
				<c:when test="${page.pageIndex==i }">
					<a href='pageIndex.action?pageIndex=${i}' target='_self'><span
						id="pag">${i }</span></a>
				</c:when>
				<c:otherwise>
					<a href='pageIndex.action?pageIndex=${i}' target='_self'>${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>		
		
				<c:choose>
					<c:when test="${page.pageIndex<page.totalPage}">
						<a href="javaScript:void(0)" onclick="pageData(${page.pageIndex+1})">下一页</a>
						<a href="javaScript:void(0)" onclick="pageData(${page.totalPage})">尾页</a>
					</c:when>
					<c:otherwise>
						<a href="javaScript:void(0)">最后一页</a>
					</c:otherwise>
				</c:choose>
					跳转<input id="jumpNum" type="tel" style="width:20px "  value="${page.pageIndex }">页<input id="jump" type="button" value="跳转" >
				</td>
			</tr>
		</table>
</body>
</html>