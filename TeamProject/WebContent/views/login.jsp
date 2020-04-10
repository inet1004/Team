<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    /* 전체박스 */
    #wrap {
        width: 40%;
        heigth: 500px;
        margin: 0 auto;
    }
    
    </style>
<title>login.jsp</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div align="center" id="wrap">
		<br />
		<br />
		<div>
			<h2>Member Login</h2>
		</div>
		<div>
			<br /><br /><br />
		</div>
		<div>
			<form id="frm" name="frm" action="LoginCheck.do" method="post">
				<div class="form-group">
					<label for="usr">ID</label> 
					<input type="text" class="form-control" id="id" name="id" size="10" required>
				</div>
				<div>
					<label for="pwd">PASSWORD</label> 
					<input type="password" class="form-control" id="pw" name="pw" size="10" required>
					<br />
				</div>
				<br /><br />
				<div>
					<button type="submit" class="btn btn-secondary">로그인</button>
					<button type="button" class="btn btn-secondary" onclick="">회원가입</button>

				</div>
			</form>
		</div>
		<br />
	</div>
</body>
</html>