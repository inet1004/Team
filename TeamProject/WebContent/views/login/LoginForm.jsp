<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    /* 전체박스 */
    #wrap {
        width: 40%;
        heigth: 500px;
        margin: 0 auto;
    }
    
    </style>
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.pw.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.pw.focus();
                return false;
            }
        }
    
        // 회원가입 버튼 클릭시 회원가입 화면으로 이동
        function goJoinForm() {
            location.href="";
        }    
    </script>

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
        <form name="loginInfo" method="post" action="views/pro/LoginPro.jsp" 
                onsubmit="return checkValue()">

<div class="form-group">
					<label for="usr">ID</label> 
					<input type="text" class="form-control" id="id" name="id" size="10" required>
				</div>
				<div>
					<label for="pwd">PASSWORD</label> 
					<input type="password" class="form-control" id="pw" name="pw" size="10" required>
					<br />
				</div>
            
            <br>
            <input type="submit" value="로그인"/>
            <input type="button" value="회원가입" onclick="goJoinForm()" />
        </form>
        
        <% 
            // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
            // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
            }
        %>    
    </div>    

</body>
</html>