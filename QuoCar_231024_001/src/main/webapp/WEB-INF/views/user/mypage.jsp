<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이 페이지</title>
  <link rel="stylesheet" href="/css/mypage.css">
</head>
<body>
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
            <label for="userid">이름</label>
            <input type="text" id="userid" value="${userid}" readonly>
          </li>
          <li>
            <label for="username">닉네임</label>
            <input type="text" id="username" value="${username}">
          </li>
          <li>
            <label for="password">비밀번호</label>
            <input type="password" id="password">
          </li>
          <li>
            <label for="gender">성별</label>
            <input type="text" id="gender" value="${gender}" readonly>
          </li>
          <li>
            <label for="email">이메일</label>
            <input type="email" id="email" value="${email}">
          </li>
          <li>
            <label for="birthdate">생년월일</label>
            <input type="text" id="birthdate" value="${birthdate}" readonly>
          </li>
          <li>
            <label for="car-name">차량명</label>
            <input type="text" id="car-name" value="${carManufacturer}">
          </li>
          <li>
            <label for="car-model">차 모델</label>
            <input type="text" id="car-model" value="${carModel}">
          </li>
        </ul>
      </div>
      <div class="function">
        <button type="button" class="edit">수정</button>
      </div>
    </div>
  </div>


  <script>

  </script>
</body>
</html>
