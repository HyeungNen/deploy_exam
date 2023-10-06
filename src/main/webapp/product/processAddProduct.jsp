<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="../inc/dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String folder = "C://upload";
		int maxsize = 5 * 1024 * 1024 ;	
		String encType = "UTF-8";	
		
		MultipartRequest multipartRequest = new MultipartRequest(request, folder, maxsize, encType,
				new DefaultFileRenamePolicy());
		
		String productId = multipartRequest.getParameter("productId"); // 상품 아이디
		String productName = multipartRequest.getParameter("productName"); // 상품명
		String unitPrice = multipartRequest.getParameter("unitPrice"); // 상품 가격
		System.out.println(multipartRequest.getParameter("unitPrice"));
		System.out.println(unitPrice);
		String description = multipartRequest.getParameter("description"); // 상품 설명
		String manufacturer = multipartRequest.getParameter("manufacturer"); // 제조사
		String category = multipartRequest.getParameter("category"); // 분류
		String unitInStock = multipartRequest.getParameter("unitInStock"); // 재고수
		String condition = multipartRequest.getParameter("condition"); // 신상품 or 중고품 or 재생품
		String fileName = multipartRequest.getFilesystemName("fileName"); 
		
		// 문자열을 변경
		Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
		Long stock = unitInStock.isEmpty() ? 0L : Long.parseLong(unitInStock);
		
		PreparedStatement preparedStatement = null;
		
		String sql = "INSERT INTO product values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, productId);
		preparedStatement.setString(2, productName);
		preparedStatement.setInt(3, price);
		preparedStatement.setString(4, description);
		preparedStatement.setString(5, manufacturer);
		preparedStatement.setString(6, category);
		preparedStatement.setLong(7, stock);
		preparedStatement.setString(8, condition);
		preparedStatement.setString(9, fileName);
		preparedStatement.executeUpdate();
		
		if(preparedStatement != null) {
			preparedStatement.close();
		}
		if(connection != null) {
			connection.close();
		}
		
		response.sendRedirect("products.jsp");
	%>
</body>
</html>