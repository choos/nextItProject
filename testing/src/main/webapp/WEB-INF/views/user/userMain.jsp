<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>유저 레시피 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/recipe.css"/> 
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
.front img{
	width: 250px;
	height: 250px;
}
.content p {
	color: fa8072;
} 
#homeImg{
width: 50px;
height:50px;
}

.bs-docs-header{
	background-image: url("${pageContext.request.contextPath}/resources/image/93600.jpg");
	background-size: cover;
/* 	opacity: 0.5; */
}

.bs-docs-section{
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

		<script type="text/javascript">
	
	var f_goPage = function(page){
		//e.preventDefault();	//이벤트 전파 방지(기존 서브밋 방지)
		document.getElementById("id_curPage").value = page;
		var f= document.forms["frm_free"];
		console.log("fn_goPage Call", "")
		f.action = "userMain";
		f.submit();
	}
	
	function fn_goPage(e){
		//e.preventDefault();	//이벤트 전파 방지(기존 서브밋 방지)
		document.getElementById("id_curPage").value = this.dataset.page;
		var f= document.forms["frm_free"];
		console.log("fn_goPage Call", this.dataset.page)
		f.action = "userMain";
		f.submit();
	}
	
	var f_submit_search = function(){
		var f= document.forms["userMain"];
		f.action = "userMain";
		f.curPage.value = 1;
		console.log("fn_search Call", f.dataset.page)
		f.submit();
	}
	
	var f_submit_change = function(){
		var f= document.forms["userMain"];
		f.curPage.value = 1;
		f.rowSizePerPage.value = this.value;
		console.log("fn_change Call", "curPage",f.curPage.value,"rowSizePerPage",  f.dataset.page)
		f.submit();
	}
	window.onload=function(){
		/* var alink = document.getElementsByClassName("id_alink");
		for(var i=0; i<alink.length; i++){
			alink[i].addEventListener("click", f_submit);
		} */
		document.forms["frm_free"].addEventListener("submit", f_submit_search);
		document.getElementById("id_rowSizePerPage").addEventListener("change", f_submit_change);
		//document.querySelectorAll(".pagination li a[data-page]").forEach(obj =>{obj.addEventListener("click", f_goPage);})
	}

	$(document).ready(function() {
		//전체 체크 박스 선택시 테이블의 모든 체크박스 토글
		$("#id_check_all").change(function() {
			var chk = $(this).prop("checked");
			$("input[type=checkbox][name=boNums]").prop("checked",chk) 
		});
		


	});
	</script>

<!--메뉴바  -->
	<div class="bs-docs-header">
		<div class="container" id="mainBody">
		 <!-- <form action="/market/marketView1" method="get"> -->

			<div>
			<span>메뉴</span>
			</div>
			<div class="imgDiv">
				<a href="userMain">
				<img alt=""	src="${pageContext.request.contextPath}/resources/image/ALL.png">
				<span>전체</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="userSearch?ufCategory=간식/안주">
				<img alt=""	src="${pageContext.request.contextPath}/resources/image/beer.png">
				<span>간식/안주</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="userSearch?ufCategory=식사">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/rice.png">
				<span>식사</span>
				</a>
			</div>
			<div class="imgDiv">
				<a href="userSearch?ufCategory=디저트">
				<img alt="" src="${pageContext.request.contextPath}/resources/image/strawberry-cake.png">
				<span>디저트</span>
				</a>
			</div>
			 <!-- 이미지 자식 div -->
			<!-- </form> -->
		</div>	<!-- body 부모 dib  -->
		<!-- 검색창 -->
	<div class="bs-docs-section">
			<span>
				<img id="homeImg" alt="" src="${pageContext.request.contextPath}/resources/image/로고2.png">
			0Kcal
			</span>
			<form name="frm_search" action="userMain" method="get"
				class="form-horizontal">
				<input style="size: 200px;" name="searchWord" class="searchWord"
					type="text" value="${searchVO.searchWord}"> 
				<input class="search" type="submit" value="검색">
			</form>
	</div>
	</div><!-- bs-docs-header -->
	
		<form action="userMain" method="post" class="form-horizontal" name="frm_free" id="frm_free">
	  		<input id="id_curPage" name="curPage" value="${searchVO.curPage }" hidden="">
	  		<input  name="rowSizePerPage" value="${searchVO.rowSizePerPage }" hidden="">
 		</form>
	
	
	<div class="container" id="mycon" style="padding-top: 100px;" >
			 <div id="wrapper">

            <!-- Main -->
                <div id="main">
                    <div class="inner">
                    					<div style="text-align: center;">
																			<img class="img-responsive" alt=""
																				src="${pageContext.request.contextPath}/resources/image/ufbmain.png">
																		</div>
                     <%-- <form action="<%=request.getContextPath()%>/user/userView"  method="post"> --%>
                        <section class="tiles">
                          <c:forEach items="${board}" var="vo" varStatus="st">
                            <article class="style1">
                                <span class="image">
              													<c:if test="${not empty vo.ufImg1 }">
                                		<img src="${vo.ufImg1}"/>
                               		</c:if>
               												<c:if test="${empty vo.ufImg1 }">
                                		<img src="<%=request.getContextPath() %>/resources/image/noIMG.jpg"/>
                               		</c:if>
                                </span>
                                    <a href="<%=request.getContextPath()%>/user/userView?ufCode=${vo.ufCode}">
                                    <div class="content">
                                        <h3>${vo.ufTitle}</h3>
                                        <p><b>${vo.ufCategory}</b></p>
                                        <p><b>추천수 : ${vo.ufLove}</b></p>
                              											
                                    </div>
                                </a>
                            </article>
                         </c:forEach>
                       </section>
                    <!--  </form> -->
                    </div>
                </div>
            </div>
             
 <c:if test="${not empty member.userId }">
	<div class="pull-right" >
	<a href="userForm" class="btn btn-sm btn-default">글쓰기</a>
</div>
</c:if>
	
	</div>
	
		<nav style="text-align: center;">
		<ul class="pagination" style="display: inline-block;">
			<li>
				<!-- 이전 페이지 -->
				<a href="userMain?curPage=${(searchVO.firstPage ne 1) ? searchVO.firstPage-1 : 1}" aria-label="Previous">
	        <span aria-hidden="true">&larr;</span>
	      </a>
      </li>
			<li>
				<!-- 이전 페이지 하나씩-->
				<a href="userMain?curPage=${searchVO.curPage>1 ? searchVO.curPage-1 : 1}" aria-label="Previous">
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
	      <a href="userMain?curPage=${searchVO.curPage<searchVO.totalPageCount?(searchVO.curPage+1):searchVO.totalPageCount}&searchWord=${searchVO.searchWord}&searchType=${searchVO.searchType}&searchCategory=${searchVO.searchCategory}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
    	</li>
    	<li>
    		<!-- 이전 페이지 -->
	      <a href="userMain?curPage=${searchVO.lastPage<searchVO.totalPageCount?(searchVO.lastPage+1):searchVO.totalPageCount}" aria-label="Next">
	        <span aria-hidden="true">&rarr;</span>
	      </a>
    	</li>
		</ul>
	
	
</nav>

</body>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>