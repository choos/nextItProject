<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<%@include file="/WEB-INF/inc/common_header.jsp" %>
	<title>글삭제</title>
</head>
<body>
	<%@include file="/WEB-INF/inc/top_menu.jsp" %>
	<div class="container">
		<c:catch var="ex"> <!-- try catch랑 같은 것 -->
			<!-- 예외처리 (res > 0  -> OK)(else -> fail)-->
			<c:if test="${res > 0}">
				<div>
					<h3>게시글 삭제 성공</h3>
				</div>
				<div>
					<a href="userMain" class="btn btn-sm btn-default">게시목록</a>
				</div>
			</c:if>
			
			<c:if test="${res < 1}">
				<div>
					<h3>게시글 삭제 실패!!</h3>
				</div>
				<div>
					<a href="userMain" class="btn btn-sm btn-default">게시목록</a>
					<a href="#" class="btn btn-sm btn-primary" onclick="history.go(-1)">뒤로가기</a>
				</div>
			</c:if>	
		</c:catch>
		
		<c:if test="${not empty ex}">
			<div>
				<h3>게시글 삭제중 오류가 발생했어요...</h3>
				${ex.message}
			</div>
			<div>
				<a href="userMain" class="btn btn-sm btn-default">게시목록</a>
				<a href="#" class="btn btn-sm btn-primary" onclick="history.go(-1)">뒤로가기</a>
			</div>
		</c:if>
		
	</div>
</body>
</html>