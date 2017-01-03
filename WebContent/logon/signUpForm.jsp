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
<link href="/BookR/css/signup.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/BookR/logon/signUp.js"></script>
<title>BookR : 회원가입</title>
</head>
<body>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="/BookR/index.do?main_code=100"> <img
						src="/BookR/image/BookR_green.png"
						class="center-block img-responsive"></a>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-2">
								<label for="id" class="control-label">아이디</label>
							</div>
							<div class="col-sm-7">
								<input type="text" name="id" class="form-control" id="id"
									placeholder="아이디">
							</div>
							<div class="col-sm-3">
								<a id="checkId" class="btn btn-success">ID중복확인</a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="passwd" class="control-label">비밀번호</label>
							</div>
							<div class="col-sm-10">
								<input type="password" name="passwd" class="form-control"
									id="passwd" placeholder="비밀번호를 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="passwd_2" class="control-label">비밀번호 확인</label>
							</div>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="passwd_2"
									placeholder="비밀번호를 한번 더 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="name" class="control-label">이름</label>
							</div>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="이름">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="gender" class="control-label">성별</label>
							</div>
							<div class="col-sm-5">
								<input type="radio" name="gender" value="F" id="gender">
								<h6>여자</h6>
							</div>
							<div class="col-sm-5">
								<input type="radio" name="gender" value="M" id="gender">
								<h6>남자</h6>
							</div>
						</div>
						<div class="input-group">
							<div class="col-md-3">

								<button id="signup" class="btn btn-success">
									<i class="fa fa-fw fa-check"></i>가입하기
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>