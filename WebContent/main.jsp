<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<link href="css/main.css" rel="stylesheet" type="text/css">
<title>BookR</title>
</head>
<body>

	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><span>BookR</span></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="mngr/managerMain.jsp">관리자</a></li>
					<li><a href="user/userInfo.jsp">박지민님</a></li>
					<li><a href="logon/login.jsp">sign in</a></li>
					<li><a href="logon/signup.jsp">sign up</a></li>
					<li><a href="#">sign out</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row" vertical-align="middle">
				<div class="col-md-2 text-justify">
					<img src="image\BookR.png" class="img-responsive">
				</div>
				<div class="col-md-10" vertical-align="middle">
					<form class="form-horizontal" role="form"
						action="search/searchDone.jsp">
						<div class="form-group has-feedback">
							<div class="col-sm-10 text-center">
								<input type="text" class="form-control input-lg"
									placeholder="책을 검색하세요">
							</div>
							<div class="col-sm-2 text-center">
								<button type="submit" class="btn btn-block btn-default btn-lg">
									<i class="fa fa-fw fa-search"></i>검색
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="section">
						<div class="container">
							<div class="row">
								<div class="col-md-3">
									<ul class="lead list-group text-center">
										<li class="list-group-item">소설</li>
										<li class="list-group-item">경제/경영</li>
										<li class="list-group-item">자기계발</li>
										<li class="list-group-item">여행</li>
										<li class="list-group-item">과학</li>
										<li class="list-group-item">컴퓨터/IT</li>
										<li class="list-group-item">건강/다이어트</li>
									</ul>
								</div>
								<div class="col-md-3">
									<a href="#"> <img
										src="https://unsplash.imgix.net/reserve/QTrNn7DETWGsjyS5L2n5__MG_8345.jpg?w=1024&amp;q=50&amp;fm=jpg&amp;s=f89d9bb3940033eca06ed432a250bb6d"
										class="img-responsive"></a> <a href="book/bookInfo.jsp">
										<h3 class="text-center">Heading</h3>
									</a>
								</div>
								<div class="col-md-3">
									<a href="#"> <img
										src="https://unsplash.imgix.net/reserve/QTrNn7DETWGsjyS5L2n5__MG_8345.jpg?w=1024&amp;q=50&amp;fm=jpg&amp;s=f89d9bb3940033eca06ed432a250bb6d"
										class="img-responsive"></a> <a href="book/bookInfo.jsp">
										<h3 class="text-center">Heading</h3>
									</a>
								</div>
								<div class="col-md-3">
									<a href="#"> <img
										src="https://unsplash.imgix.net/reserve/QTrNn7DETWGsjyS5L2n5__MG_8345.jpg?w=1024&amp;q=50&amp;fm=jpg&amp;s=f89d9bb3940033eca06ed432a250bb6d"
										class="img-responsive"></a> <a href="book/bookInfo.jsp">
										<h3 class="text-center">Heading</h3>
									</a>
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