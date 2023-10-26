<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuoCar 커뮤니티</title>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="icon" type="image/x-icon" href="/img/head.png">
<link rel="stylesheet" href="/css/common.css" />

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

h2 {
	background-color: #334F4F;
	color: #fff;
	padding: 20px;
	text-align: center;
}

form {
	margin: 20px auto; /* 가운데 정렬 */
	padding: 50px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 1000px; /* 최대 폭 설정 */
}

label {
	font-weight: bold;
}

input[type="text"], textarea {
	width: 100%;
	padding: 20px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="hidden"] {
	display: none;
}

input[name="title"] {
	width: 50%; /* 너비 100%로 설정하여 가로 전체 차지 */
	padding: 15px;
	margin: 10px 0; /* 상단과 하단 간격 추가 */
	border: 2px solid #333; /* 테두리 스타일 및 색상 지정 */
	border-radius: 6px; /* 둥근 테두리 적용 */
	font-size: 22px; /* 글꼴 크기 설정 */
	font-weight: bold; /* 볼드체로 설정 */
}

input[name="title"]::placeholder {
	font-style: italic; /* 입력 힌트(placeholder)에 이탤릭 스타일 적용 */
}

.button-container {
	text-align: center;
}

.button-container button {
	background-color: #0A0A0A; /* 배경 색상 */
	color: #fff; /* 텍스트 색상 */
	border: none;
	padding: 12px 24px; /* 내용과 버튼 크기 */
	border-radius: 4px; /* 둥근 모서리 */
	cursor: pointer;
	margin: 30px 5px; /* 버튼 간격을 조정 */
	font-size: 22px; /* 글꼴 크기 */
	transition: background-color 0.3s, color 0.3s; /* 호버 효과 애니메이션 */
}

.button-container button:hover {
	background-color: #45a049; /* 호버 시 배경 색상 변경 */
	color: #fff; /* 호버 시 텍스트 색상 변경 */
}

/* 글씨 크기 키우기 및 볼드체 */
div {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px; /* 간격 추가 */
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/board/delete.do";
				document.form1.submit();
			}
		});

		$("#btnUpdete").click(function() {
			var title = $("#title").val();
			var content = $("#content").val();
			if (title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			document.form1.action = "${path}/board/update.do"
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
	});
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<h2>게시글 보기</h2>
	<form name="form1" method="post">
		<div>
			<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
			작성일자 :
			<fmt:formatDate value="${dto.regdate}" pattern="MM-dd HH:mm" />
		</div>
		<div>조회수 : ${dto.viewcnt}</div>
		<div>
			제목 <input name="title" id="title" size="80" value="${dto.title}"
				placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80"
				placeholder="내용을 입력해주세요">${dto.content}</textarea>
		</div>
		<div>이름 ${dto.writer}</div>
		<div style="width: 650px; text-align: center;">
			<!-- 게시물번호를 hidden으로 처리 -->
			<input type="hidden" name="bno" value="${dto.bno}">
			<c:if  test="${sessionScope.userid == dto.writer}">
				<button type="button" id="btnUpdete">수정</button>
				<button type="button" id="btnDelete">삭제</button>
			</c:if>
		</div>
	</form>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>

