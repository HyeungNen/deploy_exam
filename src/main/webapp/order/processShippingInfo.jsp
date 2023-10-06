<%@page import="java.net.URLEncoder"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
</head>
<body>
	<%
		String encoding ="UTF-8";
		request.setCharacterEncoding(encoding);
		
/* 		Cookie orderId = new Cookie("orderId", URLEncoder.encode(request.getParameter("orderId"), encoding));
		Cookie orderName = new Cookie("orderName", URLEncoder.encode(request.getParameter("orderName"), encoding));
		Cookie tel = new Cookie("tel", URLEncoder.encode(request.getParameter("tel"), encoding));
		Cookie zipCode = new Cookie("zipCode", URLEncoder.encode(request.getParameter("zipCode"), encoding));
		Cookie address1 = new Cookie("address1", URLEncoder.encode(request.getParameter("address1"), encoding));
		Cookie address2 = new Cookie("address2", URLEncoder.encode(request.getParameter("address2"), encoding)); */
		
		
		// 세션에 데이터 저장
		session.setAttribute("orderId", request.getParameter("orderId"));
		session.setAttribute("orderName", request.getParameter("orderName"));
		session.setAttribute("tel", request.getParameter("tel"));
		session.setAttribute("zipCode", request.getParameter("zipCode"));
		session.setAttribute("address1", request.getParameter("address1"));
		session.setAttribute("address2", request.getParameter("address2"));
		
/* 		
		int maxAge = 24 * 60 * 60;
		orderId.setMaxAge(maxAge);
		orderName.setMaxAge(maxAge);
		tel.setMaxAge(maxAge);
		zipCode.setMaxAge(maxAge);
		address1.setMaxAge(maxAge);
		address2.setMaxAge(maxAge);
		
		response.addCookie(orderId);
		response.addCookie(orderName);
		response.addCookie(tel);
		response.addCookie(zipCode);
		response.addCookie(address1);
		response.addCookie(address2);
		 */
		 
		response.sendRedirect("orderConfirm.jsp");
	%>

</body>
</html>