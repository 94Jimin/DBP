<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="listCode" value="${listCode }"></c:set>
<%
	String listCode = request.getParameter("listCode");
	String bookName = request.getParameter("bookName");
%>
<script>
alert('<%=bookName%>' + '이(가) 삭제되었습니다.');
window.location.href = '/BookR/user/listConfirm.do?listCode='+'<%=listCode%>';
</script>
<%-- <%
	response.sendRedirect("/BookR/user/listConfirm.do?listCode=" + listCode);
%> --%>