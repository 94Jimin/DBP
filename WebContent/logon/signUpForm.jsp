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
<link href="../css/signup.css" rel="stylesheet" type="text/css">
<title>BookR : 회원가입</title>
</head>
<body>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="../main.jsp"><img src="../image/BookR_green.png"
						class="center-block img-responsive"></a>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" action="signUpPro.jsp">
						<div class="form-group">
							<div class="col-sm-2">
								<label for="member_id" class="control-label">아이디</label>
							</div>
							<div class="col-sm-10">
								<input type="text" name="member_id" class="form-control"
									id="member_id" placeholder="아이디">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="member_passwd" class="control-label">비밀번호</label>
							</div>
							<div class="col-sm-10">
								<input type="password" name="member_passwd" class="form-control"
									id="member_passwd" placeholder="비밀번호를 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="member_passwd_2" class="control-label">비밀번호
									확인</label>
							</div>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="member_passwd_2"
									placeholder="비밀번호를 한번 더 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="member_name" class="control-label">이름</label>
							</div>
							<div class="col-sm-10">
								<input type="text" name="member_name" class="form-control"
									id="member_name" placeholder="이름">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="member_gender" class="control-label">성별</label>
							</div>
							<div class="col-sm-5">
								<input type="radio" name="member_gender" value="F"
									class="form-control" id="member_gender">
								<h6>여자</h6>
							</div>
							<div class="col-sm-5">
								<input type="radio" name="member_gender" value="M"
									class="form-control" id="member_gender">
								<h6>남자</h6>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="member_favorite" class="control-label">선호장르</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="member_favorite">
							</div>
						</div>
						<div class="input-group">
							<div class="col-md-offset-3 col-md-6">
								<!-- <span class="input-group-btn"> <a href="signUpPro.jsp"
									class="btn btn-block btn-success" type="submit"> <i
										class="fa fa-fw fa-check"></i>가입하기
								</a>
								</span> -->
								<input type="submit" value="가입하기"/>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>