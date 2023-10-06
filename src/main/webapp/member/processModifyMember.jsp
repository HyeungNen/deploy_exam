<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
	<%
		// 전달해야하는 회원정보 
		
		request.setCharacterEncoding("UTF-8");
	
		String sessionMemberId = (String) session.getAttribute("sessionMemberId");
		String passwd = request.getParameter("passwd");
		String memberName = request.getParameter("memberName");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String zipCode = request.getParameter("zipCode");
		String address01 = request.getParameter("address01");
		String address02 = request.getParameter("address02");
		
	%>
	
	<%
	// MariaDB에 UPDATE를 하기위한 코드
	PreparedStatement preparedStatement = null;
	
	String sql = "UPDATE member SET passwd = ?, memberName = ? , gender = ? , birthday = ? , email = ? , phone = ? ," + 
	"zipCode = ? , address01 = ? , address02 = ? WHERE memberId = ?";
	
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, passwd);
	preparedStatement.setString(2, memberName);
	preparedStatement.setString(3, gender);
	preparedStatement.setString(4, birthday);
	preparedStatement.setString(5, email);
	preparedStatement.setString(6, phone);
	preparedStatement.setString(7, zipCode);
	preparedStatement.setString(8, address01);
	preparedStatement.setString(9, address02);
	preparedStatement.setString(10, sessionMemberId);
	
	if(preparedStatement.executeUpdate() == 1){	// UPDATE가 성공적으로 된다면!
		response.sendRedirect("resultMember.jsp?msg=0");
	}
	else {
		response.sendRedirect("modifyMember.jsp?msg=1");
	}
	
	%>
</body>
</html>