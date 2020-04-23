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
<title>장바구니 목록 - 관리자</title>
</head>
<body>
	<div class="container" style="width: 500px">
		<div class="page">
			<div class="col-sm-3 form-inline"
				style="margin-top: 30px; vertical-align: middle;">
				<table class="table table-default"
					style="width: 470px; text-align: center;">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="50%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>
					<tr>
						<td colspan="5"><h4>장바구니 정보</h4></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2">상품명</td>
						<td>개수</td>
						<td>가격</td>
					</tr>
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="vo" varStatus="st">

							<tr id="${vo.sCSCode}">
								<th><div class="checkbox"
										style="text-align: center; width: 44px; height: 86px;">
										<input name="deleteYN" type="checkbox" value="${vo.sCSCode}">
									</div></th>
								<td style="text-align: center;"><img src="${vo.sMainIMG}"
									width="50" height="50" style="margin: 10px;" border="0"></td>
								<td>${vo.sTitle }</td>
								<td>${vo.sCQuantity }<input type="hidden" name="quanty"
									value="${vo.sCQuantity }">
								</td>
								<td>${vo.sCQuantity*vo.sPrice}원</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5"><h3 id="nullDdary">장바구니가 비었어용!</h3></td>
						</tr>
					</c:if>
				</table>
				<div>
					<div id="values" style="display: inline-block;">
						<form <%-- action="showCart" --%> id="deleteWant"
							name="deleteWant" method="POST">
							<input type="button" class="btn btn-primary" value="구매하기"
								style="display: inline;" onclick="checkDelete(2)"> <input
								type="button" class="btn btn-danger" name="btn" value="삭제"
								onclick="checkDelete(1)" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>





