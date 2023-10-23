<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ page import="com.quocar.chat.vo.CmodelVo" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="/img/쿼카얼굴.png">
<link rel="stylesheet" href="/css/common.css" />
<style>
main {
	background-color: #EFF2F6;
}

.chat-container {
	max-width: 1000px;
	height: 1000px;
	margin: auto;
	padding-top: 50px;
	padding: 30px;
	border-radius: 10px;
	background-color: #FFFFFF;
	border: solid gray;
	border-width: 0.5px;
	box-shadow: 3px 5px 9px rgba(0, 0, 0, 0.2);
}

.quobot {
	display: flex; /* Flexbox 사용 */
	align-items: center; /* 요소들을 수직 가운데 정렬 */
}

h1 {
	color: #333333;
	font-size: xx-large;
}

h2 {
	color: #333333;
	font-size: 20px;
	text-align: left;
}

.chat-list-container {
	margin-top: 30px;
}

.answer {
	background-color: #FFFFFF;
	border-radius: 5px;
	max-width: fit-content; /* 내용에 맞게 최대 너비 조정 */
	height: fit-content;
	padding: 30px;
	margin-left: 100px;
	font-size: 25px;
	width: 500px;
	display: inline-block;
	box-shadow: 3px 5px 9px rgba(0, 0, 0, 0.2);
}

.next-button {
	background-color: #FFFFFF;
	border-radius: 5px;
	max-width: fit-content; /* 내용에 맞게 최대 너비 조정 */
	height: auto;
	padding: 30px;
	font-size: 25px;
	width: 500px;
	display: inline-block;
	box-shadow: 3px 5px 9px rgba(0, 0, 0, 0.2);
	margin-left: auto;
	font-size: 25px;
	width: 500px;
	display: inline-block;
	
}
.next {
	margin-left: auto; /* 왼쪽 여백을 자동으로 조정하여 오른쪽 정렬 */
	margin-right: 0; /* 오른쪽 여백 제거 */
}
.next {
	margin-left: auto; /* 왼쪽 여백을 자동으로 조정하여 오른쪽 정렬 */
	text-align: right; /* 내부 요소를 오른쪽으로 정렬 */
}
</style>


</head>
<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	<br><br>
    <main>
     <div class ="chat-container">
            <h1>QuoBot</h1>
            
			<br><br><br>
        <div class="quobot">
            <img src="/img/bot.png" width="70" height="70">
        </div>
        
     		<p class="answer">${vo.ans_cont}</p>
	
	<br><br><br><br>
	<div class ="next">
	<a class='next-button' href='${viewUrl}'>더 알아보기</a> 	
	<br><br>
	<a class= 'next-button' href="/Chat/List3?model_id=MD01">처음으로 돌아가기</a>
	
	</div>
  	
  	</div>
   </main>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>












