<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
p {
	font-weight: bold;
	margin-top: -29.3px;
}
</style>
<header>
	<br>
      <a href="/"><h3 class="logo">Quo<span>CAR</span></h3></a>
   <nav class="category">
      <ul>
         <li><a href="/insurance">보험</a></li>
         <li><a href="/mechanic">정비</a></li>
         <li><a href="/board/list.do">커뮤니티</a></li>
         <li><a href="/Csc/List2?csc_id=CSC01">고객센터</a></li>
         <li><a href="/chatGPT">QuoGPT</a></li>
            <c:choose>
                <c:when test="${sessionScope.userid == null}">
                    <li><a href="${path}/user/login">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${path}/user/update">내 정보</a></li>
                    <li><p>안녕하세요, ${sessionScope.userid}(${sessionScope.username})님.</p> <a href="${path}/user/logout">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
      </ul>
   </nav>
</header>