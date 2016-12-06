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
<link href="/BookR/css/bookInfo.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="bookInfo.js"></script>
<title>첵 제목 : BookR</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<img
						src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
						class="img-responsive">
				</div>
				<div class="col-md-9">

					<div class="row">
						<div class="col-md-12">
							<div class="page-header">
								<h6>${mainCategory }>${subCategory }</h6>
								<h1>${book.getSubject() }</h1>
							</div>
							<div class="page-header">
								<h4>${book.getWriter() }</h4>
							</div>
							<div class="page-header">
								<h4>${book.getPublisher() }</h4>
							</div>
							<c:if test="${!empty sessionScope.id }">
								<div class="page-header">
									<select id="listCode" name="listCode">
										<option value="">담을 리스트를 선택해주세요</option>
										<c:forEach var="myList" items="${myLists }">
											<option value="${myList.getListCode() }">${myList.getListCode() }</option>
										</c:forEach>
									</select> <input type="hidden" id="id" value="${sessionScope.id }" /> <input
										type="hidden" id="bookCode" value="${book.getCode() }" />
									<button id="insertList" class="btn btn-primary">리스트에담기</button>
									<%-- <h2>이 책은 list ${listCode }에 담겨있습니다.</h2> --%>

									<button id="makeList" class="btn btn-primary">새 리스트
										만들면서 리스트에 담기</button>

								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" method="post">
						<div class="form-group">
							<div class="col-sm-4">
								<h4>별점</h4>
								<select id="grade" name="grade">
									<c:set var="grade" value="${grade }" />
									<c:choose>
										<c:when test="${grade == 1}">
											<option value="0">별점을 매겨주세요</option>
											<option value="5">5</option>
											<option value="4">4</option>
											<option value="3">3</option>
											<option value="2">2</option>
											<option value="1" selected>1</option>
										</c:when>
										<c:when test="${grade eq 2}">
											<option value="0">별점을 매겨주세요</option>
											<option value="5">5</option>
											<option value="4">4</option>
											<option value="3">3</option>
											<option value="2" selected>2</option>
											<option value="1">1</option>
										</c:when>
										<c:when test="${grade eq 3}">
											<option value="0">별점을 매겨주세요</option>
											<option value="5">5</option>
											<option value="4">4</option>
											<option value="3" selected>3</option>
											<option value="2">2</option>
											<option value="1">1</option>
										</c:when>
										<c:when test="${grade eq 4}">
											<option value="0">별점을 매겨주세요</option>
											<option value="5">5</option>
											<option value="4" selected>4</option>
											<option value="3">3</option>
											<option value="2">2</option>
											<option value="1">1</option>
										</c:when>
										<c:when test="${grade eq 5}">
											<option value="0">별점을 매겨주세요</option>
											<option value="5" selected>5</option>
											<option value="4">4</option>
											<option value="3">3</option>
											<option value="2">2</option>
											<option value="1">1</option>
										</c:when>
										<c:otherwise>
											<option value="0" selected>별점을 매겨주세요</option>
											<option value="5">5</option>
											<option value="4">4</option>
											<option value="3">3</option>
											<option value="2">2</option>
											<option value="1">1</option>
										</c:otherwise>

									</c:choose>
								</select>
							</div>
							<div class="col-sm-5">
								<textarea id="review" name="review" cols="50">${review }</textarea>
							</div>

							<div class="col-sm-3">
								<input type="hidden" id="idRG" value="${sessionScope.id }" /> <input
									type="hidden" id="bookCodeRG" value="${book.getCode() }" />
								<button type="submit" class="btn btn-primary" id="review_grade">리뷰남기기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<c:forEach var="list" items="${rgLists }">
				<div class="row">
					<div class="col-md-3">
						<div class="page-header">
							<h1>${list.getId() }</h1>
						</div>
					</div>
					<div class="col-md-9">
						<p>${list.getReview() }</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>