<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의사항 내용조회</title>
<link rel="shortcut icon" href="/img/쿼카얼굴.png">
<link rel="stylesheet" href="/css/common.css" />

<script>

</script>

<style>

/* Reset default list styles */
ul, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

/* 게시판 스타일 */
#table {
  width: 50%;
  margin: 10px auto;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  font-size: 18px;
  background-color: #f7f7f7;
  border: 1px solid #ccc; /* 상단 테두리 추가 */
  border-left: 2px double #ccc; /* 왼쪽 이중선 테두리 추가 */
  border-right: 2px double #ccc; /* 오른쪽 이중선 테두리 추가 */
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s; /* 마우스 호버 시 배경색 애니메이션 */
  padding-left: 20px; /* 왼쪽 패딩 조정 */
}

#table td {
  padding: 15px;
  border: 1px solid #ccc; /* 연한 회색 선으로 셀 테두리 추가 */
  text-align: center;
}

#table td.bold {
  font-weight: bold; /* 볼드체로 내부 텍스트 스타일 변경 */
}

#table tr:nth-child(odd) {
  background-color: #e9e9e9;
}

#table tr:nth-child(even) {
  background-color: #f5f5f5;
}

#table td:first-child {
  border-left: 1px solid #ccc; /* 왼쪽 테두리 추가 */
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
}

#table td:last-child {
  border-right: 1px solid #ccc; /* 오른쪽 테두리 추가 */
  border-top-right-radius: 10px;
  border-bottom-right-radius: 10px;
}

/* 제목 셀 호버 시 확대 스타일 */
#table td[colspan="3"]:hover {
  transform: scale(1.05); /* 5% 확대 */
  transition: transform 0.3s;
}

/* 마우스 호버 시 배경색 변경 */
#table:hover {
  background-color: #f0f0f0;
}

/* 화면 중앙 정렬 스타일 */
#container {
  display: flex;
  justify-content: center;
}

#table-container {
  width: 80%;
  overflow: auto;
}

.menu-bar td {
  padding: 30px;
  border: none;
}

.menu-bar a {
  text-decoration: none;
  color: #333;
  font-size: 18px;
  font-weight: bold;
  transition: color 0.3s; /* 호버 시 텍스트 색상 변경 애니메이션 */
}

.menu-bar a:hover {
  color: #ff0000;
}

.center {
	font-size: 24px;
	text-weight: bold;
}

/* 삭제 버튼 스타일 */
.btn-delete {
  display: inline-block;
  padding: 10px 20px;
  background: #0A0A0A;
  color: #fff;
  border: none;
  border-radius: 10px;
  font-weight: bold;
  font-size: 18px;
  cursor: pointer;
  transition: transform 0.3s, box-shadow 0.3s; /* 호버 시 버튼 스타일 변경 애니메이션 */
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.btn-delete:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}
.btn-reply {
    display: inline-block;
  padding: 10px 20px;
  background: #0A0A0A;
  color: #fff;
  border: none;
  border-radius: 10px;
  font-weight: bold;
  font-size: 18px;
  cursor: pointer;
  transition: transform 0.3s, box-shadow 0.3s; /* 호버 시 버튼 스타일 변경 애니메이션 */
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}
.btn-reply:hover {
    transform: scale(1.05);
  box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<main>
		<div id="main">
			<br>
			<!-- 메뉴 목록 -->
			<%@include file="/WEB-INF/include/cmenu.jsp"%>
			
			<form action="/Csc/View" method="POST">
			  <input type="hidden" name="csc_id"       value="${ vo.csc_id      }" />
			  <input type="hidden" name="csc_idx"      value="${ vo.csc_idx     }" />
			  <input type="hidden" name="csc_bnum"     value="${ vo.csc_bnum    }" />
			  <input type="hidden" name="csc_lvl"      value="${ vo.csc_lvl     }" />
			  <input type="hidden" name="csc_step"     value="${ vo.csc_step    }" />
			  <input type="hidden" name="csc_nref"     value="${ vo.csc_nref    }" />
			  <input type="hidden" name="username"     value="${ vo.username    }" />
			<table id="table">
				<tr>
					<td class="center">글번호:</td>
					<td class="center">${ vo.csc_idx }</td>
				</tr>
				<tr>
					<td class="center">작성자:</td>
					<td class="center">${ vo.csc_writer }</td>
				</tr>
				<tr>
					<td class="center">작성일:</td>
					<td class="center">${ vo.csc_regdate }</td>
				</tr>
				<tr>
					<td class="center">제목:</td>
					<td colspan="3" style="text-align: left">${ vo.csc_title }</td>
				</tr>
				<tr>
					<td class="center">내용:</td>
					<td colspan="3" style="text-align: left">${ vo.csc_cont }</td>
				</tr>
				<tr>
					<td class="center"></td>
					<td colspan="3" style="text-align: center">
			  <tr>
			    <td>
			    <c:if test="${post.csc_lvl == 0}">
                ${post.csc_idx}
                </c:if></td>
			    <td>
			    <c:if test="${sessionScope.username == '쿼카' }">
			   		<a href="/Csc/WriteForm?csc_id=${ vo.csc_id }&csc_idx=${ vo.csc_idx }&csc_bnum=${ vo.csc_bnum }&csc_lvl=${ vo.csc_lvl }&csc_step=${ vo.csc_step }&csc_nref=${ vo.csc_nref }&username=${username}" class="btn-reply">
    				답글쓰기</a>
					<a href="/Csc/Delete?csc_id=${vo.csc_id}&csc_idx=${vo.csc_idx}&username=${username}" class="btn-delete">
    				삭제</a>
    			</c:if>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</main>
</body>
</html>


