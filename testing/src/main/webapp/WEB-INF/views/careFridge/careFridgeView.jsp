<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<div class="container" id="mycontainer" style="margin-top:80px ;text-align: center;">
  	<form action="careFridgeView" method="post" class="form-horizontal" name="frm_care" id="frm_care">
 	<div class="col-sm-2 form-inline" style="padding: 0px;">
		전체 ${searchVO.totalRowCount}건
	</div> 
		<input type="text" value="${searchVO.foodNameList}" name="foodNameList" hidden="">
  		<input id="id_curPage" name="curPage" value="${searchVO.curPage}" hidden="">
  		<input  name="rowSizePerPage" value="${searchVO.rowSizePerPage}" hidden="">
	</form> 
		<div class="col-md-9" role="main">
			<c:forEach var="food" items="${foodNameList}" varStatus="num">
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
					<c:if test="${fn:contains(food.ufImg1, '.png')}">
						<img alt="" src="${food.ufImg1}" style="height: 210px; width: 210px;">
					</c:if>
					<c:if test="${not fn:contains(food.ufImg1, '.png')}">
						<img alt="" src="${pageContext.request.contextPath}/resources/image/noIMG.jpg" style="height: 210px; width: 210px;">
					</c:if>
			     	<div class="caption" style="height: 180px;">
			        	<h3>${food.ufTitle}</h3>
			        	<p>	레시피 조회수 : ${food.ufHit} <br>
							레시피 추천수 : ${food.ufLove} </p>
			      	</div>
			        <p><a href="/user/userView?ufCode=${food.ufCode}" class="btn btn-primary" role="button">
			        	<span class="glyphicon glyphicon-grain" aria-hidden="true"></span>
			        	레시피보러가기
			        </a></p>
			    </div>
			  </div>
			</c:forEach>
		</div>
	</div>
	<div class="container" id="mycontainer" style="margin-top:80px ;text-align: center;">
	<!-- 페이징 -->
	<nav>
		<ul class="pagination">
			<!--이전 페이지-->
			<c:if test="${searchVO.firstPage > 1 }">
				<li><a href="careFridgeView?curPage=${searchVO.firstPage-1}" data-page="${searchVO.firstPage-1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<!-- 페이지 넘버링-->
			<c:forEach var="i" begin="${searchVO.firstPage}"
				end="${searchVO.lastPage}">
				<c:if test="${searchVO.curPage eq i}">
					<!-- == eq  -->
					<li class="active"><a href="#" >${i}</a></li>
				</c:if>
				<c:if test="${searchVO.curPage ne i}">
					<!-- != ne  -->
					<li class=""><a href="#" data-page="${i}">${i}</a>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지 -->
			<c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
				<li><a href="careFridgeView?curPage=${searchVO.lastPage+1}" data-page="${searchVO.lastPage+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
		</ul>
	</nav> 
	<!-- 페이징 -->
	 </div>
 </div>
 <!--foot  -->
<%@include file="/WEB-INF/inc/foot1.jsp"%>
 </body>
 </html>