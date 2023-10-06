<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
	<%
		Connection connection = null;
	
		try{
			String url = "jdbc:mariadb://localhost:3306/servlet_sample_market";
			String user = "root";
			String password = "root";
			
			// JDBC 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException ex){
			out.print("데이터베이스 연결이 실패했습니다.<br>");
			out.print("SQLException : " + ex.getMessage());
		} finally {
			
		}
	%>
	
	<%
		// 주문번호 관련 처리
		String orderId = (String) session.getAttribute("orderId");
		if(orderId == null) {
			// 세션 ID가져오기
			String sessionId = session.getId();
		
		/* 현재 날짜와 시간 가져오기 */
		java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		String currentDateTime = simpleDateFormat.format(new java.util.Date());
		
		orderId = currentDateTime + "-" + sessionId;
		session.setAttribute("orderId", orderId);
		
		}
	%>