<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check eq 1 }">
<script>
alert("책 등록에 성공 했습니다.");
window.location.href="/BookR/mngr/main.do";
</script>
</c:if>
<c:if test="${check eq -1 }">
<script>
	alert("이미 존재하는 책입니다.");
	window.location.href="/BookR/mngr/bookRegister.do";
</script>
</c:if>
