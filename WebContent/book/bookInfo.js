/**
 * 
 */

$(document).ready(function() {
	$("#insertList").click(function() {
		var id = $("#id").val();
		var bookCode = $("#bookCode").val();
		var query = {
			id : id,
			bookCode : bookCode
		};
		//alert("list에 담겼습니다.");
		$.ajax({
			type : "POST",
			url : "/BookR/book/list.do",
			data : query,
			success : function(data) {
				alert("list에 담겼습니다.");
			}
		});
	});

	function list(btn) {
		var rStr = btn.name;
		var arr = rStr.split(",");
		var query = "/BookR/book/list.do?book_code=" + arr[0];
		query += "&"
	}

});