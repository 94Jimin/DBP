<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="book" items="${books }">
	<div class="row">
		<div class="col-md-3">
			<a
				href="/BookR/book/info.do?book_code=${book.getCode() }&id=${sessionScope.id}">
				<img src="/BookR/bookImage/${book.getImage() }"
				class="img-responsive">
			</a>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-12">
					<div class="page-header">
						<a
							href="/BookR/book/info.do?book_code=${book.getCode() }&id=${sessionScope.id}">
							<h2>${book.getSubject() }</h2>
						</a>
					</div>
					<div class="page-header">
						<h4>${book.getWriter() }</h4>
					</div>
					<div class="page-header">
						<h4>${book.getGrade() }점</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>