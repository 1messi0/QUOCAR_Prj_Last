<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>
<link rel="shortcut icon" href="/img/쿼카얼굴.png">
<link rel="stylesheet" href="/css/common.css" />

<style>

/* 메뉴 스타일 */

/* 게시판 스타일 */
table th {
	background-color: #2F4F4F !important;
	color: white !important;
}

#table {
	width: 100%;
	border-collapse: collapse;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 20px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

#table th, #table td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #ccc;
}

#table th:nth-of-type(1) {
	width: 5%;
}

#table th:nth-of-type(2) {
	width: 45%;
	text-align: left;
}

#table th:nth-of-type(3) {
	width: 15%;
}

#table th:nth-of-type(4) {
	width: 20%;
}

#table th {
	background-color: #333;
	color: white;
	font-size: 20px;
	padding: 15px;
}

#table caption h2 {
	font-size: 40px; /* 큰 글자 크기로 조정 */
	font-weight: bold; /* 볼드체로 설정 */
	margin-bottom: 10px; /* 아래 여백을 줄임 */
	text-transform: uppercase; /* 텍스트를 대문자로 변환 */
	color: #333; /* 어두운 텍스트 색상 */
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* 텍스트 그림자 효과 */
	border-bottom: 2px solid #333; /* 밑줄 스타일 추가 */
	padding-bottom: 10px; /* 밑줄 아래 여백 추가 */
}

#table tr:nth-child(even) {
	background-color: #f0f0f0;
}

#table tr:hover {
	background-color: #ddd;
}

#table td:nth-of-type(2) {
	text-align: left;
	text-size: 24px;
	text-decoration: none;
	font-weight: bold;
	color: #333;
}

.inquiry-button {
	background: linear-gradient(45deg, #333, #000);
	color: #fff;
	padding: 15px 30px;
	text-decoration: none;
	border: none;
	border-radius: 50px;
	display: inline-block;
	margin-right: 210px; /* 오른쪽 마진 추가 */
	transition: background 0.3s, color 0.3s, box-shadow 0.3s;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 1px;
	font-size: 18px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.inquiry-button:hover {
	background: linear-gradient(45deg, #000, #333);
	color: #fff;
	box-shadow: 0 8px 12px rgba(0, 0, 0, 0.3);
	transform: translateY(-2px);
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
	<main>
		<!-- 게시물 목록 -->
		<table id="table">
			<caption>
				<br> <br> <br>
				<h2>${csc_name}</h2>
				<!-- 고객센터 목록 -->
				<%@include file="/WEB-INF/include/cmenu.jsp"%>
			</caption>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
			</tr>
			<br>
			<tr>
				<td colspan="5" style="text-align: right"><a
					href="/Csc/WriteForm?csc_id=${param.csc_id}&csc_bnum=0"
					class="inquiry-button"> 문의하기 </a></td>
			</tr>
			<c:forEach var="post" items="${postList}">
				<tr>
					<td><c:if test="${post.csc_lvl == 0}">
                            ${post.csc_idx}
                        </c:if></td>
					<td><b
						style="display:inline-block;width:${(post.csc_lvl-1)*20}px"></b> <c:choose>
							<c:when test="${ post.csc_lvl eq 0  }">
								<a
									href="/Csc/View?csc_idx=${ post.csc_idx }&csc_id=${ post.csc_id  }">
									${ post.csc_title } </a>
							</c:when>
							<c:otherwise>
	       [답글]     
	       <a
									href="/Board/View?csc_idx=${ post.csc_idx }&csc_id=${ post.csc_id  }">
									${ post.csc_title } </a>
							</c:otherwise>
						</c:choose></td>
					<td>${ post.csc_writer }</td>
					<td>${ post.csc_regdate }</td>
				</tr>
			</c:forEach>

		</table>


	</main>
	<a href="/Chat/List3?model_id=MD01" class="fixed-button"> <img
		src="/img/	bot.png" alt="Q 봇" style="width: 70px; height: 70px;"></a>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
