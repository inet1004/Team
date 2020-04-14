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

	function inputPhoneNumber(obj) {



	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";



	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
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