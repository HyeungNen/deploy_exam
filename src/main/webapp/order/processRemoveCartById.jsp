<%@ include file="../inc/dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
	String productId = request.getParameter("productId");
	if (productId == null || productId.trim().equals("")){ 
		// productId가 null을 반환하거나 빈 문자열일 경우의 조건식
		response.sendRedirect("../product/products.jsp");
		PreparedStatement preparedStatement = null;
		try {
			String sql = "DELETE FROM cart WHERE productId = ? AND orderId = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, productId);
			preparedStatement.setString(2, orderId);
			preparedStatement.executeUpdate();
			
		} catch(SQLException ex) {
			out.print("SQLException : " + ex.getMessage());
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}
	
	response.sendRedirect("./cart.jsp");
	%>