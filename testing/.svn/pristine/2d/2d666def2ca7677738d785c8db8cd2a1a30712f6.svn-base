<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/WEB-INF/inc/common_header.jsp" %>
	<title></title>
</head>
<body>
<%@include file="/WEB-INF/inc/top_menu.jsp" %>
<div class="container">

<div class="container">
<jsp:useBean id="mypage" class="com.zero.myPage.vo.MyPageVO"/>
<jsp:setProperty property="*" name="mypage"/>
<c:catch var="ex">
<%
	/* IFreeBoardDao freeDao = new FreeDaoOracle();
	int res = freeDao.updateBoard(free);
	request.setAttribute("res", res); */
	%>
	<c:if test="${res>0 }">
		<div>
			<h3>회원정보 수정 성공</h3>
		</div>
		<div>
			<a href="userMain" class="btn btn-sm btn-default">게시물 목록</a>
		</div>
	</c:if>
	<c:if test="${res<1 }">
		<div>
			<h3>회원정 수정 실패 </h3>
		</div>
		<div>
			<a href="userMain" class="btn btn-sm btn-default">게시물 목록</a>
			<a href="#" onclick="history.go(-1)">뒤로가기</a>
		</div>
	</c:if>
</c:catch>
<c:if test="${not empty ex}">
	<div>
		<h3>회원정보 수정 도중 오류가 발생했어요...</h3>
		${ex.message}
	</div>
	<div>
		<a href="userMain" class="btn btn-sm btn-default">게시물 목록</a>
		<a href="#" onclick="history.go(-1)" class="btn btn-sm btn-default">뒤로가기</a>
	</div>
</c:if>
</div>


</div>
</body>
</html>