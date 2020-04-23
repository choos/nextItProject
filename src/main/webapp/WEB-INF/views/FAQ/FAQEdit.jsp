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
		<form action="FAQMdify" method="post">
			<table>
				<tr>
					<th>제목</th>
				</tr>
				<tr>
					<td><input type="text" name="faTitle" class="form-control" value="${faqVO.faTitle}"></td>
					<td><input type="hidden" name="faNum" class="form-control" value="${faqVO.faNum}"></td>
				</tr>
				<tr>
					<th>카테고리</th>
				</tr>
				<tr>
					<td>
						<select class="form-control" name="faCategory">
							<option value="FC01" ${faqVO.faCategory eq 'FC01'? "selected='selected'":''}>배송문의</option>
							<option value="FC02" ${faqVO.faCategory eq 'FC02'? "selected='selected'":''}>취소/교환/반품</option>
							<option value="FC03" ${faqVO.faCategory eq 'FC03'? "selected='selected'":''}>환불관련</option>
							<option value="FC04" ${faqVO.faCategory eq 'FC04'? "selected='selected'":''}>주문/결제</option>
							<option value="FC05" ${faqVO.faCategory eq 'FC05'? "selected='selected'":''}>회원관련</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
				</tr>
				<tr>
					<td><textarea name="faContent" id="summernote" class="summernote">${faqVO.faContent}</textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="등록하기" class="btn btn-success"></td>
				</tr>
			</table>
		</form>
	</div>
	<!--foot  -->
	<%@include file="/WEB-INF/inc/foot1.jsp"%>
</body>


</html>