<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Shopping Mall</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp"/>
<h1 class="card-title">오승훈</h1>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
			</div>
		</div>
	</nav>
	<%!String greeting ="반도체샵";
	String tagline = "Welcome to BanDoChea Market!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>	
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
				<a href="../product/products.jsp">상품 보러 가기</a>
			</h3>
		</div>
		<hr>
	</div>	
	<footer class="container">
		<p>&copy; WebMarket</p>
	</footer>

</body>
</html>