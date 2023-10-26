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
<link rel="icon" type="image/x-icon" href="/img/head.png">
<link rel="stylesheet" href="/css/common.css" />

<style>

main {
	background-color: #EFF2F6;
	height: 1300px;
}

.chat-container {
    max-width: 1000px;
    height: 1000px;
    margin: auto;
    padding-top: 50px;
    padding: 30px;
    border-radius: 10px;
    background-color: #F4F4F4;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

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

h2 {
    color: #333333;
    font-size: 18px;
    text-align: left;
}

.chat-list-container {
    margin-top: 30px;
}

.answer {
    background-color: #FFFFFF;
    border-radius: 10px;
    max-width: fit-content;
    height: auto;
    padding: 20px;
    margin-left: 100px;
    font-size: 20px;
    width: 500px;
    display: inline-block;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.next-button {
    background-color: #007BFF; /* 애플 블루 컬러 */
    color: #FFFFFF;
    border-radius: 10px;
    max-width: fit-content;
    height: auto;
    padding: 30px;
    font-size: 20px;
    font-weight: bold;
    width: 500px;
    display: inline-block;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
    margin-left: auto;
    transition: background-color 0.2s; /* 호버 효과에 사용되는 속성 추가 */
}

.next-button:hover {
    background-color: #0056b3; /* 호버 시 컬러 변경 */
}

.next {
    margin-left: auto;
    text-align: right;
}

.next:hover {
    cursor: pointer; /* 호버 시 커서 변경 */
}

</style>

</head>
<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
	<br><br>
    <main>
    <br>
     <div class ="chat-container">
            <h1>QuoBot</h1>
            
			<br><br><br>
        <div class="quobot">
            <img src="/img/bot.png" width="70" height="70">
        </div>
 		<div class = "answer">
 		<br>
         <p> ${vo.ans_cont} </p>   
		<c:choose>
		    <c:when test="${vo.model_id == 'MD01'}">
		       <a class='service-link' href='https://www.hyundai.com/kr/ko/service-membership/service-network/service-reservation-search'>
					https://www.hyundai.com/kr/ko/service-membership/service-network/service-reservation-search</a>
					<a class='service-img' href='https://www.hyundai.com/kr/ko/service-membership/service-network/service-reservation-search'>
					<img src="/img/blue-members.jpg" alt="service" width="500" height="300" ></a>
					<p>서비스 네트워크 검색/예약 <br> 현대자동차 - 현대닷컴 <br> www.hyundai.com</p>
		    </c:when>
		    <c:when test="${vo.model_id == 'MD02'}">
		        <a class='service-link' href='https://www.hyundai.com/kr/ko/service-membership/service-network/service-reservation-search'>
					https://www.hyundai.com/kr/ko/service-membership/service-network/service-reservation-search</a>
					<a class='service-img' href='https://www.hyundai.com/kr/ko/service-membership/service-network/service-reservation-search'>
					<img src="/img/blue-members.jpg" alt="service" width="500" height="300" ></a>
					<p>서비스 네트워크 검색/예약 <br> 현대자동차 - 현대닷컴 <br> www.hyundai.com</p>
		    </c:when>
		    <c:when test="${vo.model_id == 'MD03'}">
		        <a class='service-link' href='https://members.kia.com/kr/view/qnet/asn_prct/qnet_asn_prct_index.do'>
					https://members.kia.com/kr/view/qnet/asn_<br>prct/qnet_asn_prct_index.do</a>
					<a class='service-img' href='https://members.kia.com/kr/view/qnet/asn_prct/qnet_asn_prct_index.do'>
					<img src="/img/kia-members.jpg" alt="service" width="500" height="250" ></a><br><br>
					<p>서비스 네트워크 검색/예약 <br> 기아자동차 - 기아멤버스 <br> www.members.kia.com</p>
		    </c:when>
		    <c:when test="${vo.model_id == 'MD04'}">
		        <a class='service-link' href='https://members.kia.com/kr/view/qnet/asn_prct/qnet_asn_prct_index.do'>
					https://members.kia.com/kr/view/qnet/asn_<br>prct/qnet_asn_prct_index.do</a>
					<a class='service-img' href='https://members.kia.com/kr/view/qnet/asn_prct/qnet_asn_prct_index.do'>
					<img src="/img/kia-members.jpg" alt="service" width="500" height="250" ></a><br><br>
					<p>서비스 네트워크 검색/예약 <br> 기아자동차 - 기아멤버스 <br> www.members.kia.com</p>
		    </c:when>
		    <c:otherwise>
		        <a class='service-link' href='https://www.kg-mobility.com/kr/service/index.html'>
					https://www.kg-mobility.com/kr/service/index.html</a>
					<a class='service-img' href='https://www.kg-mobility.com/kr/service/index.html'>
					<img src="/img/KG_Mobility_logo.png" alt="service" width="500" height="250" ></a><br><br>
					<p>서비스 네트워크 검색/예약 <br> KG모빌리티 - 리멤버서비스 <br> www.kg-mobility.com</p>
		    </c:otherwise>
		</c:choose> 
			
		</div> 
		
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
