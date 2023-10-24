<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/login.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <script>
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
    </div>
</body>
</html>
