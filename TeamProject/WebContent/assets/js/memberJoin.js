function abc() {

	var objName = document.getElementById("name");// 이름 id
	var objid = document.getElementById("id"); // 자기소개 id값
	var objPw = document.getElementById("pw"); // 자기소개 id값
	var objPwc = document.getElementById("pwc");// 패스워드 id값
	var objTell = document.getElementById("tell");// 패스워드 id값
	var objAddr = document.getElementById("addr");// 패스워드 id값
	var regname = /^[가-힣]{2,4}$/; // 이름에 사용할 정규 표현식
	var reid = / ^[a-z]+[a-z0-9]{5,19}$/g; // 이름에 사용할 정규 표현식

	if (!IdPwCheck()) { // 아이디 비밀번호 검사
		return false;
	} else if (!regname.test(objName.value)) { // 이름 검사
		alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
		return false;
	} else if (objPw.value=="") { // 이름 검사
		alert("비밀번호를 입력해주세요.");
		return false;
	} else if (objPwc.value=="") { // 이름 검사
		alert("비밀번호확인란을 입력해 주세요.");
		return false;
	} else if (objTell.value=="") { // 이름 검사
		alert("전화번호를 입력해주세요.");
		return false;
	} else { // 유효성 검사 완료시 회원가입 진행
		alert("회원가입이 완료되었습니다.");
		return true;
	}
}

function IdPwCheck() {
	var objId = document.getElementById("id"); // 아이디 id
	var objPw = document.getElementById("pw"); // 비밀번호 id
	var objPwCheck = document.getElementById("pwc"); // 비밀번호확인id
	var regExp1 = /^[\w]{4,12}$/; // 아이디와 비밀번호에 사용할 정규표현식
	if (objId.value == "") { // ID가 공백일 경우 false 반환
		alert("ID를 입력해 주세요");
		return false;
	} else if (!regExp1.test(objId.value)) { // 아이디의 값을 검사해 true or false 반환
		alert("ID를 4~12자의 영문 대소문자와 숫자로만 입력해주세요.");
		objId.value == "";
		return false;
	} else if (objPw.value != objPwCheck.value) { // 비밀번호 확인이 다를 경우 false 반환
		alert("비밀번호와 비밀번호 확인을 다시 입력해주세요.");
		return false;
	} else if (objPw.value == objId.value) { // 아이디 비밀번호가 같을 경우 false 반환
		alert("아이디와 비밀번호를 다르게 만들어주세요.");
		return false;

	} else if (!regExp1.test(objPw.value)) { // 비밀번호 정규표현식 검사
		alert("PW를 4~12자의 영문 대소문자와 숫자로만 입력해주세요.");
		return false;
	} else {
		return true;
	}
} // Id/Pw 검사 end

