<%@ include file="../dbconn.jsp" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" border=1>
		<tr>
			<th>학번</th>
			<th>학과</th>
			<th>이름</th>
			<th>주소</th>
			<th>연락처</th>
		</tr>

	
	<%
		Statement stmt = null;
 		ResultSet rs = null;
 		
 		try{
 			String sql ="SELECT * FROM student";
 			stmt = conn.createStatement();
 			rs = stmt.executeQuery(sql);
 			
 			while(rs.next()){
 				String num = rs.getString("num");
 				String depart = rs.getString("depart");
 				String name = rs.getString("name");
 				String address = rs.getString("address");
 				String phone = rs.getString("phone");
	%>
		<tr>
		<td><%=num%></td>
		<td><%=depart%></td>
		<td><%=name%></td>
		<td><%=address%></td>
		<td><%=phone %></td>
	</tr>
 		<%	
 			}
 		} catch(SQLException ex){
 			out.print("student 테이블 호출에 실패했습니다.");
	 		out.print("SQLException : " + ex.getMessage());
 			
 		} finally {
 			if(stmt != null)
	 			stmt.close();
	 		if(rs != null)
	 			rs.close();
	 		if(conn != null)
	 			conn.close();
 		}
 		%>

	</table>
</body>
</html>