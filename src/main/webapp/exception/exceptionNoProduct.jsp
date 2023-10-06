<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8"><base>
<title>상품 아이디 오류</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron" align="center">
		<div class="container">
		<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
		</div>
	</div>
	
	<div class="container">
		<p>?<%=request.getQueryString() %>
		<p><a href="../products.jsp" class="btn btn-secondary">상품 목록 >></a>
	</div>
	
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>