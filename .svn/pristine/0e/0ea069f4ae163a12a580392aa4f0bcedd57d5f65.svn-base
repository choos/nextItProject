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
	  $('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  widows: 300,
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
		<form action="QNAModify" method="post">
			<table>
				<tr>
					<th>제목</th>
				</tr>
				<tr>
					<td><input type="text" name="qTitle" class="form-control" value="${qnaVO.qTitle}"></td>
				</tr>
				<tr>
					<td><input type="text" name="qMId" readonly="readonly" class="form-control" value="${qnaVO.qMId}"></td>
					<td><input type="hidden" name="qNum" readonly="readonly" class="form-control" value="${qnaVO.qNum}"></td>
				</tr>
				
				<tr>
					<th>분류</th>
				</tr>
				<tr>
					<td>
					<select class="form-control" name="qCategory">
					  <option value="QC01"${qnaVO.qCategory eq 'QC01'? "selected='selected'":''}>배송문의</option>
					  <option value="QC02"${qnaVO.qCategory eq 'QC02'? "selected='selected'":''}>취소/교환/반품</option>
					  <option value="QC03"${qnaVO.qCategory eq 'QC03'? "selected='selected'":''}>환불관련</option>
					  <option value="QC04"${qnaVO.qCategory eq 'QC04'? "selected='selected'":''}>주문/결제</option>
					  <option value="QC05"${qnaVO.qCategory eq 'QC05'? "selected='selected'":''}>회원관련</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
				</tr>
				<tr>
					<td><textarea name="qContent" id="summernote" class="summernote">${qnaVO.qContent}</textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="수정하기" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
	</div>
	<!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>


</html>