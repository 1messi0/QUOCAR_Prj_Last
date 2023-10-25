<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이 페이지</title>
  <link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
    <form action="/user/updateUserInfo" method="POST">
  <div class="my-page">
    <div class="header">
      <h1>마이 페이지</h1>
      <h2>${userid}</h2>
      <h2>${username}</h2>
    </div>
    <div class="main">
      <div class="info">
        <h3>내 정보</h3>
        <ul>
          <li>
            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="${name}" readonly>
          </li>
          <li>
            <label for="userid">아이디</label>
            <input type="text" id="userid" name="userid" value="${userid}" readonly>
          </li>
          <li>
            <label for="username">닉네임</label>
            <input type="text" id="username" name="username" value="${username}">
         </li>
         <li>
            <label for="password">현재 비밀번호</label>
            <input type="password" id="password" name="password">
         </li>
         <li>
            <label for="new-password">새 비밀번호</label>
            <input type="password" id="new-password" name="new-password">
         </li>
         <li>
            <label for="confirm-password">비밀번호 확인</label>
            <input type="password" id="confirm-password" name="confirm-password">
         </li>  
          <li>
            <label for="gender">성별</label>
            <input type="text" id="gender" name="gender" value="${gender}" readonly>
          </li>
          <li>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" value="${email}">
          </li>
          <li>
            <label for="birthdate">생년월일</label>
            <input type="text" id="birthdate" name="birthdate" value="${birthdate}" readonly>
          </li>
          <li>
            <label for="car-name">차량명</label>
            <input type="text" id="car-name" name="car-name" value="${carManufacturer}" >
          </li>
          <li>
            <label for="car-model">차 모델</label>
            <input type="text" id="car-model" name="car-model" value="${carModel}">
          </li>
        </ul>
      </div>
      <div class="function">
        <button type="submit" class="edit">수정</button>
      </div>
    </div>
  </div>
  <c:if test="${not empty successMessage}">
    <div class="success-message">${successMessage}</div>
  </c:if>
  <c:if test="${not empty errorMessage}">
    <div class="error-message">${errorMessage}</div>
  </c:if>
  </form>
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  document.addEventListener("DOMContentLoaded", function() {
    var editButton = document.querySelector(".edit");
    editButton.addEventListener("submit", function() {
      var newUsername = document.getElementById("username").value;
      var newEmail = document.getElementById("email").value;
      var newBirthdate = document.getElementById("birthdate").value;
      var newCarManufacturer = document.getElementById("car-name").value;
      var newCarModel = document.getElementById("car-model").value;
      var newPassword = document.getElementById("new-password").value;
      var confirmPassword = document.getElementById("confirm-password").value;

      if(newUsername.value=='') {
    	  alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
          return false;
      }
      // 새 비밀번호와 비밀번호 확인이 일치하는지 확인
      if (newPassword !== confirmPassword) {
        alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
        return false;
      }
     
     
    });
  });
  
</script>
</body>
</html>