<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>myPage</title>
<style type="text/css">
.password_recheck {
	margin-top: 24px;
	padding: 40px 0;
	background-color: #f4f4f4;
	color: #333;
	font-size: 15px;
	line-height: 22px;
	width: 70%;
}

.password_recheck .password_info {
	margin-bottom: 16px;
	line-height: 24px;
	text-align: center;
}

.password_recheck .password_recheck_inner {
	position: relative;
	width: 328px;
	margin: 0 auto 12px;
	padding: 15px 16px;
	border: 1px solid #e5e5e5;
	border-radius: 4px;
	background-color: #fff;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.28), 0 2px 4px 0
		rgba(0, 0, 0, 0.06);
	box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.28), 0 2px 4px 0
		rgba(0, 0, 0, 0.06);
}

.password_recheck .connect_id {
	display: block;
	width: 100%;
	font-size: 20px;
	line-height: 22px;
	text-align: left;
	vertical-align: top;
}

#homeImg {
	background-position: 0px 0px;
	width: 30px;
	height: 30px;
}

.password_recheck .password_box .password_lab {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding: 12px 10px;
	color: #999;
	font-size: 14px;
	line-height: 20px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.password_recheck .password_box .password_inp {
	width: 100%;
	padding: 12px 10px;
	line-height: 20px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.password_recheck .password_box .password_inp {
	width: 100%;
	padding: 12px 10px;
	line-height: 20px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.password_recheck .password_box .ok_btn {
	width: 100%;
	height: 48px;
	background-color: darkorange;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
	line-height: 48px;
	text-align: center;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/inc/top_menu.jsp"%>
	<div class="container"
		style="text-align: center; margin-top: 130px;">
		<%@include file="/WEB-INF/inc/side_bar.jsp"%>

		<!--
	--------------------------------메모---------------------------------
	주소는 MEM_ID 로 설정

	-->
		<div class="password_recheck" style="display: inline-block; width: 800px; margin-left: 150px;">
			<p class="password_info">
				회원님의 개인정보를 안전하게 보호하기위해 <br> <em style="color: red;">인증 후
					변경이 가능</em>합니다
			</p>

			<form name="form1" method="post">
				<div class="password_recheck_inner open">
					<p class="connect_id">
						<img id="homeImg" alt="로고이미지"
							src="${pageContext.request.contextPath}/resources/image/로고2.png">
						<span class="in_btn">아이디 : <strong>${member.userId }</strong></span>
					</p>
					<div class="password_box" style="display: block;">
						<div class="inp_box">

							<input type="password" id="pw_rechk" name="memPass"
								class="password_inp" maxlength="20" placeholder="비밀번호를 입력하세요.">
							<button type="button" class="ok_btn" onclick="f_go_Mypage()">확인
							</button>
						</div>

					</div>
				</div>

				<ul class="password_recheck_guide">
					<li>0칼로리는 회원님의 개인정보를 신중히 취급하며, 회원님의 동의 없이는 기재하신 회원정보가 공개되지
						않습니다.</li>
				</ul>
			</form>

		</div>

	</div>
	<script>
		function f_go_Mypage() {
			var v_memPass = "${member.userPass}"
			var memId = "${member.userId}"
			var write_pass = $('#pw_rechk').val();
			if (write_pass == v_memPass) {
				location.replace("myPageView?memId=" + memId);
				/* location.replace("myPageView"); */
			} else {
				alert("비밀번호가 다릅니다.");
			}

		}
	</script>
</body>
<br>
<br>
<%@include file="/WEB-INF/inc/foot1.jsp"%>
</html>