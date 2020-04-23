<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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

#mycontainer {
	min-height: 100%;
	margin: 0 auto 10px;
	position: relative;
}
</style>
<script type="text/javascript">
//함수를 연결 크게 2개
//1. 해당 엘리먼트에서 이벤트(click , change ,submit)에서 함수 직접 call
//2. 해당 엘리먼트에 이벤트리스너를 설정
	function fn_goPage() {
		var fs= document.forms["frm_care"];/*페이징 form 변수에 담기 */
		fs.curPage.value = this.dataset.page;/*페이징 form 안에 있는 input 값 가져옴  */
		console.log("fn_goPage call",this.dataset.page);
		fs.submit();
	}
	//스크립트가 위에 있으면 동작에 문제가 생김
	window.onload=function(){
	document.querySelectorAll(".pagination li a[data-page]").forEach(obj =>{obj.addEventListener('click', fn_goPage);});
}
</script>
</head>
 <%@include file="/WEB-INF/inc/top_menu.jsp" %>
<body>
	<div class="backImage">
		<div class="container" id="mycontainer"
			style="margin-top: 80px; text-align: center;">
			<form action="homeSearchView" method="post" class="form-horizontal"
				name="frm_care" id="frm_care">
				<div class="col-sm-2 form-inline" style="padding: 0px;">
					전체 ${searchVO.totalRowCount}건
				</div>
				<input type="text" value="${searchVO.searchType}" name="searchType"	hidden="">
				<input type="text" value="${searchVO.searchWord}" name="searchWord" hidden="">
				<input id="id_curPage" name="curPage" value="${searchVO.curPage}" hidden="">
				<input name="rowSizePerPage" value="${searchVO.rowSizePerPage}" hidden="">
			</form>
			<c:if test="${not empty wordNull}">
				<h1>검색어가 입력되지 않았습니다.</h1>
				<a href="home">홈으로 돌아가기</a>
			</c:if>
				<!--UFSearch  -->
				<c:if test="${not empty UFSearch}">
					<div class="col-md-9" role="main">
						<c:forEach var="se" items="${UFSearch}" varStatus="num">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<c:if test="${fn:contains(se.ufImg1, '.png')}">
										<img alt="" src="${se.ufImg1}"
											style="height: 210px; width: 210px;">
									</c:if>
									<c:if test="${not fn:contains(se.ufImg1, '.png')}">
										<c:if test="">
											<img alt=""
												src="${pageContext.request.contextPath}/resources/image/UF/${ma.ufCode}.jpg"
												style="height: 210px; width: 210px;">
										</c:if>
										<img alt=""
											src="${pageContext.request.contextPath}/resources/image/noIMG.jpg"
											style="height: 210px; width: 210px;">
									</c:if>
									<div class="caption" style="height: 180px;">
										<h3>${se.ufTitle}</h3>
										<p>
											레시피 조회수 : ${se.ufHit} <br> 레시피 추천수 : ${se.ufLove}
										</p>
									</div>
									<p>
										<a href="/user/userView?ufCode=${se.ufCode}"
											class="btn btn-primary" role="button"> <span
											class="glyphicon glyphicon-grain" aria-hidden="true"></span>
											레시피보러가기
										</a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<!--UFSearch  -->
				<!--SBSearch  -->
				<c:if test="${not empty SBSearch}">
					<div class="col-md-9" role="main">
						<c:forEach var="se" items="${SBSearch}" varStatus="num">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<img alt="" src="${se.sMainImg}"
										style="height: 210px; width: 210px;">
									<div class="caption" style="height: 180px;">
										<h3>${se.sTitle}</h3>
										<p>
											가격 :
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${ma.sPrice}" />
											원<br> 추천수 : ${se.srLove}
										</p>
									</div>
									<p>
										<a href="/market/marketView1?sCode=${se.sCode}"
											class="btn btn-primary" role="button"> <span
											class="glyphicon glyphicon-grain" aria-hidden="true"></span>
											판매상품보러가기
										</a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
					<!--SBSearch  -->
				</c:if>
				<!--MFSearch  -->
				<c:if test="${not empty MFSearch}">
					<div class="col-md-9" role="main">
						<c:forEach var="se" items="${MFSearch}" varStatus="num">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<img alt="" src="/resources/image/MF/${se.mfNum}.jpg"
										style="height: 210px; width: 210px;">
									<div class="caption" style="height: 180px;">
										<h3>${se.mfName}</h3>
										<p>
											레시피 조회수 : ${se.mfHit} <br> 레시피 추천수 : ${se.mfLove}
										</p>
									</div>
									<p>
										<a href="/mfboard/mfView?mfCode=${se.mfCode}"
											class="btn btn-primary" role="button"> <span
											class="glyphicon glyphicon-grain" aria-hidden="true"></span>
											레시피보러가기
										</a>
									</p>
								</div>
							</div>
						</c:forEach>
					</div>
					<!--MFSearch  -->
				</c:if>
			</div>
		<!-- 페이징 -->
		<div class="container">
			<nav>
				<ul class="pagination">
					<!--이전 페이지-->
					<c:if test="${searchVO.firstPage > 1 }">
						<li><a href="careFridgeView?curPage=${searchVO.firstPage-1}"
							data-page="${searchVO.firstPage-1}" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<!-- 페이지 넘버링-->
					<c:forEach var="i" begin="${searchVO.firstPage}"
						end="${searchVO.lastPage}">
						<c:if test="${searchVO.curPage eq i}">
							<!-- == eq  -->
							<li class="active"><a href="#">${i}</a></li>
						</c:if>
						<c:if test="${searchVO.curPage ne i}">
							<!-- != ne  -->
							<li class=""><a href="#" data-page="${i}">${i}</a>
						</c:if>
					</c:forEach>

					<!-- 다음 페이지 -->
					<c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
						<li><a href="homeSearchView?curPage=${searchVO.lastPage+1}"
							data-page="${searchVO.lastPage+1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<!--foot  -->
<%@include file="/WEB-INF/inc/foot1.jsp"%>
 </body>
 </html>