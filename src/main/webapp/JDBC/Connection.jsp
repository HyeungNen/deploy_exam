<%@page import="java.sql.*"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC API로 데이터베이스 접속하기</title>
</head>
<body>
	<%--
	JDBC로 API 데이터베이스 접속하기
	1) Connection 객체를 null로 초기화
	2) 데이터베이스와 연동하기 위해 JDBC를 로딩하도록 Class.forName()메서드 작성
	3) DriverManager 객체로부터 Connection 객체를 얻어오도록 getConnection() 메서드를 작성
	 --%>
	 <%
	 	Connection conn = null;
	 try{
		 String url = "jdbc:mariadb://localhost:3306/servlet_sample_market";	// 로컬호스트 기입 꼭 하자
		 String user = "root";
		 String password = "root";
		 
		 Class.forName("org.mariadb.jdbc.Driver");
		 conn = DriverManager.getConnection(url, user, password);
		 out.println("데이터베이스 연결이 성공되었습니다.");
	 }	catch (SQLException ex){
		 out.println("데이터베이스 연결이 실패되었습니다.");
		 out.println("SQLException: " + ex.getMessage());
	 }	finally {
		if(conn != null){
			 conn.close();
		 }
	 }
	 %>
</body>
</html>