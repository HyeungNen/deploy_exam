<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 동작 페이지</title>
<%@ include file="../inc/dbconn.jsp"%>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String memberId = request.getParameter("memberId"); 
	String passwd = request.getParameter("passwd"); 
	
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	String sql = "select * from member where memberId = ? and passwd = ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, memberId);
	preparedStatement.setString(2, passwd);
	resultSet = preparedStatement.executeQuery();
	
	if (resultSet.next()) {
		String memberName = resultSet.getString("memberName");
		session.setAttribute("sessionMemberId", memberId);
		session.setAttribute("sessionMemberName", memberName);
		response.sendRedirect("resultMember.jsp?msg=2");
		
		sql = "UPDATE cart SET memberId = ? WHERE orderId =?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, memberId);
		preparedStatement.setString(2, orderId);
		preparedStatement.executeUpdate();
		
		sql = "UPDATE cart SET orderId = ? WHERE memberId =? AND orderId != ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, orderId);
		preparedStatement.setString(2, memberId);
		preparedStatement.setString(3, orderId);
		preparedStatement.executeUpdate();
	}
	
	else {
		response.sendRedirect("loginMember.jsp?error=1");
	}
	
	if (resultSet != null) {
		resultSet.close();
	}
	
	if (preparedStatement != null) {
		preparedStatement.close();
	}
	if (connection != null) {
		connection.close();
	}
	
	
	
	%>
</body>
</html>