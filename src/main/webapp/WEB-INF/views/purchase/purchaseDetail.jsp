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
<title>0kal 주문/배송 조회</title>
</head>

<body>
	<div class="container">
		<div class="page">
			<div class="page-header">
				<h1>상세 보기</h1>
			</div>
			<div class="row">
				<div class="col-sm-3 form-inline" style="margin-bottom: 5px;">
					<table class="table table-default">
						<c:forEach items="${list}" var="vo" varStatus="st">
							<tr>
								<td colspan="2"><h4>구매 정보</h4></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><img
									src="${vo.PImage}" width="150" height="150"
									style="margin: 10px;" border="0"></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td>${vo.PTitle }</td>
							</tr>
							<tr>
							<tr>
								<td>갯수</td>
								<td>${vo.PQuantity }개</td>
							</tr>
							<tr>
								<td>가격</td>
								<td>${vo.PPrice * vo.PQuantity + 3000}원</td>
							</tr>
							<tr>
								<td>받는 분</td>
								<td>${vo.PArriveName}</td>
							</tr>
							<tr>
								<td>배송지</td>
								<td>${vo.PArriveAdd1 } ${vo.PArriveAdd2 }</td>
							</tr>
							<tr>
								<td>메모</td>
								<td>${vo.PMemo }</td>
							</tr>
							<tr>
								<td>택배사</td>
								<td>${vo.PDelivery }</td>
							</tr>
							<tr>
								<td>송장번호</td>
								<td>${vo.PDeliberyNum }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div style="text-align: center;">
				<input type="button" class="btn btn-default" value="닫기"
					onclick="window.close()">
			</div>
		</div>
	</div>
</body>
</html>





