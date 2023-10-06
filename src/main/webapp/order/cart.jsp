<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.*" %>
<%@ include file="../inc/dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../inc/menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>장바구니 목록</title>
</head>
<body>
<div class="container">
	<div class="navbar-header">
		<!-- <a class="navbar-brand" href="../welcome/welcome.jsp">Home</a> -->
	</div>
</div>
<div class="container">
	<div class="row">
		<table width="100%">
			<tr>
				<td align="left">
					<a href="#" class="btn btn-danger btn-removeAll">비우기</a>				
					<a href="#" class="btn btn-danger btn-removecheck">선택삭제</a>
					<!-- <a href="./processRemoveCart.jsp" class="btn btn-danger">비우기</a>  -->
					<a href="shippingInfo.jsp" class="btn btn-success">주문</a>
				</td>
			</tr>
		</table>
	</div>
	<div style="padding-top : 50px">
		<form name="frmCart" method="post">
		<input type="hidden" name="productId">
		<table class="table table-hover">
			<tr>
				<td>선택</td>
				<td>이미지</td>
				<td>상품</td>
				<td>가격</td>
				<td>수량</td>
				<td>소계</td>
				<td>비고</td>
			</tr>
			
			<%
			// 주문번호 관련처리	
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			int sum = 0;
			
			String sql = "SELECT * FROM cart C INNER JOIN product P on C.productId = P.productId WHERE (orderId = ?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, orderId);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Integer price = resultSet.getInt("unitPrice") * resultSet.getInt("cnt");
				sum += price;
			%>
			<tr>
				<td><input type="checkbox" name="checkedId" value="<%=resultSet.getString("ProductId")%>"></td>
				<td><img src="/upload/<%=resultSet.getString("FileName")%>" style="width:100px"></td>
				<td><a href="../product/product.jsp?productId=<%=resultSet.getString("ProductId")%>"><%=resultSet.getString("ProductName")%></a></td>
				<td><%=resultSet.getString("UnitPrice")%>원</td>
				<td><input type="text" name="cnt_<%=resultSet.getString("productId")%>" value="<%=resultSet.getInt("cnt")%>">
             		<a href="#" class="btn-plus" role="<%=resultSet.getString("productId")%>" about="plus">+</a>
              		<a href="#" class="btn-minus" role="<%=resultSet.getString("productId")%>" about="minus">-</a>
            	</td>
				<td><%=price%>원</td>
				<td><a href="#" role="<%=resultSet.getString("ProductId")%>" class="badge badge-danger btn-removeById">삭제</a></td>
				<!-- <td><a href="./processRemoveCartById.jsp?productId=<%=resultSet.getString("ProductId")%>" class="badge badge-danger">삭제</a></td> -->
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="7"> 합계 : <%=sum%>원 </td>
			</tr>
		</table>
		</form>
		<a href="../product/products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
	</div>	
</div>
<script>
	// 비우기(전체삭제)
	document.addEventListener('DOMContentLoaded', function() {
		const btnRemoveAll = document.querySelector(".btn-removeAll");
		btnRemoveAll.addEventListener('click', function () {
			if(confirm('정말 장바구니를 비우시겠습니까?')){
				location.href ='../order/processRemoveCart.jsp';
			}
		});
		
		// 선택 삭제 
		const btnRemoveSelected = document.querySelector(".btn-removecheck");
		const frmCart = document.querySelector('form[name=frmCart]');
		btnRemoveSelected.addEventListener('click', function () {
			if(confirm('정말 선택항목을 삭제하시겠습니까?')){
				frmCart.action="../order/processRemoveCartSelected.jsp";
				frmCart.submit();
			}
		});
		
		// 개별 삭제
		const btnRemoveByIds = document.querySelectorAll(".btn-removeById");
		btnRemoveByIds.forEach(button => {
			button.addEventListener('click', function(e) {
				if(confirm('정말 삭제하시겠습니까?')){
					frmCart.productId.value = e.target.role;
					frmCart.action = '../order/processRemoveCartById.jsp';
					frmCart.submit();
				}
			});
		});
	});
</script>
</body>
</html>