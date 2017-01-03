/**
 * 
 */
status = 1;
function formCheckBook() {
	// alert($.trim($("#id").val()) == "");
	if ($.trim($("#id").val()) == "") {
		alert("아이디를 입력하세요.");
		status = -1;
		$("#id").focus();
		return false;
	}
	if ($.trim($("#passwd").val()) == "") {
		alert("비밀번호를 입력하세요.");
		status = -1;
		$("#passwd").focus();
		return false;
	}
	if ($.trim($("#passwd_2").val()) == "") {
		alert("비밀번호를 한번 더 입력하세요.");
		status = -1;
		$("#passwd_2").focus();
		return false;
	}
	if ($("#passwd_2").val() != $("#passwd").val()) {
		alert("비밀번호가 틀립니다.");
		status = -1;
		$("#passwd_2").focus();
		return false;
	}
	if ($.trim($("#name").val()) == "") {
		alert("이릅을 입력하세요.");
		status = -1;
		$("#name").focus();
		return false;
	}
	//alert($("#gender").val())
	if ($.trim($("#gender").val()) == "") {
		alert("성별을 입력하세요.");
		status = -1;
		$("#gender").focus();
		return false;
	}
}

$(document).ready(function() {
	$("#checkId").click(function() {
		if ($("#id").val()) {
			var query = {
				id : $("#id").val()
			};
			$.ajax({
				type : "POST",
				url : "/BookR/confirmId.do",
				data : query,
				success : function(data) {
					var str1 = '<p id="ck">';
					var loc = data.indexOf(str1);
					var len = str1.length;
					var check = data.substr(loc + len, 1);
					if (check == "1") {// 사용할 수 없는 아이디
						alert("사용할 수 없는 아이디");
						$("#id").val("");
					} else
						// 사용할 수 있는 아이디
						alert("사용할 수 있는 아이디");
				}
			});
		} else {
			alert("사용할 아이디를 입력");
			$("#id").focus();
		}
	});
	
	$("#signup").click(function() {
		formCheckBook();
		//alert(status);
		if (status == 1) {
			var query = {
				id : $("#id").val(),
				passwd : $("#passwd").val(),
				name : $("#name").val(),
				gender : $("#gender").val(),
				favorite : ""
			};
			//alert($("#id").val()+$("#passwd").val());
			$.ajax({
				type : "POST",
				url : "/BookR/signUpPro.do",
				data : query,
				success : function(data) {
					alert("회원가입에 성공했습니다.");
					window.location.href = "/BookR/index.do?main_code=100";
				}
			});
		}
	});
});

function formSubmmit() {
		formCheckBook();
		//alert(status);
		if (status == 1) {
			var query = {
				id : $("#id").val(),
				passwd : $("#passwd").val(),
				name : $("#name").val(),
				gender : $("#gender").val(),
				favorite : ""
			};
			//alert($("#id").val()+$("#passwd").val());
			$.ajax({
				type : "POST",
				url : "/BookR/signUpPro.do",
				data : query,
				success : function(data) {
					alert("회원가입에 성공했습니다.");
					window.location.href = "/BookR/index.do?main_code=200";
				}
			});
		}
	}

