<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@include file="/WEB-INF/inc/common_header.jsp" %>
  <title>title</title>
  <style type="text/css">
 a.no-uline{text-decoration:none }
 #mycon{
 	min-height: 100%;
	padding-bottom: 50%; /* footer height */
	margin: 0 auto -221px;
	padding-top: 130px;"
}
  </style>
 <script type="text/javascript">
  $(document).ready(function() {
	  
	 userId = $("#userId").val();
	 console.log('userId', userId);
	 console.log('userId.length', userId.length);
	 
 	$(".qnaForm").on("click", function() {
 		if (userId.length != 0) {
 			
 		 $(".qnaForm").attr("href", "QNAFrom"); 
		}else {
			alert("로그인 하신 후에 이용해주세요");
		}
	})
 	
 	function admin() {
		if (userId == "ADMIN") {
			console.log($("#admin"));
			$("#admin").css("display","block");
		}else {
			$("#admin").css("display","none");
		}
	}
 	
	admin();
	
 })//ready
 </script>
</head>
<body>
	<%@include file="/WEB-INF/inc/top_menu.jsp"%>
	<div class="container" id="mycon">
	<%@include file="/WEB-INF/inc/side_bar.jsp"%>
		<div class="row" style="display: inline-block; width: 800px; margin-left: 150px;">
		<input id="userId" type="hidden" value="${user.userId}">
			<div class="col-md-9" role="main">
				<ul class="nav nav-pills">
					<li role="presentation"><a href="/QNA/QNA?qCategory=QC0">전체</a></li>
					<li role="presentation"><a href="/QNA/QNA?qCategory=QC01">배송문의</a></li>
					<li role="presentation"><a href="/QNA/QNA?qCategory=QC02">취소/교환/반품</a></li>
					<li role="presentation"><a href="/QNA/QNA?qCategory=QC03">환불관련</a></li>
					<li role="presentation"><a href="/QNA/QNA?qCategory=QC04">주문/결제</a></li>
					<li role="presentation"><a href="/QNA/QNA?qCategory=QC05">회원관련</a></li>
				</ul>
				<table class="table table-hover">
					<c:forEach items="${qanVO}" var="qan" varStatus="i">
						<tr>
							<th class="faqTitle"><a class="qanView" data-num="${qan.qNum}" href="<c:url value='/QNA/QNAView?qNum=${qan.qNum}'/> ">${qan.qTitle}</a></th>
							<th class="faqTitle">${qan.qMId}</th>
						</tr>
						<c:if test="${qan.qAnswer eq 'Y'}">
							<tr>
								<td><span class="label label-warning">+RE</span>
									<a class="otoView" data-num="${qan.qNum}" href="/QNA/OTOView?qNum=${qan.qNum}">${qan.reTitle}</a></td>
								<td>
									<img alt="Brand" src="/resources/image/로고2.png" style="height: 10px; width: 10px;">0Kcal
								</td>
							</tr>						
						</c:if>
					</c:forEach>
				</table>
				<a class="btn btn-info qnaForm" href="#">글쓰기</a>
			</div>
			<div class="col-md-3" role="complementary">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a href="#">1:1문의 게시판</a></li>
					<li id="admin" role="presentation" ><a href="/QNA/OTO">1:1관리자 게시판</a></li>
					<li role="presentation" ><a href="/FAQ/FAQ">FAQ</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>
 </html>