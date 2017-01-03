<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="/BookR/css/keywordMain.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="keywordMain.js"></script>
<title>BookR : 키워드 검색</title>

</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="section">
		<!-- <form class="form-horizontal" name="keywordSearch" method="post"> -->
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<label for="mainCode" class="control-label">책
						대분류&nbsp;&nbsp;&nbsp;</label> <select name="mainCode" id="mainCode"
						onchange="getSubCategory();">
						<option>대분류</option>
						<c:forEach var="list" items="${mainCategoryLists}">
							<option value="${list.getCode() }">${list.getName() }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-3">
					<label for="subCode" class="control-label">책
						소분류&nbsp;&nbsp;&nbsp;</label> <select name="subCode" id="subCode"
						onchange="getKeyword();">
						<option value="">소분류</option>

					</select>
				</div>
			</div>
			<div class="row">
				<h5></h5>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-9" id="keyword">
					<div class="col-sm-3">
						<select size="5" style="width: 100%" id="keywordGroup1"
							name="keywordGroup1">
							<c:forEach var="list" items="${keywordInfo1 }">
								<option value="${list.getCode() }">${list.getName() }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-3">
						<select size="5" style="width: 100%" id="keywordGroup2"
							name="keywordGroup2">
							<c:forEach var="list" items="${keywordInfo2 }">
								<option value="${list.getCode() }">${list.getName() }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-3">
						<select size="5" style="width: 100%" id="keywordGroup3"
							name="keywordGroup3">
							<c:forEach var="list" items="${keywordInfo3 }">
								<option value="${list.getCode() }">${list.getName() }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10"></div>
			<div class="col-md-2">
				<button class="btn btn-block btn-default btn-lg" id="keywordSearch"
					onclick="getResult();">
					<i class="fa fa-fw fa-search"></i>검색
				</button>
			</div>
		</div>
		<!-- </form> -->
	</div>
	<div class="section">
		<div class="container" id="result"></div>
	</div>
</body>
</html>