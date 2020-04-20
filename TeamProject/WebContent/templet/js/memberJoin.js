$(function() {

	$('#name').blur(function() {
		var name = $('#name').val();
		var nameCheck = /^[가-힣]{2,6}$/;
		if (name == '' || !nameCheck.test(name)) {
			$('#nameResult').html("한글은 2 ~ 6글자(공백 없음)만 입력 가능합니다.");
			$('#nameResult').css("color", "red");
			return false;
		} else {
			$('#nameResult').html("사용가능한 이름입니다.");
			$('#nameResult').css("color", "blue");
			return true;
		}
	});

	$('#pw').blur(function() {
		var pw = $('#pw').val();
		var pwCheck =/^[A-Za-z0-9]{6,20}$/;
		if (pw == '' || !pwCheck.test(pw)) {
			$('#pwResult').html("6~20자 영문자 또는 숫자를 입력해주세요.");
			$('#pwResult').css("color", "red");
			return false;
		} else {
			$('#pwResult').html("사용가능한 비밀번호입니다.");
			$('#pwResult').css("color", "blue");
			return true;
		}
	});

	$('#addr').blur(function() {
		var addr = $('#addr').val();
		if (addr == '') {
			$('#addrResult').html("주소를 다시 입력해 주세요.");
			$('#addrResult').css("color", "red");
			return false;
		} else {
			$('#addrResult').html("사용가능한 주소입니다.");
			$('#addrResult').css("color", "blue");
			return true;
		}
	});

	$('#tell')
			.blur(
					function() {
						var tell = $('#tell').val();
						var tellCheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
						if (tell == '' || !tellCheck.test(tell)) {
							$('#tellResult').html("전화번호를 다시 입력해 주세요.");
							$('#tellResult').css("color", "red");
							return false;
						} else {
							$('#tell')
									.val(
											tell
													.replace(
															/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,
															"$1-$2-$3"));
							$('#tellResult').html("사용가능한 번호입니다.");
							$('#tellResult').css("color", "blue");
							return true;
						}
					});

	$('#id').blur(function idCheck() {
		var id = $('#id').val();
		var idCheck = /^[a-zA-Z](?=.{0,16}[0-9])[0-9a-zA-Z]{6,20}$/;
		$.ajax({
			url : "memberIdCheck.do",
			data : {
				"searchId" : id
			},
			type : "get",
			success : function(data) {
				var idd = data;
				console.log(data);

				if (idd == 1) {
					$('#idResult').html("중복된 아이디가 존재합니다.");
					$('#idResult').css("color", "red");
					return;
				} else if (id == '' || !idCheck.test(id)) {
					$('#idResult').html("영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
					$('#idResult').css("color", "red");
					return false;
				} else {
					$('#idResult').html("사용가능한 아이디입니다.");
					$('#idResult').css("color", "blue");
					return true;
				}
			}
		})
	});

	$('#pwc').blur(function pwcCheck() {
		var pw = $('#pw').val();
		var pwc = $('#pwc').val();

		if (pw == pwc) {
			$('#pwcResult').html("확인되었습니다.");
			$('#pwcResult').css("color", "blue");
			return false;
		} else {
			$('#pwcResult').html("비밀번호가 같지 않습니다.");
			$('#pwcResult').css("color", "red");
			return true;
		}

	});

	$('#frm')
			.bind(
					'submit',
					function() {
						if ($('#idResult').text() == "중복된 아이디가 존재합니다."
								|| $('#idResult').text() == "영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.") {
							alert('아이디를 다시 입력해 주세요.');
							return false;
						} else if ($('#pwcResult').text() == "비밀번호가 같지 않습니다."){
							alert("비밀번호를 다시 입력해 주세요.");
							return false;
						} else if ($('#pwResult').text() == "6~20자 영문자 또는 숫자를 입력해주세요."){
							alert("비밀번호는 6~20자 영문자 또는 숫자를 입력해주세요.");
							return false;
						} else if ($('#nameResult').text() == "한글은 2 ~ 6글자(공백 없음)만 입력 가능합니다.") {
							alert("이름을 다시 입력해 주세요.");
							return false;
						} else if ($('#tellResult').text() == "전화번호를 다시 입력해 주세요.") {
							alert("전화번호를 다시 입력해 주세요.");
							return false;
						} else if ($('#addrResult').text() == "주소를 다시 입력해 주세요.") {
							alert("주소를 다시 입력해 주세요.");
							return false;
						}
						return true;
					});
});