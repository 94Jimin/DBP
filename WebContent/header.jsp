<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/BookR/index.do?main_code=200"><span>BookR</span></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${!empty sessionScope.id }">
					<li><a href="/BookR/user/info.do?id=${sessionScope.id}">${sessionScope.id }
							님</a></li>
					<li><a href="#">sign in</a></li>
					<li><a href="#">sign up</a></li>
					<li><a href="/BookR/logout.do">log out</a></li>
				</c:if>
				<c:if test="${empty sessionScope.id }">
					<li><a href="/BookR/login.do">sign in</a></li>
					<li><a href="/BookR/signup.do">sign up</a></li>
					<li><a href="#">log out</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row" vertical-align="middle">
			<div class="col-md-2 text-justify">
				<a href="/BookR/index.do?main_code=200"> <img
					src="/BookR/image/BookR_green.png" class="img-responsive">
				</a>
			</div>
			<div class="col-md-10" vertical-align="middle">
				<form class="form-horizontal" role="form">
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
	</div>
</div>