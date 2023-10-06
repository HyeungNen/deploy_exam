<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include용으로 Connection하기 위한 JSP</title>
</head>
<body>
	<%--
		예제 공부할동안 include 전용으로 사용할 JSP (DB커넥션이라는 뜻으로 JSP파일을 생성함)
	 --%>
	<%
	 	Connection conn = null;
		String url = "jdbc:mariadb://localhost:3306/sample";	
		String user = "root";
		String password = "root";
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	%>
</body>
</html>