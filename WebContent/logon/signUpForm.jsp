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
<title>BookR : ȸ������</title>
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
								<label for="id" class="control-label">���̵�</label>
							</div>
							<div class="col-sm-7">
								<input type="text" name="id" class="form-control" id="id"
									placeholder="���̵�">
							</div>
							<div class="col-sm-3">
								<a id="checkId" class="btn btn-success">ID�ߺ�Ȯ��</a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="passwd" class="control-label">��й�ȣ</label>
							</div>
							<div class="col-sm-10">
								<input type="password" name="passwd" class="form-control"
									id="passwd" placeholder="��й�ȣ�� �Է��ϼ���">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="passwd_2" class="control-label">��й�ȣ Ȯ��</label>
							</div>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="passwd_2"
									placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="name" class="control-label">�̸�</label>
							</div>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="�̸�">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="gender" class="control-label">����</label>
							</div>
							<div class="col-sm-5">
								<input type="radio" name="gender" value="F" id="gender">
								<h6>����</h6>
							</div>
							<div class="col-sm-5">
								<input type="radio" name="gender" value="M" id="gender">
								<h6>����</h6>
							</div>
						</div>
						<div class="input-group">
							<div class="col-md-3">

								<button id="signup" class="btn btn-success">
									<i class="fa fa-fw fa-check"></i>�����ϱ�
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