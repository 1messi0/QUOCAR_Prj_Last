<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuoBot</title>
<link rel="icon" type="image/x-icon" href="/img/head.png">
<link rel="stylesheet" href="/css/common.css" />

<style>
main {
	background-color: #EFF2F6;
	height: 1000px;
}

/* .chat-container 스타일 업데이트 */
.chat-container {
	max-width: 1000px;
	height: auto; /* 높이 자동 조정 */
	margin: auto;
	padding: 30px;
	border-radius: 15px; /* 라운드 모양 스타일링 더 강화 */
	background-color: #F5F5F5; /* 미세한 밝은 회색 배경 */
	border: 1px solid #E0E0E0; /* 부드러운 회색 테두리 */
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}

/* .quobot 스타일 업데이트 */
.quobot {
	display: flex;
	align-items: center;
}

/* h1 스타일 업데이트 */
h1 {
	color: #333333;
	font-size: 36px; /* 큰 제목 텍스트 크기 조정 */
	font-weight: bold;
	text-align: center; /* 가운데 정렬 */
}

/* h2 스타일 업데이트 */
h2 {
	color: #333333;
	font-size: 22px; /* 부제목 텍스트 크기 조정 */
	text-align: left;
	margin-left: 15px;
}

/* .chat-list-container 스타일 업데이트 */
.chat-list-container {
	margin-top: 30px;
}

/* button 스타일 업데이트 */
button {
	display: block;
	width: 200px;
	height: 10px; /* 버튼 높이 높임 */
	margin-bottom: 10px;
	cursor: pointer;
	font-size: 24px; /* 버튼 텍스트 크기 조정 */
	background-color: #333333; /* 버튼 배경색 변경 */
	color: #FFFFFF; /* 버튼 텍스트 색상 변경 */
	border: none;
	border-radius: 10px; /* 버튼 라운드 모양 스타일링 더 강화 */
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
}

/* .chatbot-button 스타일 업데이트 */
.chatbot-button {
	display: inline-block;
	margin: 5px;
	padding: 5px;
	border-radius: 10px; /* 버튼 라운드 모양 스타일링 더 강화 */
	background-color: #ffffff; /* 미세한 회색 배경 */
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1); /* 미세한 그림자 추가 */
	color: #000000;
	font-size: 24px; /* 버튼 텍스트 크기 조정 */
	font-style: normal; /* 이탤릭체 제거 */
	font-weight: bold; /* 오탈자 수정 */
	text-decoration: none;
	width: 200px;
	height: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: background-color 0.2s;
}

.chatbot-button:hover {
	background-color: #DDDDDD; /* 호버 시 배경색 변경 */
	color: #000000; /* 호버 시 텍스트색 변경 */
}

/* .car-selection-form 스타일 업데이트 */
.car-selection-form {
	justify-content: left;
	align-items: left;
	margin-top: 10px;
	padding: 10px;
	background-color: #f5f5f5;
	border-radius: 10px; /* 둥글고 더 고급스러운 모양 */
}

/* .car-select 스타일 업데이트 */
.car-select {
	padding: 10px;
	font-size: 18px; /* 조금 더 작은 폰트 크기 */
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	border-radius: 8px; /* 더 둥글고 고급스러운 모양 */
	outline: none;
	width: 20%; /* 더 긴 너비 */
	transition: border-color 0.3s, box-shadow 0.3s;
}

.car-select:hover {
	border-color: #666;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 약간 더 진한 그림자 */
}

/* .cmodel-button 스타일 업데이트 */
.cmodel-button {
	padding: 12px 22px;
	margin: 10px;
	font-size: 16px; /* 더 큰 폰트 크기 */
	font-weight: bold; background-color : #444;
	color: #fff;
	border: none;
	border-radius: 4px; /* 더 둥글고 고급스러운 모양 */
	outline: none;
	cursor: pointer;
	transition: background-color 0.3s;
	background-color: #444;
}

.cmodel-button:hover {
	background-color: #555;
}

/* .button-text 스타일 업데이트 */
.button-text {
	margin-top: 5px;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* .mechanic 스타일 업데이트 */
.mechanic {
	background-color: #F5F5F5; /* 미세한 밝은 회색 배경 */
	border-radius: 8px; /* 말풍선 라운드 모양 스타일링 더 강화 */
	max-width: fit-content;
	height: auto;
	padding: 10px;
	border: 1px solid #E0E0E0; /* 부드러운 회색 테두리 */
	margin-left: 100px;
	display: inline-block;
	position: relative;
	transition: transform 0.2s;
}

.mechanic::before {
	content: '';
	position: absolute;
	top: 50%;
	left: -25px; /* 화살표 위치 조정 */
	border-width: 12px;
	border-style: solid;
	border-color: transparent transparent transparent #F5F5F5; /* 말풍선 색상 */
}

.mechanic::after {
	content: '';
	position: absolute;
	top: 50%;
	right: -25px; /* 화살표 위치 조정 */
	border-width: 12px;
	border-style: solid;
	border-color: transparent #F5F5F5 transparent transparent; /* 말풍선 색상 */
}
</style>

<script>

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<br>
	<br>
	<main>
		<br>
		<div class="chat-container">
			<h1>QuoBot</h1>
			<br>
			<hr>
			<br>

			<%@include file="/WEB-INF/include/cmodel.jsp"%>

			<h2>✔ ${model_name}</h2>
			<br> <br> <br>

			<div class="quobot">
				<img src="/img/bot.png" width="70" height="70">
			</div>
			<div class="mechanic">
				<!-- model_id 가져오기 -->
				<c:set var='model_id' value='${param.model_id}' />
				<!-- viewUrl 링크로 이동 -->
				<c:url value='/Chat/View' var='viewUrl'>
					<c:param name='mechanic_id' value='MC01' />
					<c:param name='model_id' value='${model_id}' />
				</c:url>
				<a class='chatbot-button' href='${viewUrl}'> <span
					class='button-text'>엔진오일</span></a> <br>

				<c:url value='/Chat/View' var='viewUrl'>
					<c:param name='mechanic_id' value='MC02' />
					<c:param name='model_id' value='${model_id}' />
				</c:url>
				<a class='chatbot-button' href='${viewUrl}'> <span
					class='button-text'>타이어</span></a> <br>

				<c:url value='/Chat/View' var='viewUrl'>
					<c:param name='mechanic_id' value='MC03' />
					<c:param name='model_id' value='${model_id}' />
				</c:url>
				<a class='chatbot-button' href='${viewUrl}'> <span
					class='button-text'>브레이크</span></a>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>














