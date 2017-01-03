<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/BookR/index.do?main_code=100"><span>BookR</span></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
		<script type="text/javascript">
		$(document).ready( function() {
			$("#logout").click(function(){
				$.ajax({
					type: "POST",
					url: "/BookR/logout.do",
					success: function(data){
						window.location.href="/BookR/index.do?main_code=100";
						alert("logout되었습니다.");
					}
				});
			});
		});
		</script>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${!empty sessionScope.id }">
				<c:if test="${sessionScope.id eq 'admin' }">
					<li><a href="/BookR/mngr/main.do">admin 님</a></li>
				</c:if>
				<c:if test="${sessionScope.id ne 'admin'  }">
				<li><a href="/BookR/user/info.do?id=${sessionScope.id}">${sessionScope.id }
							님</a></li>
				</c:if>
					<li><a href="#">sign in</a></li>
					<li><a href="#">sign up</a></li>
					<li><a href="" id="logout">log out</a></li>
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
				<a href="/BookR/index.do?main_code=100"> <img
					src="/BookR/image/BookR_green.png" class="img-responsive">
				</a>
			</div>
			<div class="col-md-10" vertical-align="middle">
				
			</div>
		</div>
	</div>
</div>