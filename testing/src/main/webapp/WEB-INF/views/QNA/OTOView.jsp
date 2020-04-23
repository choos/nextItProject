<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<%@include file="/WEB-INF/inc/top_menu.jsp"%>
<title>title</title>
<style type="text/css">
#mycon {
	margin: 100px;
}
</style>
</head>
<body>
	<div class="container text-center" id="mycon">
		<div class="row">
			<div class="col-md-1 col-md-offset-1 text-right">제목</div>
			<div class="col-md-3">
				<input type="text" class="form-control input-sm" value="${qanvo.reTitle}" readonly="readonly">
			</div>
		</div>
		<div class="row">
			<div class="col-md-2 text-right">작성날짜</div>
			<div class="col-md-3">
				<input type="text" class="form-control input-sm" value="${qanvo.reRegDate}" readonly="readonly">
			</div>
			<div class="col-md-1 col-md-offset-1 text-right">아이디</div>
			<div class="col-md-3">
				<input type="text" class="form-control input-sm" value="0Kcal" readonly="readonly">
			</div>
		</div>
		<div class="row">
			<div class="col-md-1 col-md-offset-1 text-right">내용</div>
			<div class="col-md-8" >
			<div class="bg-info" style="border-radius:5px;">${qanvo.reContent}</div>
			</div>
		</div>
	</div>
	<!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>
</html>