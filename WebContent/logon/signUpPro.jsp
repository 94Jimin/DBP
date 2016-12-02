<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	request.setCharacterEncoding("utf-8");
%>
<%
	//단계1 : JDBC 드라이버 로드
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//단계2 : 커넥션 객체 생성
	String connectionURL = "jdbc:sqlserver://localhost:1433;databaseName=BookR;user=sa;password=11";
	Connection con = DriverManager.getConnection(connectionURL);
	//단계3 : PreparedStatement 객체 생성
	PreparedStatement pstmt = null;

	//단계4 :폼에서 입력한 값을 받아서 각각의 메모리 변수에 저장
	String id = request.getParameter("member_id");
	String passwd = request.getParameter("member_passwd");
	String name = request.getParameter("member_name");
	String gender = request.getParameter("member_gender");
	String favorite = request.getParameter("member_favorite");

	//단계5 : PreparedStatement 객체로 실행할 SQL 문 생성
	String SQL = "insert into MEMBER(member_id, member_passwd, member_name, member_reg_date, member_gender, member_favorite) ";
	SQL += "values(?,?,?,getdate(),?,?);";

	pstmt = con.prepareStatement(SQL);

	// 단계6 : PreparedStatement 객체로 실행할 SQL 문의 ? 위치에 각각의 값을 세팅
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, favorite);

	int result = pstmt.executeUpdate();

	//단계7 :객체 종료
	pstmt.close();
	con.close();

	response.sendRedirect("../main.jsp");
%> --%>