<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="./assets/js/memberJoin.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#id').blur(function idCheck() {
			var id = $('#id').val().trim();
			$.ajax({
				url : "memberIdCheck.do",
				data : {
					"searchId" : id
				},
				type : "get",
				success : function(data) {
					var id = data;
					console.log(data);
					
					if (id == 1) {
						$('#idResult').html("중복된 아이디가 존재합니다.");
						$('#idResult').css("color", "red");
					} else {
						$('#idResult').html("사용가능한 아이디입니다.");
						$('#idResult').css("color", "blue");
					}
				}
			})
		});
	});
</script>
</head>
<body>
	<div align="center">
		<br />
		<div>
			<h1>회원가입</h1>
			<br />
		</div>
		<div>
			<form id="frm" name="frm" action="memberInsert.do" method="post">
				<!-- 버튼타입일때는 onsubmit 삭제 -->
				<div>
					<table border="1">
						<tr>
							<th width="200" style="color: red">* 회원명</th>
							<td colspan="3"><input type="text" id="name" name="name"
								size="15" required></td>
						</tr>
						<tr>
							<th style="color: red">* 회원ID</th>
							<td colspan="3"><input id="id" name="id"
								required>
								<div id="idResult"></div></td>
						</tr>
						<tr>
							<th style="color: red">* 회원PW</th>
							<td colspan="3"><input type="password" id="pw" name="pw"
								size="15" required></td>
						</tr>
						<tr>
							<th style="color: red">* 회원PW확인</th>
							<td colspan="3"><input type="password" id="pwc" name="pwc"
								size="15" required></td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3"><input type="text" id="addr" name="addr"
								size=35></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" id="tell" name="tell" size="15"></td>
						</tr>
					</table>
					<div>
						<br /> <input type="submit" value="가입하기">
						&nbsp;&nbsp;&nbsp;
						<!-- 버튼타입도 가능 -->
						<input type="reset">취소 &nbsp;&nbsp;&nbsp; <input
							type="submit" onclick="location.href='home.do'" value="홈으로">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
