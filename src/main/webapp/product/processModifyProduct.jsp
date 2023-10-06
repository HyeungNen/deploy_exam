<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="../inc/dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processModifyProduct</title>
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
	ResultSet resultSet = null;
	
	String sql = "SELECT * FROM product WHERE productId = ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, productId);
	resultSet = preparedStatement.executeQuery();
	
	if(resultSet.next()) { // productId에 대한 상품이 있다면 
		if(fileName != null){	// 첨부 파일이 있는 경우
		sql = "UPDATE product SET productName = ? , unitPrice = ? , description = ? , manufacturer = ? ,"
				+ " category = ? , unitInStock = ? , `condition` = ? , fileName = ? WHERE productId = ?";
	
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, productName);
		preparedStatement.setInt(2, price);
		preparedStatement.setString(3, description);
		preparedStatement.setString(4, manufacturer);
		preparedStatement.setString(5, category);
		preparedStatement.setLong(6, stock);
		preparedStatement.setString(7, condition);
		preparedStatement.setString(8, fileName);
		preparedStatement.setString(9, productId);
		preparedStatement.executeUpdate();
		}		
	
		else {
		sql = "UPDATE product SET productName = ? , unitPrice = ? , description = ? , manufacturer = ? , " +
				"category = ? , unitInStock = ? , `condition` = ? WHERE productId = ?";
		
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, productName);
		preparedStatement.setInt(2, price);
		preparedStatement.setString(3, description);
		preparedStatement.setString(4, manufacturer);
		preparedStatement.setString(5, category);
		preparedStatement.setLong(6, stock);
		preparedStatement.setString(7, condition);
		preparedStatement.setString(8, productId);
		preparedStatement.executeUpdate();
		}
	}
	
	if(resultSet != null){
		resultSet.close();
	}
	
	if(preparedStatement != null) {
		preparedStatement.close();
	}
	if(connection != null) {
		connection.close();
	}
	
	response.sendRedirect("editProduct.jsp");
%>
</body>
</html>