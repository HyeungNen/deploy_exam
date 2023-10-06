<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update02</title>
</head>
<body>
	<h4>아이디, 비밀번호 인증을 이용한 이름 수정</h4>
	<form method="post" action="update02_process.jsp">
		<p> 기존 아이디 : <input type="text" name="id"></p>	
		<p> 기존 비밀번호 : <input type="password" name="passwd"></p>	
		<p> 수정할 이름 : <input type="text" name="name"></p>
		<p> <input type="submit" value="전송"></p>	
	</form>
</body>
</html>