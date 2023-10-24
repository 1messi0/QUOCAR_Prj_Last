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
.chat-container {  background-color: #EEF2FA;
  border-radius: 10px;
  padding: 20px;
  padding-top: 10px;
  max-width: 700px;
  height: 700px;
  margin: auto;
}

  .chat-header {
      display: flex; /* Flexbox 사용 */
      align-items: center; /* 요소들을 수직 가운데 정렬 */
      justify-content: center; /* 요소들을 수평 가운데 정렬 */
   } 
   h2 {
     color:#333333 ;
     font-size :small;
     text-align: center;
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
</style>


</head>
<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <main>
     <div class ="chat-container">
        <div class="chat-header">
            <img src="/img/bot.png" width="50" height="50">
        </div>
            <h2>QuoBot</h2>

	<!-- cmodel 선택 -->
	<c:forEach  var="answer"  items="${ answerList }">
    <a href="/Chat/View?mechanic_id=${ answer.mechanic_id }&model_id=${ answer.model_id  }">
		     ${ answer.ans_cont }
		   </a>
	</c:forEach>
  </form>
  <!-- mechanic 선택 -->      
  <div class ="chat-list-container">         
    <c:forEach var="mechanic" items="${mechanicList}">
      <button type="button" onclick="selectMechanic('${mechanic.mechanic_id}')">
        ${mechanic.mechanic_name}
      </button><br>
    </c:forEach>
    
    
  </div>
   </main>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>












