<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert02_process.jsp</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	
	 <%
	 	request.setCharacterEncoding("UTF-8");
	 
	 	String id = request.getParameter("id");
	 	String passwd = request. getParameter("passwd");
	 	String name = request.getParameter("name");
	 	
	 	PreparedStatement pstmt = null;	// PreparedStatement 참조변수를 null로 초기화
	 	
	 	try {
	 		// member 테이블의 id, passwd, name 필드에 정해지지 않은 값을 삽입하도록 INSERT문을 작성
	 		String sql = "INSERT INTO member(id, passwd, name) values(?,?,?)"; // 동적인 쿼리문이므로 ??? 가 들어감
	 		pstmt = conn.prepareStatement(sql);	// PreparedStatement 객체를 생성하도록 작성
	 		// 폼 페이지에서 전송된 아이디, 비밀번호, 이름을 물픔표에 설정하도록 setString() 메소드를 작성
	 		
	 		pstmt.setString(1, id);
	 		pstmt.setString(2, passwd);
	 		pstmt.setString(3, name);
	 		pstmt.executeUpdate();	// INSERT 문을 사용하도록 PreparedStatement 객체의 executeUpdate() 메서드 작성
	 		out.println("Member 테이블에 삽입을 성공했습니다.");
	 	} catch(SQLException ex){
	 		out.println("Member 테이블에 삽입을 실패했습니다.");
	 		out.println("SQLException : " + ex.getMessage());
	 	} finally {
	 		// 생성한 PreparedStatement 객체와 Connection 객체를 해제
	 		if(pstmt != null) {
	 			pstmt.close();
	 		}
	 		if(conn != null) {
	 			conn.close();
	 		}
	 	}
	 %>
</body>
</html>