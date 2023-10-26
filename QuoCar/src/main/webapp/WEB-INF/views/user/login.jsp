<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<style>

        /* 이미지 스타일 */
        .moving-image {
            width: 300px; /* 이미지 너비 조정 */
            height: auto; /* 이미지 높이 자동으로 조정 */
            position: absolute;
            top: 10%; /* 이미지 수직 중앙 정렬 */
            left: 0; /* 초기 위치를 왼쪽 끝으로 설정 */
            animation: moveImage 7s linear infinite; /* 애니메이션 적용 */
        }

        /* 이미지 이동 애니메이션 */
        @keyframes moveImage {
            0% {
                left: 0; /* 시작 위치 (왼쪽 끝) */
            }
            100% {
                left: 100%; /* 끝 위치 (오른쪽 끝) */
            }
        }

</style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/login.css">
<link rel="icon" type="image/x-icon" href="/img/head.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
    <script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var userid   = $("#userid").val();
            var password = $("#password").val();
            if(userid == ""){
                alert("아이디를 입력하세요.");
                $("#userid").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(password == ""){
                alert("비밀번호를 입력하세요.");
                $("#password").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.form1.action="/user/loginCheck"
            // 제출
            document.form1.submit();
        });
   
    $("input").keypress(function(event) {
        if (event.which === 13) {
            event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
            $("#btnLogin").click();  // 로그인 버튼 클릭 이벤트 호출
        }
      });
    });
</script> 
</head>
<body>
    <div class="login-container">
        <h1>로그인</h1>
        <form name="form1" method="POST">
            <div class="input-container">
                <label for="username">아이디:</label>
                <input type="text" name="userid" id="userid" required>
            </div>
            <div class="input-container">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="button" id="btnLogin">로그인</button>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
            <c:if test="${msg == 'logout'}">
                    <div style="color: red; margin: 10px 0px 0 33px;">
                        로그아웃되었습니다.
                    </div>
                </c:if>
        </form>
        <p>계정이 없으신가요? <a href="register">가입하기</a></p>
        <p><a href="/">홈으로</a><p>
        
        <img src="/img/opencar.png" alt="이미지 설명" class="moving-image">
        
        
    </div>
</body>
</html>
