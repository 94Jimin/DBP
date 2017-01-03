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
<link href="/BookR/css/main.css" rel="stylesheet" type="text/css">
<title>BookR</title>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<a  href="/BookR/search/keyword.do" class="btn btn-primary">#키워드로 검색하기</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="section">
						<div class="container">
							<div class="row">
								<div class="col-md-3">
									<ul class="lead list-group text-center">
										<c:forEach var="List" items="${MCList }">
											<li class="list-group-item"><a
												href="/BookR/index.do?main_code=${List.getCode() }">${List.getName() }</a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="col-md-9">
									<div class="row">
										<c:forEach var="book" items="${bookList }">
											<div class="col-md-4">
												<a
													href="/BookR/book/info.do?book_code=${book.getCode() }&id=${sessionScope.id}">
													<img src="/BookR/bookImage/${book.getImage() }"
													width="250px" height="330px">
												</a> <a
													href="/BookR/book/info.do?book_code=${book.getCode() }&id=${sessionScope.id}">
													<h5 class="text-center">${book.getSubject() }</h5>
												</a>
											</div>
										</c:forEach>
									</div>
									<!-- <div class="row">
										<div class="col-md-12">
											<ul class="pager">
												<li><a href="#">← Prev</a></li>
												<li><a href="#">Next →</a></li>
											</ul>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>