<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=BookR;user=sa;password=11";
	Connection con = DriverManager.getConnection(connectionURL);
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String SQL = "select id from MEMBER where id=? and passwd=?;";

	pstmt = con.prepareStatement(SQL);

	pstmt.setString(1, id);
	pstmt.setString(2, passwd);

	rs = pstmt.executeQuery();

	if (rs.next()) {
		session.setAttribute("id", id);
	}
	response.sendRedirect("../main.jsp");
%> --%>

<c:if test="${check == 1 }">
	<c:set var="id" value="${id }" scope="session" />
</c:if>
