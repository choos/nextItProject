<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>공식 레시피</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/recipe.css" />
<style type="text/css">
#mainBody {
	padding: 60px 20px;
	text-align: center;
}

.imgDiv {
	display: inline-block;
}

.imgDiv img {
	width: 50px;
	height: 50px;
}

.imgDiv span {
	display: block;
}

.front img {
	width: 250px;
	height: 250px;
}

.content p {
	color: fa8072;
}

#homeImg {
	width: 50px;
	height: 50px;
}

.bs-docs-header {
	background-image:
		url("${pageContext.request.contextPath}/resources/image/93600.jpg");
	background-size: cover;
	/* 	opacity: 0.5; */
}

.bs-docs-section {
	text-align: center;
}

.carousel-item active {
	display: inline-block;
}

.itemInfoBox {
	display: inline-block;
}
</style>
<!-- 정적인 자원이 원격지(다른 컴퓨터)에 있는 경우
	이 경우는 좀 번거롭지만 정적인	자원의 경로 앞에
	원격지의 주소를 일일이 붙여주는 수 밖에 없다. -->
<%@include file="/WEB-INF/inc/top_menu.jsp"%>
</head>
<!--container->row->bs-docs-section  -->
<body>


	<!--메뉴바  -->
	<div class="bs-docs-header">
		<div class="container" id="mainBody">
			<!-- <form action="/market/marketView1" method="get"> -->

			<div>
				<span>메뉴</span>
			</div>
			<div class="imgDiv">
				<a href="mfMain?mfCategory="> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/ALL.png">
					<span>전체</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mfMain?mfCategory=간식/안주"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/beer.png">
					<span>간식/안주</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mfMain?mfCategory=식사"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/rice.png">
					<span>식사</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="mfMain?mfCategory=디저트"> <img alt=""
					src="${pageContext.request.contextPath}/resources/image/strawberry-cake.png">
					<span>디저트</span>
				</a>
			</div>
			<!-- 이미지 자식 div -->
			<!-- </form> -->
		</div>
		<!-- body 부모 dib  -->
		<!-- 검색창 -->
		<div class="bs-docs-section">
			<span> <img id="homeImg" alt=""
				src="${pageContext.request.contextPath}/resources/image/로고2.png">
				0Kcal
			</span>
			<form name="frm_search" action="mfMain" method="get"
				class="form-horizontal">
				<input style="size: 200px;" name="searchWord" class="searchWord"
					type="text" value="${searchVO.searchWord}"> 
				<input class="search" type="submit" value="검색">
			</form>
		</div>
	</div>
	<!-- bs-docs-header -->


	</div>


	<div class="container" id="mycon" style="padding-top: 100px;">
		<div id="wrapper">
			<!-- Main -->
			<div id="main">
				<div class="inner">
					<div style="text-align: center;">
						<img class="img-responsive" alt=""
							src="${pageContext.request.contextPath}/resources/image/mfboard.png">
					</div>
					<section class="tiles">
						<c:forEach items="${mfboard}" var="vo" varStatus="st">
							<article class="style1">
								<span class="image"> 
									<img alt=""
									src="${pageContext.request.contextPath}/resources/image/MF/${vo.mfNum}.jpg">
								</span> 
								<a href="<%=request.getContextPath()%>/mfboard/mfView?mfCode=${vo.mfCode}">
									<div class="content">
										<h3>${vo.mfName}</h3>
										<p>
											<b>${vo.mfCategory}</b>
										</p>
										<p>
											<b>추천수 : ${vo.mfLove}</b>
										</p>
									</div>
								</a>
							</article>
						</c:forEach>
					</section>
				</div>
			</div>
		</div>



	</div>

	<%-- <nav style="text-align: center;">
		<ul class="pagination" style="display: inline-block;">
			<li>
				<!-- 이전 페이지 -->
				<a href="mfMain?curPage=${(searchVO.firstPage ne 1) ? searchVO.firstPage-1 : 1}" aria-label="Previous">
	        <span aria-hidden="true">&larr;</span>
	      </a>
      </li>
			<li>
				<!-- 이전 페이지 하나씩-->
				<a href="mfMain?curPage=${searchVO.curPage>1 ? searchVO.curPage-1 : 1}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
      </li>
      		<!-- 페이지 넘버링 -->
			<c:forEach var="i" begin="${searchVO.firstPage}" end="${searchVO.lastPage}">
				<c:if test="${searchVO.curPage==i}">
					<li class="active"><a href="#" class="alink">${i}</a>
				</c:if>
				<c:if test="${searchVO.curPage ne i}">
					<li><a href="#"  class="alink" data-page="${i}" onclick="f_goPage(${i})">${i}</a>
				</c:if>
			</c:forEach>
			<li>
			<!-- 다음 페이지 하나씩 -->
	      <a href="mfMain?curPage=${searchVO.curPage<searchVO.totalPageCount?(searchVO.curPage+1):searchVO.totalPageCount}&searchWord=${searchVO.searchWord}&searchType=${searchVO.searchType}&searchCategory=${searchVO.searchCategory}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
    	</li>
    	<li>
    		<!-- 이전 페이지 -->
	      <a href="mfMain?curPage=${searchVO.lastPage<searchVO.totalPageCount?(searchVO.lastPage+1):searchVO.totalPageCount}" aria-label="Next">
	        <span aria-hidden="true">&rarr;</span>
	      </a>
    	</li>
		</ul>
	
	
</nav> --%>

</body>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>