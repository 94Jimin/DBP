/**
 * 
 */

$(document).ready(function() {
	$("#deleteBook").click(function() {
		var id = $("#id").val();
		var bookCode = $("#bookCode").val();
		var listCode = $("#listCode").val();
		var bookName = $("#bookName").val();
		var query = {
			id : id,
			bookCode : bookCode,
			listCode : listCode
		};
		alert(id + ' ' + bookCode + ' '+ listCode);
		$.ajax({
			type : "POST",
			url : "/BookR/user/deleteBook.do",
			data : query,
			success : function(data) {
				alert(bookName+"이(가) 삭제 되었습니다.");
				window.location.href = "/BookR/user/listConfirm.do?listCode="+listCode;
			}
		});
	});
});