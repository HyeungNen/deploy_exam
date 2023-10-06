<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>영수증</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문정보</h1>
		</div>
	</div>	
	<%
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding);
		
		String orderId =(String) session.getAttribute("orderId");
		String orderName =(String) session.getAttribute("orderName");
		String tel =(String) session.getAttribute("tel");
		String zipCode =(String) session.getAttribute("zipCode");
		String address1 =(String) session.getAttribute("address1");
		String address2 =(String) session.getAttribute("address2");
		
		/* Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				switch(cookieName){
				case "orderId" :
					orderId = URLDecoder.decode(cookie.getValue(), encoding);
					break;
				case "orderName" :
					orderName = URLDecoder.decode(cookie.getValue(), encoding);
					break;
				case "tel" :
					tel = URLDecoder.decode(cookie.getValue(), encoding);
					break;
				case "zipCode" :
					zipCode = URLDecoder.decode(cookie.getValue(), encoding);
					break;
				case "address1" :
					address1 = URLDecoder.decode(cookie.getValue(), encoding);
					break;
				case "address2" :
					address2 = URLDecoder.decode(cookie.getValue(), encoding);
					break;
				}
			}
		} */
	%>
	
	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br>
				성명 : <%=orderName%><br>
				연락처 : <%=tel%><br>
				우편번호 : <%=zipCode%><br>
				주소 : <%=address1%><br>
				<%=address2%>
			</div>		
		</div>
	</div>
	
	
	<div>
		<table class="table table-hover">
			<tr>
				<th class="text-center">사진</th>
				<th class="text-center">상품</th>
				<th class="text-center">가격</th>
				<th class="text-center">수량</th>
				<th class="text-center">소계</th>
			</tr>
			
			<%
			int sum = 0;
			ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts"); // getAttribute이니까 다운캐스팅해줌
			if(carts == null) {	// 세션에 저장된 녀석들을 가져옴
				carts = new ArrayList<Cart>();
			}
			for(Cart cart : carts){
				Product product = ProductRepository.getInstance().getProductById(cart.getProductId());
				Integer total = product.getUnitPrice() * cart.getCarCnt();
				sum = sum + total;
			%>			
			<tr>
				<td class="text-center"><img src="/upload/<%=product.getFileName()%>" style="width:100px"></td>
				<td class="text-center"><em><%=product.getProductName()%></em></td>
				<td class="text-center"><em><%=product.getUnitPrice()%></em></td>
				<td class="text-center"><em><%=cart.getCarCnt()%></em></td>
				<td class="text-center"><em><%=total%></em></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td></td>
				<td></td>
				<td class="text-right"><strong>총액 : </strong></td>
				<td class="text-center text-danger"><strong><%=sum%></strong></td>
			</tr>
		</table>	
		
		<a href="./shippingInfo.jsp" class="btn btn-secondary" role="button"> 이전</a>
		<a href="./thankCustomer.jsp" class="btn btn-success" role="button"> 주문 완료</a>
		<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소</a>
	</div>
		
		
	<div class="container">
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div>

</body>
</html>