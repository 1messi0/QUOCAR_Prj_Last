<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuoBot</title>
<link rel="shortcut icon" href="/img/쿼카얼굴.png">
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
     color:#333333 ;
     font-size :xx-large;
   }
    h2 {
     color:#333333 ;
     font-size: 20px;
     text-align: left;
   }
   .chat-list-container{
     margin-top: 30px;
   }
   button {
  display: block;
  width: 200px; /* 버튼의 가로 크기 */
  height: 40px; /* 버튼의 세로 크기 */
  margin-bottom: 10px; /* 버튼 간격 설정 */
  cursor:pointer;
}
.chatbot-button {
  display: inline-block;
  margin: 5px;
  padding: 10px;
  border-radius: 5px;
  background-color: #E5E5E5;
  box-shadow: 3px 5px 9px rgba(0, 0, 0, 0.2);	
  color: #000000;
  font-size: 25px;
  font-style: inherit;
  text-decoration: none;
  width: 200px;
  height: 70px;
  display:flex;
justify-content:center;
  align-items:center;/* 버튼 안의 텍스트 가운데 배치 */
}

.chatbot-button:hover {
  background-color: #E5E5E5;
  color: #CDCDCD;
}
.car-selection-form {
  display: flex;
  align-items: center;
}

.car-select {
  padding: 10px;
  font-size: 20px;
}

.cmodel-button {
  padding: 10px;
  margin: 15px;
  font-size: 20px;
}
.button-text {
  margin-top: 5px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.mechanic { 
	background-color: #FFFFFF;
	border-radius: 5px;
  	height: 400px;
	padding: 30px;
    margin-left: 100px; 
    box-shadow: 3px 5px 9px rgba(0, 0, 0, 0.2);
}
.chat-container .mechanic {
	background-color: #FFFFFF;
	border-radius: 5px;
	max-width: fit-content; /* 내용에 맞게 최대 너비 조정 */
	height:auto; /* 내용의 높이에 따라 자동 조정 */
	padding:20px; /* 내부 여백 조정 */
	border-width :1 px ;
	margin-left :100 px ;
	display:inline-block ;/* 인라인 요소로 배치 */

	/* 말풍선 모양 스타일링 */
	position:relative ;
}
</style>
<script>

</script>
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/header.jsp" />
 <br><br>
<main>
    <div class="chat-container">
    <h1>QuoBot</h1>
    <br><br>
    
    <%@include file="/WEB-INF/include/cmodel.jsp" %>

    <h2>${model_name}</h2>
	<br><br><br>
	
    <div class="quobot">
        <img src="/img/bot.png" width="70" height="70">
    </div>
   <div class ="mechanic">
    <!-- model_id 가져오기 -->
	<c:set var='model_id' value='${param.model_id}'/> 
	<!-- viewUrl 링크로 이동 -->
	<c:url value='/Chat/View' var='viewUrl'>
	<c:param name='mechanic_id' value='MC01'/>
	<c:param name='model_id' value='${model_id}'/>
	</c:url>
	<a class='chatbot-button' href='${viewUrl}'>
	<span class='button-text'>엔진오일</span></a> 
	<br><br>
	
	<c:url value='/Chat/View' var='viewUrl'>
	<c:param name='mechanic_id' value='MC02'/>
	<c:param name='model_id' value='${model_id}'/>
	</c:url>
	<a class='chatbot-button' href='${viewUrl}'>
	<span class='button-text'>타이어</span></a> 
	<br><br>
	
	<c:url value='/Chat/View' var='viewUrl'>
	<c:param name='mechanic_id' value='MC03'/>
	<c:param name='model_id' value='${model_id}'/>
	</c:url>
	<a class='chatbot-button' href='${viewUrl}'>
	<span class='button-text'>브레이크</span></a> 
	</div>	
    </div>
   </main>
       <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>














