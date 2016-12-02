<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:if test="${type==0 }">
	<jsp:include page="관리자 페이지" />
</c:if>
<c:if test="${type==1 }">
	<jsp:include page="멤버페이지" />
</c:if> --%>


<jsp:include page="${cont }" />
