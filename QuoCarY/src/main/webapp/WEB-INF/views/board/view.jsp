<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QuoCar</title>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<link rel="icon" type="image/x-icon" href="/img/쿼카얼굴.png">
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/reply.css" />
<style>

/* 기본 스타일 */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    height: 1600px;
}

/* 컨테이너 스타일 */
.container {
    max-width: 1000px;
    margin: 0 auto;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 카드 스타일 */
.card {
    padding: 20px;
}

/* 제목 스타일 */
.title {
    font-size: 24px;
    font-weight: bold;
    margin: 0;
}

/* 날짜, 조회수, 작성자 스타일 */
.date, .view-count, .author {
    font-size: 14px;
    color: #888;
}

/* 본문 내용 스타일 */
.content {
    font-size: 16px;
    margin-top: 20px;
}

/* 버튼 컨테이너 */
.button-container {
    margin-top: 20px;
}

/* 공통 버튼 스타일 */
.button {
    padding: 14px 24px;
    background-color: #334F4F;
    color: #fff;
    border: 2px solid #ccc;
    cursor: pointer;
    margin-right: 10px;
    border-radius: 5px;
}

/* 특정 버튼 스타일 */
#btnDelete {
    background-color: #334F4F;
    border: 2px solid #ccc;
}

/* 댓글 섹션 스타일 */
.comment-section {
    text-align: center;
    margin-top: 30px;
}

/* 텍스트 입력 필드 스타일 */
textarea {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* 댓글 버튼 스타일 */
#btnReply {
    padding: 12px 22px;
    background-color: #334F4F;
    color: #fff;
    border: 2px solid #ccc;
    cursor: pointer;
}

/* 댓글 목록 스타일 */
#listReply {
    margin-top: 20px;
}

hr{
	color: #888;
}

footer {
	position: fixed; /* 화면 아래에 고정 */
	left: 0;
	bottom: 0;
	width: 100%; /* 전체 너비로 확장 */
	background-color: #333; /* 배경색 지정 (원하는 색상으로 변경) */
	color: #fff; /* 글자색 지정 (원하는 색상으로 변경) */
	text-align: center; /* 텍스트 가운데 정렬 */
	padding: 10px 0; /* 상하 여백 설정 */
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function() {
		
		listReply("1"); // 댓글 목록 불러오기
		//listReply2(); // ** json 리턴방식
		//listReplyRest("1"); // rest방식
        
        // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
        $("#btnReply").click(function(){
            var replytext=$("#replytext").val();
            var bno="${dto.bno}"
            var param="replytext="+replytext+"&bno="+bno;
            var replyInputField = $('#replytext');
            $.ajax({                
                type: "post",
                url: "${path}/reply/insert.do",
                data: param,
                success: function(){
                    //alert("댓글이 등록되었습니다.");
                    listReply2();
                    replyInputField.val('');
                }
            });
        });
		
        $("#btnList").click(function(){
            location.href="${path}/board/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        });
	
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/board/delete.do";
				document.form1.submit();
			}
		});
        $("#btnUpdete").click(function(){
            document.form1.action="${path}/board/update.do"
        });
	});
	
    // 2_1. 댓글 목록 - 전통적인 Controller방식
    function listReply(num){
        $.ajax({
            type: "get",
            url: "${path}/reply/list.do?bno=${dto.bno}&curPage="+num,
            success: function(result){
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }
    // 2_2. 댓글 목록 - RestController를 이용 json형식으로 리턴
    function listReply2(){
        $.ajax({
            type: "get",
            //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
            url: "${path}/reply/listJson.do?bno=${dto.bno}",
            success: function(result){
                console.log(result);
                var output = "<table>";
                for(var i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].username;
                    output += "("+changeDate(result[i].regdate)+")<br>";
                    output += result[i].replytext+"</td>";
                    output += "<tr>";
                }
                output += "</table>";
                $("#listReply").html(output);
            }
        });
    }
    // **날짜 변환 함수 작성
    function changeDate(date){
        date 	= new Date(parseInt(date));
        year 	= date.getFullYear();
        month 	= date.getMonth();
        day 	= date.getDate();
        hour 	= date.getHours();
        minute 	= date.getMinutes();
        second 	= date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
    
 // 2_3. 댓글 목록 - Rest방식
    function listReplyRest(num){
        $.ajax({
            type: "get",
            url: "${path}/reply/list/${dto.bno}/"+num,
            success: function(result){
            // responseText가 result에 저장됨.
                $("#listReply").html(result);
            }
        });
    }    
    
    // **댓글 수정화면 생성 함수
    function showReplyModify(rno){
        $.ajax({
            type: "get",
            url: "${path}/reply/detail/"+rno,
            success: function(result){
                $("#modifyReply").html(result);
                // 태그.css("속성", "값")
                $("#modifyReply").css("visibility", "visible");
            }
        })
    }
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="container">
	<div class="card">
	<form name="form1" method="post">
		<h3 class="title" style="font-size: 2.5em;">제목 : ${dto.title}</h3>
		<div class="content" style="font-size: 30px;">🗨 ${dto.content}</div>
		<br>
		<div class="date">
			작성일자 :
			<fmt:formatDate value="${dto.regdate}" pattern="MM-dd HH:mm" />
		</div>
		<div class="view-count">조회수 : ${dto.viewcnt}</div>
		<div class="author">작성자 : ${dto.writer}</div>
		<div  class="button-container">
			<!-- 게시물번호를 hidden으로 처리 -->
			<input type="hidden" name="bno" value="${dto.bno}">
			<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
			<c:if test="${sessionScope.userid == dto.writer}">
			<button type="button" class="button"
					onclick="location.href='${path}/board/updateform.do?bno=${dto.bno}'">수정</button>
				<button type="button" class="button" id="btnDelete">삭제</button>
			</c:if>
				<button type="button" class="button" id="btnList">목록</button>
		</div>

	</form>
	<div class="comment-section" style="text-align: center;">
        <br>
        <!-- **로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:if test="${sessionScope.userid != null}">    
        <textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
        <br>
        <button type="button" class="button" id="btnReply">댓글 작성</button>
        </c:if>
    </div>
    <div id="listReply"></div>
    </div>
    </div>
	<!-- **댓글 목록 출력할 위치 -->
	<a href="/Chat/List3?model_id=MD01" class="fixed-button"> <img
		src="/img/	bot.png" alt="Q 봇" style="width: 70px; height: 70px;"></a>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>

