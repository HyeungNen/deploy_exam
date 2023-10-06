<%@page import="java.util.*" %>
<%@ include file="../inc/dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기</title>
</head>
<body>
	<%
		String productId = request.getParameter("productId");
		if (productId == null || productId.trim().equals("")){
			// null이 반환하거나 빈 문자열이 들어온 경우
			response.sendRedirect("../products.jsp");
			return;
		}
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		// 주문번호 관련 처리가 있던 코드 
		
		
		
		
		// 동일한 주문 번호에 같은 상품 번호가 있으면 업데이트
		String sql = "SELECT num FROM cart WHERE (orderId = ?) AND (productId = ?)";
		
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, orderId);
		preparedStatement.setString(2, productId);
		resultSet = preparedStatement.executeQuery();
			
		if(resultSet.next()){	// 동일한 상품이 있는경우 갯수 업데이트
			sql = "UPDATE cart SET cnt = cnt + 1 WHERE num = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, resultSet.getInt("num"));
			preparedStatement.executeUpdate();
			
		}
		else {
			// 회원 번호 관련 처리
			String memberId = (String) session.getAttribute("sessionMemberId");
			memberId = (memberId == null) ? "Guest" : memberId;
			
			int cnt = 1;
			
			sql = "INSERT INTO cart (orderId, memberId, productId, cnt, addDate)" +
			"VALUES (?, ?, ?, ? , now())";
			
			try {
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, orderId);
				preparedStatement.setString(2, memberId);
				preparedStatement.setString(3, productId);
				preparedStatement.setInt(4, cnt);
				preparedStatement.executeUpdate();
				
			} catch(SQLException ex) {
				throw new RuntimeException(ex);
			}
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
		// 상품 상세 페이지 이동
		response.sendRedirect("../product/product.jsp?productId="+ productId);
	%>
</body>
</html>