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
<script type="text/javascript">
	$(document).ready(function() {
		/* 섬머노트 */
	  $('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
	  });
	});
</script>

</head>
<body>
	<div class="container" id="mycon">
		<form action="OTOUpdate" method="post">
			<table>
				<tr>
					<th>고객 ID</th>
				</tr>
				<tr>
					<td><input type="text" name="qMId" readonly="readonly" class="form-control" value="${OTO.qMId}"></td>
					<td><input type="hidden" name="reQNum" readonly="readonly" class="form-control" value="${OTO.qNum}"></td>
					<td><input type="hidden" name="qNum" readonly="readonly" class="form-control" value="${OTO.qNum}" ></td>
				</tr>
				
				<tr>
					<th>고객 질문내용</th>
				</tr>
				<tr>
					<td>${OTO.qContent}</td>
				</tr>
				
				<tr>
					<th>관리자 아이디</th>
				</tr>
				<tr>
					<td><input type="text" name="reMId" readonly="readonly" class="form-control" value="${OTO.reMId}"></td>
				</tr>
				<tr>
					<th>답글 제목</th>
				</tr>
				<tr>
					<td><input type="text" name="reTitle" class="form-control" value="${OTO.qTitle}"></td>
				</tr>
				<tr>
					<th>답글 내용</th>
				</tr>
				<tr>
					<td><textarea name="reContent" id="summernote" class="summernote">${OTO.reContent}</textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="등록하기" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
	</div><!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>


</html>