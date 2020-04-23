<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<%@include file="/WEB-INF/inc/top_menu.jsp"%>
<title>0kal 주문/배송 조회</title>
</head>

<body>
	<div class="container" style="margin-top: 130px; margin-bottom: 200px">
		<%@include file="/WEB-INF/inc/side_bar.jsp"%>
		<div class="page"
			style="display: inline-block; width: 800px; margin-left: 150px;">
			<div class="page-header">
				<h1>주문/결제</h1>
			</div>
			<div class="row">
				<div class="col-sm-3 form-inline" style="margin-bottom: 5px;">
					<h2 style="text-align: center;">구매 성공!</h2>
					<table class="table table-default" style="width: 800px;">
						<tr>
							<td colspan="2"><h4>구매 정보</h4></td>
						</tr>
						<tr>
							<td>구매자</td>
							<td>${mem.memName}</td>
						</tr>
						<tr>
							<td>배송지</td>
							<td>${vo.PArriveAdd1}${vo.PArriveAdd2 }</td>
						</tr>
						<tr>
							<td>갯수</td>
							<td id="quantity"><c:forEach items="${quanty}" var="quanty"
									varStatus="st">
									<input type="hidden" value="${quanty}" id="${st.count}qty">
									<c:if test="${st.last}">
										<div>
											<input type="hidden" id="lastIndex" value="${st.count}">
										</div>
									</c:if>
								</c:forEach></td>
						</tr>
						<tr>
							<td>가격</td>
							<td>${vo.PPayMoney }</td>
						</tr>
					</table>
				</div>
			</div>
			<input type="button" class="btn btn-default" value="홈페이지"
				onclick="location.href = '/home/home'"> <input type="button"
				class="btn btn-default" value="상품 목록"
				onclick="location.href = '/market/mm'">

		</div>
	</div>
</body>
<script>
	var total = 0;
	var last = document.getElementById("lastIndex").value;
	for (var i = 1; i <= last; i++) {
		var name = "";
		name += i;
		name += "qty";
		total += (document.getElementById(name).value) * 1;
	}
	document.getElementById("quantity").innerHTML = total;
</script>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>





