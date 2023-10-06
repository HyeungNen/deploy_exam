<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update01_process.jsp</title>
</head>
<body>
	 <%
	 	request.setCharacterEncoding("UTF-8");
	 
	 	String id = request.getParameter("id");
	 	String passwd = request. getParameter("passwd");
	 	String name = request.getParameter("name");
	 	
	 	Statement stmt = null;
	 	ResultSet rs = null;
	 	
	 	try{
	 		String sql = "select id, passwd from member where id= '" + id + "'";
	 		stmt = conn.createStatement();
	 		rs = stmt.executeQuery(sql);
	 		
	 		// SELECT 문으로 가져온 레코드가 있으면 실행
	 		
	 		if(rs.next()){
	 			String rId = rs.getString("id");
	 			String rPasswd = rs.getString("passwd");
	 			
	 			if(id.equals(rId) && passwd.equals(rPasswd)){
	 				// member 테이블에서 폼 페이지로 부터 전송된 id와 일치하는 레코드를 찾아
	 				// name 필드 값을 변경하도록 UPDATE문을 작성
	 				sql = "UPDATE member set name = '" + name + "' where id = '" + id + "'";
	 				stmt = conn.createStatement();
	 				// UPDATE문을 실행하도록 Statement 객체의 executeUpdate() 메서드를 작성
	 				stmt.executeUpdate(sql);
	 				out.print("Member 테이블을 수정했습니다.");
	 			}
	 			else {
	 				out.print("일치하는 비밀번호가 아닙니다.");
	 			}
	 		} else {
	 			out.print("Member 테이블에 일치하는 아이디가 없습니다.");
	 		}
	 	} catch(SQLException ex){
	 		out.print("SQLException : " + ex.getMessage());
	 	} finally {
	 		if(rs != null) rs.close();
	 		if(stmt != null) stmt.close();
	 		if(conn != null) conn.close();
	 	} 	
	 %>
</body>
</html>