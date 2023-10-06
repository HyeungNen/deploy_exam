<%@page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<form method="post" action="insert_process.jsp">
		<p> 학번 : <input type="text" name="num"></p>
		<p> 학과 : <input type="text" name="depart"></p>
		<p> 이름 : <input type="text" name="name"></p>
		<p> 주소 : <input type="text" name="address"></p>
		<p> 연락처 : <input type="text" name="phone"></p>
		<p> <input type="submit" value="전송"></p>
	</form>
</body>
</html>