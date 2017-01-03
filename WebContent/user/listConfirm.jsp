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
<link href="/BookR/css/listConfirm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="listConfirm.js"></script>
<title>BookR : 리스트목록 확인</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="text-center">${listCode }목록</h2>
					<table class="table">
						<tbody>
							<%
								int i = 1;
							%>
							<c:forEach var="book" items="${books }">
								<tr>
									<td>#<%=i++%></td>
									<td><img src="/BookR/bookImage/${book.getImage() }"
										height="100px" width="130px" class="img-responsive"></td>
									<td><a
										href="/BookR/book/info.do?book_code=${book.getCode() }&id=${sessionScope.id}">${book.getSubject() }</a></td>
									<td>${book.getGrade() }</td>
									<td><a
										href="/BookR/user/deleteBook.do?bookCode=${book.getCode() }&bookName=${book.getSubject() }&id=${sessionScope.id }&listCode=${listCode}"
										class="btn btn-primary">책 삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
						<thead>
							<tr>
								<th>#</th>
								<th>책 표지</th>
								<th>책 제목</th>
								<th>별점</th>
								<th>삭제버튼</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>