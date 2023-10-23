<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
</style>

<header>
		<a href="/"><h3 class="logo">Quo<span>CAR</span></h3></a>
	<nav class="category">
		<ul>
			<li><a href="/insurance">보험지식</a></li>
			<li><a href="/mechanic">정비</a></li>
			<li><a href="/board/list.do">커뮤니티</a></li>
			<li><a href="/Csc/List2?csc_id=CSC01">고객센터</a></li>
			
			<c:choose>
                <c:when test="${sessionScope.userid == null}">
                    <li><a href="${path}/user/login.do">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li>${sessionScope.userid}님이 로그인중입니다. 
                    <a href="${path}/user/logout.do">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
		</ul>
	</nav>
</header>