/**
 * 
 */

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

function getResult(){
	var keyword1 = $("#keywordGroup1").val();
	var keyword2 = $("#keywordGroup2").val();
	var keyword3 = $("#keywordGroup3").val();
	var query = {
		keyword1 : keyword1,
		keyword2 : keyword2,
		keyword3 : keyword3
	};
	//alert(keyword1 + ' ' + keyword2 + ' '+ keyword3);
	$.ajax({
		type : "POST",
		url : "/BookR/search/keywordResult.do",
		data : query,
		success : function (data){
			$("#result").html(data);
		}
	});
}
$(document).ready(function() {
});