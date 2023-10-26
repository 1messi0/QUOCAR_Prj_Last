<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/head.png">
<link rel="stylesheet" href="/css/common.css" />

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	height: 2000px;
}

.my-page {
	background-color: #fff;
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.header {
	text-align: center;
	margin-bottom: 20px;
}

h1 {
	font-size: 32px;
	font-weight: bold;
}

h2 {
	font-size: 18px;
	margin: 5px 0;
}

.main {
	display: flex;
	justify-content: space-between;
}

.info {
	flex: 1;
	padding: 10px;
}

h3 {
	font-size: 20px;
	margin-bottom: 10px;
}

ul {
	list-style: none;
	padding: 0;
}

li {
	margin-bottom: 10px;
}

li, input {
	font-size: 22px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
	text-size: 40px;
}

input[type="text"], input[type="email"], input[type="password"] {
	width: 100%;
	height: 45px;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	text-size: 24px
}

input[readonly] {
	background-color: #eee;
}

.function {
	flex: 1;
	padding: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.edit {
	padding: 12px 22px;
	background-color: #334F4F;
	color: #fff;
	font-size: 18px;
	font-weight: bold; border-radius : 5px; border : 2px solid #ccc;
	cursor: pointer;
	border: 2px solid #ccc;
	border-radius: 5px;
}

.edit:hover {
	background: linear-gradient(45deg, #000, #333);
	color: #fff;
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.3);
	transform: translateY(-2px);
}

.success-message {
	background-color: #4caf50;
	color: #fff;
	padding: 10px;
	margin-top: 10px;
	border-radius: 5px;
}

.error-message {
	background-color: #f44336;
	color: #fff;
	padding: 10px;
	margin-top: 10px;
	border-radius: 5px;
}

footer {
	position: fixed; /* 화면 아래에 고정 */
	left: 0;
	bottom: 0;
	width: 100%; /* 전체 너비로 확장 */
	background-color: #333; /* 배경색 지정 (원하는 색상으로 변경) */
	color: #fff; /* 글자색 지정 (원하는 색상으로 변경) */
	text-align: center; /* 텍스트 가운데 정렬 */
	padding: 10px 0; /* 상하 여백 설정 */
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<form action="/user/updateUserInfo" method="POST">
		<br> <br> <br>
		<div class="my-page">
			<div class="header">
				<div class="container">
					<h1>마이 페이지</h1>
					<br>
					<hr>
					<div class="main">
						<div class="info">
							<br>
							<ul>
								<li><label for="name">이름</label> <input type="text"
									id="name" name="name" value="${ name }" readonly Disabled>
								</li>
								<li><label for="userid">아이디</label> <input type="text"
									id="userid" name="userid" value="${ userid }" readonly>
								</li>
								<li><label for="username">닉네임</label> <input type="text"
									id="username" name="username" value="${username}"></li>
								<li><label for="password">현재 비밀번호</label> <input
									type="password" id="password" name="password"></li>
								<li><label for="new-password">새 비밀번호</label> <input
									type="password" id="new-password" name="new-password">
								</li>
								<li><label for="confirm-password">비밀번호 확인</label> <input
									type="password" id="confirm-password" name="confirm-password">
								</li>
								<li><label for="gender">성별</label> <input type="text"
									id="gender" name="gender" value="${gender}" readonly></li>
								<li><label for="email">이메일</label> <input type="email"
									id="email" name="email" value="${email}"></li>
								<li><label for="birthdate">생년월일</label> <input type="text"
									id="birthdate" name="birthdate" value="${birthdate}" readonly>
								</li>
								<li><label for="car-name">차량명</label> <input type="text"
									id="car-name" name="car-name" value="${carManufacturer}">
								</li>
								<li><label for="car-model">차 모델</label> <input type="text"
									id="car-model" name="car-model" value="${carModel}"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="function">
				<button type="submit" class="edit">수정</button>
			</div>
			<c:if test="${not empty successMessage}">
				<div class="success-message">${successMessage}</div>
			</c:if>
			<c:if test="${not empty errorMessage}">
				<div class="error-message">${errorMessage}</div>
			</c:if>
	</form>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var editButton = document.querySelector(".edit");
							editButton
									.addEventListener(
											"submit",
											function() {
												var newUsername = document
														.getElementById("username").value;
												var newEmail = document
														.getElementById("email").value;
												var newBirthdate = document
														.getElementById("birthdate").value;
												var newCarManufacturer = document
														.getElementById("car-name").value;
												var newCarModel = document
														.getElementById("car-model").value;
												var newPassword = document
														.getElementById("new-password").value;
												var confirmPassword = document
														.getElementById("confirm-password").value;

												if (newUsername.value == '') {
													alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
													return false;
												}
												// 새 비밀번호와 비밀번호 확인이 일치하는지 확인
												if (newPassword !== confirmPassword) {
													alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
													return false;
												}

											});
						});
	</script>
	<a href="/Chat/List3?model_id=MD01" class="fixed-button"> <img
		src="/img/bot.png" alt="Q 봇" style="width: 70px; height: 70px;"></a>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />

</body>
</html>