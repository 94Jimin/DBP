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
<script type="text/javascript" src="bookRegister.js"></script>
<title>BookR : 책 등록</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center">책 등록 페이지</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal"
						action="/BookR/mngr/bookRegisterPro.do" name="bookRegister"
						method="post" role="form" enctype="multipart/form-data">
						<div class="form-group">
							<div class="col-sm-2">
								<label for="subject" class="control-label">책 제목</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="책 제목을 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="writer" class="control-label">책 저자</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="writer"
									id="writer" placeholder="책 저자를 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="publisher" class="control-label">책 출판사</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="publisher"
									id="publisher" placeholder="책 출판사를 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="image" class="control-label">책 이미지</label>
							</div>
							<div class="col-sm-10">
								<input type="file" name="image" class="" id="image">
							</div>
						</div>
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
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary" id="bookRegister">책
									등록하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>