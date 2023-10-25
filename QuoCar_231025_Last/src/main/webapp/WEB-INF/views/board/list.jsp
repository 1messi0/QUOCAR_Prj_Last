<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuoCar</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/쿼카얼굴.png">
<link rel="stylesheet" href="/css/common.css" />
<style>

/* 스타일을 적용할 부분 */
body {
	height: 1400px;
}

.container {
	max-width: 1300px;
	margin: 0 auto;
	font-family: Arial, sans-serif;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
}

th, td {
	border: 2px solid #ddd;
	padding: 20px;
	text-align: center;
}

th {
    background-color: #2f4f4f;
    color: #fff;
    padding: 12px;
    font-weight: bold;
	font-size: 20px; /* 큰 글자 크기로 조정 */    
    text-align: center;
}

td {
    font-size: 20px; /* 큰 글자 크기로 조정 */
    font-weight: bold; /* 볼드체로 설정 */	
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:nth-child(odd) {
    background-color: #e9e9e9;
}

tr:hover {
    background-color: #d9d9d9;
}

/* 페이지 이동 컨트롤 스타일 */
.pagination {
    display: flex;
    justify-content: center;
    list-style: none;
    margin-top: 20px;
}

.pagination li {
    margin: 0 5px;
}

.pagination a {
    text-decoration: none;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: 2px solid #007bff;
    border-radius: 30px;
    transition: all 0.3s;
    text-transform: uppercase;
    font-weight: bold;
}

.pagination a:hover {
    background-color: #0056b3;
    border-color: #0056b3;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* 검색 폼 스타일 (더 고급스러운 스타일) */
form[name="form1"] {
    display: flex;
    align-items: center;
    background-color: #f5f5f7;
    border: 1px solid #d1d1d4;
    border-radius: 10px;
    padding: 4px 12px;
}

select[name="searchOption"] {
    border: none;
    padding: 10px;
    flex: 1;
    outline: none;
    background: transparent;
    font-size: 20px;
    font-weight: bold;
}

input[name="keyword"] {
    border: none;
    padding: 10px;
    flex: 5; /* 왼편 공간을 더 늘림 */
    outline: none;
    background: transparent;
    font-size: 20px;
    font-weight: bold;
}

select[name="searchOption"] {
    border-right: 2px solid #d1d1d4;
}

/* 고급 버튼 스타일 */
button#btnWrite, input[type="submit"] {
    color: #0070c1;
    padding: 10px 16px; /* 크기 조절 */
    cursor: pointer;
    border: 2px solid #0070c1;
    border-radius: 8px; /* 더 작은 둥근 테두리 */
    transition: all 0.3s;
    font-size: 18px; /* 더 작은 폰트 크기 */
    font-weight: bold;
    text-transform: uppercase;
    background: none;
}

button#btnWrite:hover, input[type="submit"]:hover {
    background-color: #0070c1;
    color: #fff;
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

<!-- jQuery 라이브러리를 불러옵니다. -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "${path}/board/write.do";
		});
	});
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="${path}/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
  <div class="container">
    <!-- 레코드의 갯수를 출력 -->
    ${map.count}개의 게시글
    <table>
        <tr>
            <th style="font-weight: bold;">번호</th>
            <th>제목</th>
            <th>이름</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
			<c:forEach var="row" items="${map.list}">
				<tr>
					<td>${row.bno}</td>
					<td>
		               <a href="${path}/board/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title} 
		                   <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
		                   <c:if test="${row.recnt > 0}">
		                   <span style="color: red;">(${row.recnt})
		                   </span>
		                   </c:if>
		               </a>
		           </td>
					<td>${row.username}</td>
					<td>
						<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> 
						<fmt:formatDate	value="${row.regdate}" pattern="MM-dd HH:mm" />
					</td>
					<td>${row.viewcnt}</td>
				</tr>
			</c:forEach>
			<tr>
            <td colspan="5">
                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('1')">[처음]</a>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>
	</table>
	<br>
	   <form    name="form1" method="post" action="${path}/board/list.do">
        <select name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all"       <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
            <option value="user_name" <c:out value="${map.searchOption == 'user_name'?'selected':''}"/> >이름</option>
            <option value="content"   <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option value="title"     <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select>
        <input  name="keyword" value="${map.keyword}">
        <input  type="submit"  value="조회">
        <!-- 로그인한 사용자만 글쓰기 버튼을 활성화 -->
        &nbsp; &nbsp;
		<c:if test="${sessionScope.userid != null}">
        	<button type="button" id="btnWrite">글쓰기</button>
    	</c:if>
    </form>
     <a href="/Chat/List3?model_id=MD01" class="fixed-button"> <img
	src="/img/	bot.png" alt="Q 봇" style="width: 70px; height: 70px;"></a>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </div>
</body>
</html>

