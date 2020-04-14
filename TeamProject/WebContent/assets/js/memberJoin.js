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

$(function() {
	$('#pwc').blur(function pwcCheck() {
		var pw = $('#pw').val().trim();
		var pwc = $('#pwc').val().trim();

		if (pw == pwc) {
			$('#pwResult').html("확인되었습니다.");
			$('#pwResult').css("color", "blue");
		} else {
			$('#pwResult').html("비밀번호가 같지 않습니다.");
			$('#pwResult').css("color", "red");

		}

	});
});

$(function() {
	$('#frm').bind('submit', function() {
		if(final()==false){
			return false
		}
		if ($('#idResult').text() == "중복된 아이디가 존재합니다.") {
			
			alert('중복된 아이디가 존재합니다. 다시 입력해주세요.');
			return false;
		} else if ($('#pwResult').text() == "비밀번호가 같지 않습니다.") {
			alert("동일한 비밀번호를 입력해주세요.");
			return false;
		}
		return true;

	});
});

function inputPhoneNumber(obj) {

	var number = obj.value.replace(/[^0-9]/g, "");
	var phone = "";

	if (number.length < 4) {
		return number;
	} else if (number.length < 7) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3);
	} else if (number.length < 11) {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 3);
		phone += "-";
		phone += number.substr(6);
	} else {
		phone += number.substr(0, 3);
		phone += "-";
		phone += number.substr(3, 4);
		phone += "-";
		phone += number.substr(7);
	}
	obj.value = phone;
}

function final() {
	var id = $('#id').val();
	var pw = $('#pw').val();
	var name = $('#name').val();
	var tell = $('#tell').val();

	var namePattern =/^[가-힣]{2,4}$/;
	var idPattern = /^[0-9a-z]+$/;
	var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	var tellPattern = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

	if (idPattern.test(id)) {
		alert('아이디는 영문, 숫자만 가능합니다.');
		return false;
	} else if (!pwPattern.test(pw)) {
		alert('비밀번호는 최소 8자이상, 하나의 문자와 숫자를 입력해야합니다.')
		return false;
	} else if (!namePattern.test(name)) {
		alert('한글은 2 ~ 4글자(공백 없음)에 맞춰서 입력해 주세요.');
		return false;
	} else if (!tellPattern.test(tell)) {
		alert('전화번호를 다시 입력해주세요.')
		return false;
	}
	return true;
};
