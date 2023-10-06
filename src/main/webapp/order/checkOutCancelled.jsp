<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문 취소</title>
</head>
<body>

<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문취소</h1>
		</div>
	</div>	
	
	<div class="container">
		<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
	</div>
	
	<div class="container">
		<p><a href="../product/products.jsp" class="btn btn-secondary">상품 목록 >> </a> </p>
	</div>
	
	<%
	
	session.removeAttribute("carts");
/* 	// 1) 쿠키정보 삭제
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			String cookieName = cookie.getName();
			switch(cookieName) {
				case "orderId" : case "orderName" : case "tel" : case "zipCode" : case "address1" : case "address2" : 
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				break;
			}
		} */
	%>
	
<jsp:include page="../inc/footer.jsp"></jsp:include>	
</body>
</html>