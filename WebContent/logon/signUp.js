/**
 * 
 */

$(document).ready(function() {
	$("#signup").click(function() {
		var query = {
			id : $("#id").val(),
			passwd : $("#passwd").val(),
			name : $("#name").val(),
			gender : $("#gender").val(),
			favorite : $("#favorite").val()
		};
		$.ajax({
			type : "POST",
			url : "/BookR/signupPro.do",
			data : query,
			success : function(data) {
				window.location.href="/BookR/index.do";
			}
		});

	});

});