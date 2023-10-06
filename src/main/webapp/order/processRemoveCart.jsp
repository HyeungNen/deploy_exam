<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체삭제</title>
</head>
<body>
		<%
		PreparedStatement preparedStatement = null;
		
		String sql = "DELETE FROM cart WHERE orderId = ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, orderId);
		preparedStatement.executeUpdate();
		
		if(preparedStatement != null) {
			preparedStatement.close();
		}
		if(connection != null) {
			preparedStatement.close();
		}
		
		response.sendRedirect("cart.jsp");
		
		%>
		
		
		
	<%-- 	<%
		session.invalidate();
		response.sendRedirect("cart.jsp");	
		%> --%>
</body>
</html>