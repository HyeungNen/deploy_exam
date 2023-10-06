<%@page import="dto.Cart" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택삭제</title>
</head>
<body>
    <%
    	String[] checkedId = request.getParameterValues("checkedId");    	
    	PreparedStatement preparedStatement = null;
    	
    	if(checkedId != null){
    		for(String productId : checkedId){
    			try {
    			String sql ="DELETE FROM cart WHERE productId = ? AND orderId = ?";
    			preparedStatement = connection.prepareStatement(sql);
    			preparedStatement.setString(1, productId);
    			preparedStatement.setString(2, orderId);
    			preparedStatement.executeUpdate();
    			} catch (SQLException ex){
    			out.print("SQLException : " + ex.getMessage());
    		}
    	}
   	} // for
    		if(preparedStatement != null){
    		}
    		preparedStatement.close();
    		if(connection != null) {
    		connection.close();
    		}
    	response.sendRedirect("./cart.jsp");
    	%>
<!-- /*    	// 세션을 장바구니 목록을 가져옴
		ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
    	
    	String[] checkedId = request.getParameterValues("checkedId");
    	out.print(checkedId);
    	if(checkedId != null){
    		for(String s : checkedId){
    			out.print(s);
    			for(int i = 0; i < carts.size(); i++){ 
    				Cart cart = carts.get(i);
    				if(cart.getProductId().equals(s)){
    					carts.remove(cart);
    					break;
    				}
    			}
    		}
    	} */ -->
</body>
</html>