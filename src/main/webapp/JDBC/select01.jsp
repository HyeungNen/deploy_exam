<%@page import="org.apache.tomcat.dbcp.dbcp2.SQLExceptionList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member테이블조회_Statement</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
	<table width="300" border=1>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
		<%--
		Statement 객체를 이용하여 SELECT 쿼리문 실행 결과 값 가져오기
		 --%>
		 <%
		 	Statement stmt = null;
		 	ResultSet rs = null;
		 	
		 	try{
		 		// member 테이블의 모든 필드 값을 가져오도록 SELECT 문을 작성
		 		String sql = "select * from member";
		 		stmt = conn.createStatement();	// Statement 객체를 생성하도록 작성
		 		// SELECT 문을 실행하도록 Statememt 객체의 executeQuery() 메서드 작성
		 		rs = stmt.executeQuery(sql);
		 		
		 		// SELECT 문으로 가져온 레코드가 있을 때 까지 id, passwd, name 필드 값을 가져와 출력하도록 반복해서 실행
		 	 while(rs.next()){
		 		String id = rs.getString("id");
		 		String passwd = rs.getString("passwd");
		 		String name = rs.getString("name");
		 		
		 %>
		 <tr>
		 	<td><%=id %></td>
		 	<td><%=passwd %></td>
		 	<td><%=name %></td>
		 </tr>
		 
		 	<%
			 	}
		 	} catch(SQLException ex) {
		 		out.print("Member 테이블 호출에 실패했습니다.");
		 		out.print("SQLException : " + ex.getMessage());
		 	} finally {
		 		// 생성한 객체를 해제
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