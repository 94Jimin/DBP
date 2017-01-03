/**
 * 
 */

$(document).ready(function() {
	$("#login").click(function() {
		var query = {
			id : $("#id").val(),
			passwd : $("#passwd").val()
		};
		$.ajax({
			type : "POST",
			url : "/BookR/loginPro.do",
			data : query,
			success : function(data) {
				var str1 = '<p id="ck">';
				var loc = data.indexOf(str1);
				var len = str1.length;
				var check = data.substr(loc + len, 1);
				if (check == "1") {// 사용할 수 없는 아이디
					window.location.href="/BookR/index.do?main_code=200";
				} else if (check=="0"){
					alert("비밀번호 틀림");
				} else {
					alert("아이디 틀림");
					$("#id").val("");
					$("#passwd").val("");
				}
				
			}
		});
		
		/*f= document.flogin;
		f.action = 'loginPro.jsp';
		f.submit();*/
	});

});

/*function valid_check(){
	document.flogin.submit();
}*/