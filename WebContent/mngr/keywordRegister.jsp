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
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="/BookR/css/bookRegister.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="keywordRegister.js"></script>
<title>BookR : 키워드 등록</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center">키워드 등록 페이지</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" name="keywordRegister" method="post"
						role="form" enctype="multipart/form-data">
						<div class="form-group">
							<div class="col-sm-2">
								<label for="mainCode" class="control-label">책 대분류</label>
							</div>
							<div class="col-sm-10">
								<select name="mainCode" id="mainCode"
									onchange="getSubCategory();">
									<option>대분류</option>
									<c:forEach var="list" items="${mainCategoryLists}">
										<option value="${list.getCode() }">${list.getName() }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="subCode" class="control-label">책 소분류</label>
							</div>
							<div class="col-sm-10">
								<select name="subCode" id="subCode" onchange="getKeyword();">
									<option value="">소분류</option>

								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="keyword" class="control-label">keyword</label>
							</div>
							<div id="keyword"></div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="groupCode" class="control-label">키워드 그룹</label>
							</div>
							<div class="col-sm-10">
								<select name="groupCode" id="groupCode">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="name" class="control-label">키워드 이름</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="name" id="name"
									placeholder="키워드 이름을 입력하세요">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary"
									id="keywordRegister">키워드 등록하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>