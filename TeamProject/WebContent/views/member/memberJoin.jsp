<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="assets/js/memberJoin.js"></script>
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
								size="15" tabindex="1" required></td>
						</tr>
						<tr>
							<th style="color: red">* 회원ID</th>
							<td colspan="3"><input id="id" name="id"  tabindex="2" required>
								<div id="idResult"></div></td>
						</tr>
						<tr>
							<th style="color: red">* 회원PW</th>
							<td colspan="3"><input type="password" id="pw" name="pw"
								size="15" tabindex="3"  required></td>
						</tr>
						<tr>
							<th style="color: red">* 회원PW확인</th>
							<td colspan="3"><input type="password" id="pwc" name="pwc"
								size="15"  tabindex="4" required></td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3"><input type="text" id="addr" name="addr"
								size=35 tabindex="5" ></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<div class="formfield">
									 <input id="tell" name="tell" type="text" onKeyup="inputPhoneNumber(this);" maxlength="13" tabindex="6" autocomplete="off"> 
								</div>
							</td>
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
