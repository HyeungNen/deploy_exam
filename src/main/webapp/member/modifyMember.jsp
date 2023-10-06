<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8"><base>
<title>회원수정</title>
<%@ include file="../inc/dbconn.jsp"%>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원수정</h1>
		</div>
	</div>
	
	
	<%
		String sessionMemberId = (String) session.getAttribute("sessionMemberId");
	
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String sql = "SELECT * FROM member where memberId = ?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, sessionMemberId);
		resultSet = preparedStatement.executeQuery();
		
		if (resultSet.next()){
			String passwd = resultSet.getString("passwd");
			String memberName = resultSet.getString("memberName");
			String gender = resultSet.getString("gender");
			String birthday = resultSet.getString("birthday");
			String[] birthdayArr = birthday.split("-");
			String birthyy = birthdayArr[0];
			String birthmm = birthdayArr[1];
			String birthdd = birthdayArr[2];
			String email = resultSet.getString("email");
			String[] emailArr = email.split("@");
			String phone = resultSet.getString("phone");
			String zipCode = resultSet.getString("zipCode");
			String address01 = resultSet.getString("address01");
			String address02 = resultSet.getString("address02");
			
	%>
	
	
	<div class="container">
	<form name="frmMember" action="./processModifyMember.jsp" method="post">
		<div class="form-group row" >
			<label class="col-sm-2">회원 아이디</label>
			<div class="col-md-10">
				<%=sessionMemberId%>
			</div>
		</div>
		<div class="form-group row" >
			<label class="col-sm-2">비밀번호</label>
			<div class="col-md-3">
		 	<input type="text" name="passwd" class="form-control" value="<%=resultSet.getString("passwd")%>">
			</div>
		</div>
		<div class="form-group row" >
			<label class="col-sm-2">비밀번호 확인</label>
			<div class="col-md-3">
		 	<input type="text" name="passwd" class="form-control" value="<%=resultSet.getString("passwd")%>">
			</div>
		</div>
		<div class="form-group row" >
			<label class="col-sm-2">이름</label>
			<div class="col-md-3">
		 	<input type="text" name="memberName" class="form-control" value="<%=resultSet.getString("memberName")%>">
			</div>
		</div>
		<div class="form-group  row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-10">
				<input name="gender" type="radio" value="남"
				<%if(resultSet.getString("gender").equals("남")){out.print("checked");} %>> 남
				<input name="gender" type="radio" value="여"
				<%if(resultSet.getString("gender").equals("여")){out.print("checked");} %>> 여
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">생일</label>
			<div class="col-sm-4  ">
			<%-- <%=birthday %> --%>
				<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" value="<%= birthyy %>">
				<select name="birthmm">
					<option value="">월</option>
						<%
							for (int i = 1; i <= 12; i ++) {
								String month = String.format("%02d", i);	 // 숫자를 두 자리 문자열로 반환
								out.print("<option value=\"" + month + "\"");
								if(birthmm.equals(month)) {
									out.print(" selected");
								}
								out.print(">" + i + "</option>");
							}
						%>
				</select>
				<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="<%= birthdd %>">
			</div>
			<div id="birthdayError" style="color: red;"></div>
		</div>
		<div class="form-group row ">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-10">
				<input type="text" name="mail1" maxlength="50">@
				<select name="mail2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
					
					<%-- <option <%if(emailArr[1].equals("naver.com")){out.print(" selected"); }%>>naver.com</option>
					<option <%if(emailArr[2].equals("daum.net")){out.print(" selected"); }%>>daum.net</option>
					<option <%if(emailArr[3].equals("gmail.com")){out.print(" selected"); }%>>gmail.com</option>
					<option <%if(emailArr[4].equals("nate.com")){out.print(" selected"); }%>>nate.com</option> --%>
				</select>
			</div>
		</div>
		<div class="form-group row" >
			<label class="col-sm-2">연락처</label>
			<div class="col-md-3">
		 	<input type="text" name="phone" class="form-control" value="<%=resultSet.getString("phone")%>">
			</div>
		</div>
		<div class="form-group row" >
			<label class="col-sm-2">우편번호</label>
			<div class="col-md-3">
		 	<input type="text" name="zipCode" class="form-control" value="<%=resultSet.getString("zipCode")%>">
			</div>
		</div>
		<div class="form-group row" >
			<label class="col-sm-2">주소 1</label>
			<div class="col-md-3">
		 	<input type="text" name="address01" class="form-control" value="<%=resultSet.getString("address01")%>">
			</div>
		</div>
		<div class="form-group row" >
			<label class="col-sm-2">주소 2</label>
			<div class="col-md-3">
		 	<input type="text" name="address02" class="form-control" value="<%=resultSet.getString("address02")%>">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-10">
				<input type="submit" class="btn btn-primary" value="수정">
				<a href="processRemoveMember.jsp" class="btn btn-primary">회원탈퇴</a>
			</div>
		</div>	
		</form>
		</div>
<%
}
%>
	<jsp:include page="../inc/footer.jsp"/>
		
