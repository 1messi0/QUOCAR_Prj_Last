<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/쿼카얼굴.png">
<link rel="stylesheet" href="/css/common.css" />
<title>QuoCAR</title>
</head>
<body>
	<table>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.username}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />) 
						<br> 
						${row.replytext}
						<br> 
						<!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
						<c:if test="${sessionScope.userid == row.replyer}">
						<input type="button" id="btnModify" value="수정"
							onclick="showReplyModify('${row.rno}')">
						</c:if>
					<hr>
				</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 댓글 수정 영역-->
    <div id="modifyReply"></div>
</body>
</html>