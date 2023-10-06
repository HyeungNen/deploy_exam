<%@ include file="../dbconn.jsp" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_process.jsp</title>
</head>
<body>
	 <%
	 	request.setCharacterEncoding("UTF-8");
	 
	 	String num = request.getParameter("num");
	 	String depart = request. getParameter("depart");
	 	String name = request.getParameter("name");
	 	String address = request.getParameter("address");
	 	String phone = request.getParameter("phone");
	 	
	 	PreparedStatement pstmt = null;	// PreparedStatement 참조변수를 null로 초기화
	 	
	 	try {
	 		String sql = "INSERT INTO student(num, depart, name, address, phone) values(?, ?, ?, ?, ?)";
	 		pstmt = conn.prepareStatement(sql);
	 		
	 		pstmt.setString(1, num);
	 		pstmt.setString(2, depart);
	 		pstmt.setString(3, name);
	 		pstmt.setString(4, address);
	 		pstmt.setString(5, phone);
	 		pstmt.executeUpdate();
	 		
	 		out.print("student 테이블에 데이터 삽입을 성공했습니다");
	 	} catch (SQLException ex){
	 		out.print("student 테이블에 데이터 삽입을 실패했습니다");
	 		out.print("SQLException : " + ex.getMessage());
	 	} finally {
	 		if(pstmt != null) pstmt.close();
	 		if(conn != null) conn.close();
	 	}
	 %>
</body>
</html>