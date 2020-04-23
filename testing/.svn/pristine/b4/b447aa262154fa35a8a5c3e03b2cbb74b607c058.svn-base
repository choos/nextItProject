<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<script>
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
		}
	}).open();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="assets/css/login.css" /> -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css" />
<title>회원가입</title>

</head>
<body>
	<%@include file="/WEB-INF/inc/top_menu.jsp"%>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								//document.getElementsByName("memAdd2")[0].value = extraAddr;

							} else {
								//document.getElementsByName("memAdd2")[0].value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementsByName('memZip')[0].value = data.zonecode;
							document.getElementsByName("memAdd1")[0].value = addr;
							// 커서를 상세주소 필드로 이동한다.
							//document.getElementById("sample6_detailAddress").focus();	//일단 비활성화
						}
					}).open();
		}
	</script>


	<div class="container" style="margin-top: 130px;width: 900px">
		<h3>회원 가입</h3>
		<form action="/member/memberRegist" method="post">
			<table class="table table-border">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col />
				</colgroup>
				<tr>
					<th>ID</th>
					<td><input type="text" name="memId" value=""
						required="required"></td>
					<th>회원명</th>
					<td><input type="text" name="memName" value=""
						required="required"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td colspan="3"><input type="password" name="memPass" value=""
						required="required"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td colspan="3"><input type="text" name="memRegno1" value=""
						placeholder="주민번호 앞 6자리"> - <input type="password"
						name="memRegno2" value="" placeholder="주민번호 뒤 7자리"></td>
				</tr>
				<tr>
					<th>생일</th>
					<td colspan="3"><input type="date" name="memBir" value=""
						placeholder="생일입력" required="required"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td colspan="3"><input type="text" name="memZip" value=""
						placeholder="우편번호입력"> <input type="button"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="memAdd1" value=""
						placeholder="기본주소 입력"> <br> <input type="text"
						name="memAdd2" value="" placeholder="상세주소 입력"></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><input type="text" name="memHp" value=""
						required="required"></td>
					<th>메일</th>
					<td><input type="email" name="memMail" value=""></td>
				</tr>
				<tr>
					<td colspan="4">
						<!-- <div class="pull-left">
							<a href="/member/memberList" class="btn btn-sm btn-default">회원 목록</a>
						</div> -->
						<div class="pull-right">
							<button type="submit" class="btn btn-sm btn-default">가입</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>