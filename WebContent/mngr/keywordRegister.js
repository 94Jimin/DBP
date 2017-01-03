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

$(document).ready( function() {
	$("#keywordRegister").click(	function() {
		//var code = $("#code").val();
		var groupCode = $("#groupCode").val();
		var name = $("#name").val();
		var subCode = $("#subCode").val();
		var query = {
				//code : code,
				groupCode : groupCode,
				name : name,
				subCode : subCode
		};
		//alert(groupCode + name + subCode);
		$.ajax({
			type : "POST",
			url : "/BookR/mngr/keywordRegisterPro.do",
			data : query,
			success : function(data) {
				alert(name+" 키워드가 만들어 졌습니다.");
				window.location.href = "/BookR/mngr/main.do";
			}
		});
	});
});