<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processRemoveProduct</title>
</head>
<body>
	<%
		String productId = request.getParameter("productId");
	
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "SELECT * FROM product WHERE productId = ? ";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, productId);
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			sql = "DELETE FROM product WHERE productId = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, productId);
			preparedStatement.executeUpdate();
		}
		else {
			out.print("일치하는 상품이 없습니다");
		}
		
		if(resultSet != null) {
			resultSet.close();
		}
		if(connection != null) {
			connection.close();
		}
		if(preparedStatement != null) {
			preparedStatement.close();
		}
		
		response.sendRedirect("editProduct.jsp");
	%>
</body>
</html>