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
				window.location.href="/BookR/index.do";
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