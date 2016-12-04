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
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="/BookR/css/bookInfo.css" rel="stylesheet" type="text/css">
<title>ý ���� : BookR</title>
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
								<h6>${mainCategory } > ${subCategory }</h6>
								<h1>${book.getSubject() }</h1>
							</div>
							<div class="page-header">
								<h4>${book.getWriter() }</h4>
							</div>
							<div class="page-header">
								<h4>${book.getPublisher() }</h4>
							</div>


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
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="col-sm-7">
								<textarea></textarea>
							</div>
							<div class="col-sm-3">
								<button type="submit" class="btn btn-primary">���� �����</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div class="page-header">
						<h1>�ۼ���</h1>
					</div>
				</div>
				<div class="col-md-9">
					<p>����</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>