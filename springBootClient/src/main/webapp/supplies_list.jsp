<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basepath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script>
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

//批量删除		
$("#delMore").click(function () {
	var bid= document.getElementsByName("bids");
	var arrId = new Array();//创建一个数组保存多个值
		for (var i = 0; i < bid.length; i++) {
		if (bid[i].checked) {
			arrId[i]=bid[i].value//获取当前选中的Id并保存到数组中
			}
		}
	if (arrId==null) {
		alert("请选择需要删除的数据")
	}else{
	var isDel=confirm('是否删除');
	if (isDel) {
		location.href="${pageContext.request.contextPath }/goods/delMore?ids="+arrId
		}
	}
})

$("#se").click(function () {
		var gname= $("#gname").val(); 
		var fid= $("#fid").val(); 
		var statePice= $("#start").val(); 
		var endPice= $("#end").val();
		window.location.href="${pageContext.request.contextPath }/goods/indexInfo?gname="+gname+"&fid="+fid+"&startPice="+statePice+"&endPice="+endPice
		})


});
//删除
function dele(ids){
		 var isDel=confirm('是否删除');
		 if (isDel) {
			return ture;
		}else {
			return false;
		} 
		}

//搜索
		function sendData(pageNum) {
			var pageSize= $("#pageSize").val(); //页容量
			var gname= $("#gname").val(); //昵称
			var fid= $("#fid").val();   //部门Id
			var statePice= $("#start").val(); //时间
			var endPice= $("#end").val();
			window.location.href="${pageContext.request.contextPath }/goods/indexInfo?pageIndex="+pageNum+"&pageSize="+pageSize
							+"&gname="+gname+"&fid="+fid+"&statePice="+statePice+"&endPice="+endPice
		}
		
		function pageData(num) {
			location.href="${pageContext.request.contextPath}/goods/indexInfo?pageIndex="+num;
		}
	

</script>
</head>
<body>

<h3  align="center">这里是book_list.jsp页面</h3>
<table border="1" width="800" cellspacing="0"  align="center">
<tr>
				<td colspan="7">物资名称:<input type="text" name="supplies_name">
					厂商:<select name="fid" id="fid">
						<option value="-1">-请选择-</option>
					<c:forEach items="${company}" var="company">
						<option value="${company.company_name}" >${company.company_name}</option>
					</c:forEach>						
					</select>
					价格:<input type="text" id="start" name="start">--
						<input type="text" id="end" name="end">
					<input type="button" value="搜索" id="se">
				</td>
	</tr>
	<tr>
	    <th><input type="checkbox" id="checkAll">全选</th>
		<td>物品名称</td>
		<td>规格</td>
		<td>数量</td>
		<td>单价</td>
		<td>厂商</td>
		<td>操作</td>
	</tr>
	
	<c:forEach items="${pagemsg.lists}" var="supplies" >
	<tr>
	<td><input type="checkbox" name="bids" value="${data.gid}"></td>
		<td>${supplies.supplies_name}</td>
		<td>${supplies.size}</td>
		<td>${supplies.num}</td>
		<td>${supplies.prize}</td>
		<td>${supplies.company_name}</td>
		<td><a href="${pageContext.request.contextPath }/goods/delMore?ids=${data.gid}" onclick="return dele(${data.gid})">删除</a>
			<a href="${pageContext.request.contextPath }/goods/queryAll?gid=${data.gid}">修改</a>
		</td>
	</tr>
	</c:forEach>
	
	<td class="td2" align="center">
 
 
   <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>  
   <span>总记录数：${requestScope.pagemsg.totalCount }  每页显示:${requestScope.pagemsg.pageSize}</span>  
   <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="${pageContext.request.contextPath }/supplies/main?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>  
       </c:if>
       
       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="${pageContext.request.contextPath }/supplies/main?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>  
           <a href="${pageContext.request.contextPath }/supplies/main?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>  
       </c:if>
   </span>
</td>
</table>
</body>
</html> 