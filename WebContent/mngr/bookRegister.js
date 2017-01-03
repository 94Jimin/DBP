/**
 * 
 */

status = true;

function result(msg) {
	var subCategory = $("#subCode");
	subCategory.html(msg);
}
// alert("실행");
function getSubCategory() {
	var mainCode = $("#mainCode").val();
	var query = {
		mainCode : mainCode
	};
	// alert(mainCode+"선택");
	$.ajax({
		type : "POST",
		url : "/BookR/mngr/subCategory.do",
		data : query,
		success : result
	});
}

function keywordResult(msg) {
	var keyword = $("#keyword");
	keyword.html(msg);
}
// alert("실행");
function getKeyword() {
	var subCode = $("#subCode").val();
	var query = {
		subCode : subCode
	};
	// alert(mainCode+"선택");
	$.ajax({
		type : "POST",
		url : "/BookR/getKeyword.do",
		data : query,
		success : keywordResult
	});
}

function formCheckBook() {
	status = true;
	if (!$.trim($("#subject").val())) {
		alert("제목을 입력하세요.");
		status = false;
		$("#subject").focus();
		return false;
	}
	if (!$.trim($("#writer").val())) {
		alert("저자를 입력하세요.");
		$("#writer").focus();
		status = false;
		return false;
	}
	if (!$.trim($("#publisher").val())) {
		alert("출판사를 입력하세요.");
		status = false;
		$("#publisher").focus();
		return false;
	}
	if (!$.trim($("#image").val())) {
		alert("이미지를 입력하세요.");
		status = false;
		$("#image").focus();
		return false;
	}
	if (!$.trim($("#mainCode").val())) {
		alert("대분류를 입력하세요.");
		status = false;
		$("#mainCode").focus();
		return false;
	}
	if (!$.trim($("#subCode").val())) {
		alert("소분류를 입력하세요.");
		status = false;
		$("#subCode").focus();
		return false;
	}
}

$(document).ready(function() {
	if (status) {
		$("#bookRegister").ajaxForm({
			success : function(data, status) {
				alert("책이 등록되었습니다.");
				window.location.href = "/BookR/mngr/main.do"
			}
		});
	}
	/*
	 * alert("책 등록확인"); $("#bookRegister").click(function() { formCheckBook();
	 * if (status) { var subject = $("#subject").val(); var writer =
	 * $("#writer").val(); var publisher = $("#publisher").val(); var image =
	 * $("#image").val(); var mainCode = $("#mainCode").val(); var subCode =
	 * $("#subCode").val(); var query = { subject : subject, writer : writer,
	 * publisher : publisher, image : image, mainCode : mainCode, subCode :
	 * subCode, }; alert(subject + writer + publisher + image + mainCode +
	 * subCode); $.ajax({ type : "POST", url : "/BookR/mngr/bookRegisterPro.do",
	 * data : query, success : function() { alert("책이 등록되었습니다."); //
	 * window.location.href = "/BookR/book/info.do?book_code="+ //
	 * bookCode"&id=" + id; } }); } });
	 */
});