<script>
document.addEventListener("DOMContentLoaded", function() {
	const frmMember = document.frmMember; // 폼을 들고옴
	
	// 1. 팝업을 이용한 id 중복확인
	// 팝업을 띄우는 이유는 현재 페이지에서 데이터베이스에 중복 조회를 할려면 페이지 새로고침 이외엔 방법이 없음
	const btnIsDuplication = document.querySelector('input[name=btnIsDuplication]');
	btnIsDuplication.addEventListener('click', function() {
		const memberId = frmMember.memberId.value;	// 아이디 input에 있는 값
		if(memberId === ""){
			alert("아이디를 입력해 주세요");
			frmMember.memberId.focus();
			return;
		}
		// 아이디 중복 확인을 위해 팝업을 띄움
		window.open('popupIdCheck.jsp?id=' + memberId, 'idCheck', 'width = 500, height = 500, top = 100, left = 200, location = no');
	});
	
	
	// 2. ajax를 이용한 id 중복확인
	const xhr = new XMLHttpRequest();// XMLHttpRequest 객체 생성
	const btnIsDuplication2nd = document.querySelector("input[name=btnIsDuplication2nd]");
	btnIsDuplication2nd.addEventListener('click', function() {
		const memberId = frmMember.memberId.value;	// 아이디 input에 있는 값.
		xhr.open('GET', 'ajaxIdCheck.jsp?id=' + memberId);	// HTTP 요청 초기화. 통신 방식과 url 설정.
		xhr.send();	// url에 요청을 보냄
		// 이벤트 등록. XMLHttpRequest 객체의 readyState 프로퍼티 값이 변할 때마다 자동으로 호출
		xhr.onreadystatechange = () => {
			// readyState 프로퍼티의 값이 DONE : 요청한 데이터의 처리가 완료 되어 응답할 준비가 완료됨
			if(xhr.readyState !== XMLHttpRequest.DONE) return;
			
				if(xhr.status === 200) { // 서버(url)에 문서가 존재함
				console.log(xhr.responese);
				const json = JSON.parse(xhr.response);
					if(json.result === 'true'){
						alert('동일한 아이디가 있습니다.')
					}
					else{
						alert('동일한 아이디가 없습니다.')
					}
				}
				else {
					consloe.error('Error', xhr.status, xhr.statusText);
				}
			}
		});
	
	// 3. ajax를 이용한 실시간 Id 중복확인
	// 2번에서 작업된 파일을 이용
	const inputId = document.querySelector('input[name=memberId]');
	inputId.addEventListener('keyup', function() {
		const id = frmMember.memberId.value;	// 아이디 input에 있는 값.
		const memberIdCheck = document.querySelector('.memberIdCheck');
		xhr.open('GET', 'ajaxIdCheck.jsp?id=' + id);	// HTTP 요청 초기화. 통신 방식과 url 설정.
		xhr.send();	// url에 요청을 보냄
		// 이벤트 등록. XMLHttpRequest 객체의 readyState 프로퍼티 값이 변할 때마다 자동으로 호출
		xhr.onreadystatechange = () => {
			// readyState 프로퍼티의 값이 DONE : 요청한 데이터의 처리가 완료 되어 응답할 준비가 완료됨
			
			if(xhr.readyState !== XMLHttpRequest.DONE) return;
			if(xhr.status === 200) { // 서버(url)에 문서가 존재함
				// console.log(xhr.responese);
				const json = JSON.parse(xhr.response);
					if(json.result === 'true'){
						memberIdCheck.style.color = 'red';
						memberIdCheck.innerHTML = '동일한 아이디가 있습니다.';
					}
					else{
						memberIdCheck.style.color = 'green';
						memberIdCheck.innerHTML = '동일한 아이디가 없습니다.';
					}
				}
				else {
					consloe.error('Error', xhr.status, xhr.statusText);
				}
			}
		});
	});
</script>

<script>
// 생일을 빈칸으로 만들면 오류
	document.addEventListener("DOMContentLoaded", function() {
    const birthdayYear = document.querySelector('input[name=birthyy]');
    const birthdayMonth = document.querySelector('select[name=birthmm]');
    const birthdayDay = document.querySelector('input[name=birthdd]');
    const birthdayError = document.getElementById('birthdayError');

    // 폼 제출 시 검증 함수를 호출
    document.querySelector('form[name=frmMember]').addEventListener('submit', function(e) {
        if (birthdayYear.value === '' || birthdayMonth.value === '' || birthdayDay.value === '') {
            e.preventDefault(); // 폼 제출을 막음
            birthdayError.textContent = '생년월일을 입력하세요.';
        } else {
            birthdayError.textContent = ''; // 오류 메시지를 지움
        }
    });
});
</script>
	</body>
</html>