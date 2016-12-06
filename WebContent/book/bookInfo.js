/**
 * 
 */
$(document).ready( function() {
	$("#insertList").click(	function() {
		var id = $("#id").val();
		var bookCode = $("#bookCode").val();
		var listCode = $("#listCode").val();
		var query = {
			id : id,
			bookCode : bookCode,
			listCode : listCode
		};
		alert("list에 담겼습니다.");
		$.ajax({
			type : "POST",
			url : "/BookR/book/list.do",
			data : query,
			success : function(data) {
				alert("list에 담겼습니다.");
				window.location.href = "/BookR/book/info.do?book_code="+ bookCode"&id=" + id;
			}
		});
	});

	$("#makeList").click(function() {
		var id = $("#id").val();
		var bookCode = $("#bookCode").val();
		var query = {
			id : id,
			bookCode : bookCode,
		};
		// alert("list에 담겼습니다.");
		$.ajax({
			type : "POST",
			url : "/BookR/user/makeList.do",
			data : query,
			success : function(data) {
				alert("리스트를 만들었습니다.");
				window.location.href = "/BookR/book/info.do?book_code="+ bookCode"&id=" + id;
			}
		});
	});

	$("#review_grade").click(function() {
		if (confirmReview() == 1) {
			var id = $("#idRG").val();
			var bookCode = $("#bookCodeRG").val();
			var review = $("#review").val();
			var grade = $("#grade").val();
			if (review == null) {
				review = '';
			}
			// alert(id+bookCode+review+grade);
			var query = {
				id : id,
				bookCode : bookCode,
				review : review,
				grade : grade
			};
			$.ajax({
				type : "POST",
				url : "/BookR/book/review_grade.do",
				data : query,
				success : function(data) {
					alert("rieview나 grade를 남겼습니다.");
					window.location.href = "/BookR/book/info.do?book_code="+ bookCode + "&id=" + id;
				}
			});
		} else {
			alert("별점을 먼저 남겨주세요");
		}

	});

});