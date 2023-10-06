<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String sessionMemberId = (String) session.getAttribute("sessionMemberId");
		PreparedStatement preparedStatement = null;
		
		String sql = "DELETE FROM member WHERE memberId =?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, sessionMemberId);
		preparedStatement.executeUpdate();
		
		session.invalidate();
		
		response.sendRedirect("resultMember.jsp");
		
	%>
	
	<!-- 
		실제 탈퇴의 경우 바로 데이터를 삭제하지 않는다.
		바로 회원 데이터를 삭제한다면 당근의 경우 거래중인데 선금을 받고 탈퇴한다던지,
		커뮤니티의 경우 악성글을 적고 탈퇴를 하게 된다면 추적이 어렵다
		
		일반적으로는 탈퇴사유를 받고 탈퇴신청 후 근무일 기준으로 2~3일 지나서 탈퇴처리를 한다.
	 -->
</body>
</html>