<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
    /* 전체박스 */
    #wrap {
        width: 70%;
        heigth: 500px;
        margin: 0 auto;
    }
    
    </style>
<title>Member List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center" id="wrap">
	<br/><br />
		<h1>Member List</h1>
	<br /><br />
	<div align="center">
		<table class="table">
			<thead>
				<tr align="center">
					<th width="100">아이디</th>
					<th width="100">이 름</th>
					<th width="200">주 소</th>
					<th width="150">전화번호</th>
					<th width="100">등  급</th>
				</tr>
				<c:choose>

					<c:when test="${empty members }">
						<tr>
							<td colspan="4" align="center">데이터가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="member" items="${list }">
							<tr>
								<td align="center">${member.id }</td>
								<td align="center">${member.name }</td>
								<td align="center">${member.addr }</td>
								<td align="center">${member.tell }</td>
								<td align="center">${member.grade }</td>
							</tr>
			</thead>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</div>
	<button type="button" id="btnupdate" name="btnupdate" onclick="">수정</button>
	<button type="button" id="btndelete" name="btndelete" onclick="">삭제</button>
	<div>
		<br />
	</div>
		</div>
</body>
</html>