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
<link href="/BookR/css/ManagerMain.css" rel="stylesheet" type="text/css">
<title>BookR : 관리자 페이지</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2 class="text-center">관리자 기능</h2>
					<table class="table">
						<tbody>
							<tr>
								<td>책 등록</td>
								<td><a href="/BookR/mngr/bookRegister.do">책 등록</a></td>
							</tr>
							<tr>
								<td>키워드 등록</td>
								<td><a href="/BookR/mngr/keywordRegister.do">키워드 등록</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>