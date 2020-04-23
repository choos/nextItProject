<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <%@include file="/WEB-INF/inc/common_header.jsp" %>
  <title>title</title>
  <style type="text/css">
 a.no-uline { text-decoration:none }
 .faqtd{ display:none;}
 #mycon{padding: 70px;}
  </style>
 <script type="text/javascript">
		$(document).ready(function() {
			$(".faqTitle").on("click", function() {
				num = $(this).data("num");
				$(".faqtd").css("display", "none");
				$("#" + num).css("display", "block");
			})
		})
	</script>
</head>
<body>
	<%@include file="/WEB-INF/inc/top_menu.jsp"%>
	<div class="container" id="mycon">
		<div class="row">
			<div class="col-md-9" role="main">
				<c:forEach items="${qnavo}" var="qan" varStatus="i">
						<div class="list-group">
							<a href="#" class="list-group-item faqTitle" data-num="${i.count}">
								${qan.qTitle} 답글여부:${qan.qAnswer}</a>
							<div class="faqtd" id="${i.count}" data-num="${i.count}" >
							<a href="#" class="list-group-item">
								질문내용:<br>${qan.qContent}
							<c:if test="${qan.qAnswer eq 'Y' }">
								답변내용:<br>${qan.reContent}
							</c:if>	
								</a>
							<c:if test="${qan.qAnswer eq 'N' }">
								<a class="btn btn-success" href="/QNA/QNAAnswer?qNum=${qan.qNum}">답변쓰기</a>
							</c:if>
							<c:if test="${qan.qAnswer eq 'Y' }">
								<a class="btn btn-success" href="/QNA/QNAAnswerEdit?qNum=${qan.qNum}">답변수정하기</a> 
							</c:if>
							</div>
						</div>
				</c:forEach>
			</div>
			<div class="col-md-3" role="complementary">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="/QNA/QNA">1:1문의 게시판</a></li>
					<li role="presentation" class="active"><a href="#">1:1관리자 게시판</a></li>
					<li role="presentation" ><a href="/FAQ/FAQ">FAQ</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>
 </html>