<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
	%>
		<%@ include file="../inc/dbconn.jsp"%>
	<%
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String sql = "SELECT * FROM member WHERE memberId=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, id);
		resultSet = preparedStatement.executeQuery();
		if(resultSet.next()){
			out.print("동일한 아이디가 있습니다");
		}
		else {
			out.print("동일한 아이디가 없습니다");
		}
		
		if(resultSet != null){
			resultSet.close();
		}
		if(connection != null){
			connection.close();
		}
		if(preparedStatement != null){
			preparedStatement.close();
		}
	%>
</body>
</html>