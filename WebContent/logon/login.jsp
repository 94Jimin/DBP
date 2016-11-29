<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="login.css" rel="stylesheet" type="text/css">
<title>BookR : 로그인</title>
</head>
<body>

<div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#"><span>BookR</span></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="#">sign in</a>
            </li>
            <li draggable="true">
              <a href="#">sign out</a>
            </li>
            <li draggable="true">
              <a href="#">sign out</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <a href="#"><img src="image/BookR_green.png" class="center-block img-responsive"></a>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <form class="form-horizontal" role="form">
            <div class="form-group">
              <div class="col-sm-10">
                <input type="text" class="form-control input-lg" id="inputEmail3" placeholder="아이디">
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-10">
                <input type="password" class="form-control input-lg" id="inputPassword3" placeholder="비밀번호">
              </div>
            </div>
          </form>
        </div>
        <div class="row">
          <div class="col-md-12">
            <a class="btn btn-block btn-primary">로그인</a>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <hr>
          </div>
        </div>
        <div class="row text-center">
          <a href="#"><h5>회원가입</h5></a>
        </div>
      </div>
    </div>




</body>
</html>