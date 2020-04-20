<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/templet3/css/main.css">
<!--===============================================================================================-->
<title>Insert title here</title>



<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.pw.value) {
			alert("비밀번호를 입력하세요");
			inputForm.pw.focus();
			return false;
		}
	}

	// 회원가입 버튼 클릭시 회원가입 화면으로 이동
	function goJoinForm() {
		location.href = "memberJoin.do";
	}
</script>

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178"
					name="loginInfo" method="post" action="LoginCheck.do"
					onsubmit="return checkValue()">
					<span class="login100-form-title"> Sign In </span>

					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Please enter username">
						<input class="input100" type="text" name="id" placeholder="id"
							required> <span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Please enter password">
						<input class="input100" type="password" name="pw" id="pw"
							placeholder="Password" required> <span
							class="focus-input100"></span>
					</div>

					<div>
						<br />
					</div>
					<div>
						<br />
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="checkValue()">Sign
							in</button>
					</div>
					<%
						// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
						// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
						String msg = request.getParameter("msg");

						if (msg != null && msg.equals("0")) {
							out.println("<br>");
							out.println("<font color='black' size='3'>비밀번호를 확인해 주세요.</font>");
						} else if (msg != null && msg.equals("-1")) {
							out.println("<br>");
							out.println("<font color='black' size='3'>아이디를 확인해 주세요.</font>");
						}
					%>
					<div>
						<br />
					</div>
					<a href="memberJoin.do" class="txt3"> Sign up now </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="home.do" class="txt3"> Go Home </a>

					
				</form>
			</div>


		</div>
	</div>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/templet3/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/templet3/js/main.js"></script>
</body>
</html>