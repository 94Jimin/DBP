<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-sm-3">
	<select size="5" style="width: 100%" id="keywordGroup1" name="keywordGroup1">
		<c:forEach var="list" items="${keywordInfo1 }">
			<option value="${list.getCode() }">${list.getName() }</option>
		</c:forEach>
	</select>
</div>
<div class="col-sm-3">
	<select size="5" style="width: 100%" id="keywordGroup2" name="keywordGroup2">
		<c:forEach var="list" items="${keywordInfo2 }">
			<option value="${list.getCode() }">${list.getName() }</option>
		</c:forEach>
	</select>
</div>
<div class="col-sm-3">
	<select size="5" style="width: 100%" id="keywordGroup3" name="keywordGroup3">
		<c:forEach var="list" items="${keywordInfo3 }">
			<option value="${list.getCode() }">${list.getName() }</option>
		</c:forEach>
	</select>
</div>