<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>title</title>
<style type="text/css">
a.no-uline {
	text-decoration: none
}

.faqtd {
	display: none;
}

#mycon {
 	min-height: 100%;
	padding: 80px;
	padding-bottom: 20%; /* footer height */
	margin: 0 auto -221px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".faqTitle").on("click", function() {
			num = $(this).data("num");
			$(".faqtd").css("display", "none");
			$("#" + num).css("display", "block");
		})

		function admin() {
			userId = $("#userId").val();
			console.log('userId', userId);
			if (userId == "ADMIN") {
				$(".admin").css("display", "block");
			}else {
				$(".admin").css("display", "none");
			}
		}
		
		$(".seleActive").on("click", function () {
			$(this).css("background-color", "#f0ad4e");
		})
		
		admin();

	})//ready
</script>
</head>
<body>
	<%@include file="/WEB-INF/inc/top_menu.jsp"%>
	<div class="container" id="mycon">
	<input type="hidden" id="userId" value="${user.userId}">
		<div class="row">
			<div class="col-md-9" role="main">
				<ul class="nav nav-pills">
					<li role="presentation"><a href="/FAQ/FAQ?faCategory=FC0" class="seleActive">전체</a></li>
					<li role="presentation"><a href="/FAQ/FAQ?faCategory=FC01" class="seleActive">배송문의</a></li>
					<li role="presentation"><a href="/FAQ/FAQ?faCategory=FC02" class="seleActive">취소/교환/반품</a></li>
					<li role="presentation"><a href="/FAQ/FAQ?faCategory=FC03" class="seleActive">환불관련</a></li>
					<li role="presentation"><a href="/FAQ/FAQ?faCategory=FC04" class="seleActive">주문/결제</a></li>
					<li role="presentation"><a href="/FAQ/FAQ?faCategory=FC05" class="seleActive">회원관련</a></li>
				</ul>
			<div class="panel panel-default">
				<c:forEach items="${faqvo}" var="faq" varStatus="i">
					<div class="list-group">
					<!-- 제목목록 -->
						<div class="faqTitle" id="li${i.count}" data-num="${i.count}">
							<a href="#"  class="list-group-item">${faq.faTitle}</a>
						</div>
					<!-- 제목목록 -->
						<div class="faqtd" id="${i.count}" data-num="${i.count}">
							<a href="#" class="list-group-item">${faq.faContent}</a>
							<div class="admin">
								<a class="btn btn-info" role="button" href="FAQFrom">글쓰기</a>
								<a class="btn btn-warning" role="button" href="FAQEdit?faNum=${faq.faNum}">수정하기</a>
								<a class="btn btn-danger" role="button" href="FAQDelet?faNum=${faq.faNum}">삭제하기</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

			<div class="col-md-3" role="complementary">
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="/QNA/QNA">1:1문의 게시판</a></li>
					<li class="admin" role="presentation" ><a href="/QNA/OTO">1:1관리자 게시판</a></li>
					<li role="presentation" class="active"><a href="#">FAQ</a></li>
				</ul>

			</div>
		</div>
	</div>
	<!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>
</html>