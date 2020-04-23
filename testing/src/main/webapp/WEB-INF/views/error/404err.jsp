<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@include file="/WEB-INF/inc/common_header.jsp" %>
  <title>title</title>
  <style type="text/css">
  .backImage {
	width: 100%;
	min-height: 100%;
	text-align: center;
	position: relative;
	z-index: 1;
}

.backImage::after {
	content: "";
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	min-height: 100%;
	background:
		url("${pageContext.request.contextPath}/resources/image/93608.jpg");
	background-size: cover;
	opacity: 0.5;
	z-index: -1;
}
  #mycon {
  	text-align:center;
 	min-height: 100%;
	padding-top: 100px;
	padding-bottom: 50%; /* footer height */
	margin: 0 auto 10px;
	position: relative;
}
  </style>
</head>
<body>
 <%@include file="/WEB-INF/inc/top_menu.jsp" %>
 <div class="backImage">
 <div class="container" id="mycon">
 <div class="col-md-12 page-404">
        <h1><c:out value="${error.STATUS_CODE }" /></h1>
        <div class="details">
            <h3>${error.MESSAGE }</h3>
            <p>
              <a href="<c:url value='/home/home'/>"> [HOME] </a>을 클릭하시면, 홈으로 돌아갑니다.   
            </p>
        </div>
    </div>
 </div>
 </div>
 	<!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
 </body>
 </html>