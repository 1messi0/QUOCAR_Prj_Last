<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의사항 내용조회</title>
<link rel="shortcut icon" href="/img/쿼카얼굴.png">
<link rel="stylesheet" href="/css/common.css" />

<script>
   
</script>

<style>

/* Reset default list styles */
ul, li {
   list-style: none;
   margin: 0;
   padding: 0;
}

.menu-bar td {
   padding: 30px;
   border: none;
}

.menu-bar a {
   text-decoration: none;
   color: #333;
   font-size: 18px;
   font-weight: bold;
   transition: color 0.3s; /* 호버 시 텍스트 색상 변경 애니메이션 */
}

.menu-bar a:hover {
   color: #000;
}

.center {
   font-size: 24px;
   text-weight: bold;
}

/* 삭제 버튼 스타일 */
.btn-delete {
   display: inline-block;
   padding: 10px 20px;
   background: #0A0A0A;
   color: #fff;
   border: none;
   border-radius: 10px;
   font-weight: bold;
   font-size: 18px;
   cursor: pointer;
   transition: transform 0.3s, box-shadow 0.3s; /* 호버 시 버튼 스타일 변경 애니메이션 */
   box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.btn-delete:hover {
   transform: scale(1.05);
   box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

.btn-reply {
   display: inline-block;
   padding: 10px 20px;
   background: #0A0A0A;
   color: #fff;
   border: none;
   border-radius: 10px;
   font-weight: bold;
   font-size: 18px;
   cursor: pointer;
   transition: transform 0.3s, box-shadow 0.3s; /* 호버 시 버튼 스타일 변경 애니메이션 */
   box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.btn-reply:hover {
   transform: scale(1.05);
   box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

/*    ================================   */

#table {
  width: 80%;
  margin: 0 auto;
  font-family: Arial, sans-serif;
  border: 2px solid #ddd;
  border-collapse: collapse;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#table tr {
  background-color: #f2f2f2;
}

#table td {
  padding: 10px;
  padding-left: 30px;
}

.center {
  font-weight: bold;
  font-size: 20px;
  text-align: center;
}

.btn-reply, .btn-delete {
  font-size: 22px;
  padding: 18px 28px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 10px 5px;
  border-radius: 5px;
  width: auto;
}

.btn-reply {
  background-color: #364F4F;
  color: white;
}

.btn-delete {
  background-color: #364F4F;
  color: white;
}


/*   추가    */

.solid {
   border-bottom-style: solid;
   border-bottom-width: thin;
}

#centertitle {
   border-right-style: solid;
   border-right-width: thin;
   border-right-color: #ddd;
   border-left-style: solid;
   border-left-width: thin;
   border-left-color: #ddd;
   font-weight: bold;
   font-size: 24px;
   color: #000;
}

#csccont {
   background-color: white;
   font-size: 22px;
}

#csctitle {
   background-color: white;
   font-size: 22px;
   text-align: center;
   font-weight: bold;
}

#cscbutton {
   background-color: white;
   font-size: 22px;
   text-align: right;
}

.contentsize {
   border-top-style: solid;
   border-top-width: thin;
   border-top-color: #ddd;
   height: 400px;   
   vertical-align: top;
}


#inputcont {
   font-size: 20px;
   text-align: left;
   margin-left: 10px; 
   color: #595959;
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

</head>
<body>
   <jsp:include page="/WEB-INF/views/include/header.jsp" />
   <main>
      <div id="main">
         <br>
         <!-- 메뉴 목록 -->
         <%@include file="/WEB-INF/include/cmenu.jsp"%>

         <form action="/Csc/View" method="POST">
            <input type="hidden" name="csc_id" value="${ vo.csc_id      }" /> <input
               type="hidden" name="csc_idx" value="${ vo.csc_idx     }" /> <input
               type="hidden" name="csc_bnum" value="${ vo.csc_bnum    }" /> <input
               type="hidden" name="csc_lvl" value="${ vo.csc_lvl     }" /> <input
               type="hidden" name="csc_step" value="${ vo.csc_step    }" /> <input
               type="hidden" name="csc_nref" value="${ vo.csc_nref    }" /> <input
               type="hidden" name="username" value="${ vo.username    }" />
            <table id="table">
               <tr class="solid">
                  <td class="center" id="centertitle">작성일</td>
                  <td class="center" id="inputcont">${ vo.csc_regdate }</td>
                  <td class="center" id="centertitle">글번호</td>
                  <td class="center" id="inputcont">${ vo.csc_idx }</td>
               </tr>
               <tr class="solid">
                  <td class="center" id="centertitle">작성자</td>
                  <td class="center" id="inputcont">${ vo.csc_writer }</td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td class="center"  id="centertitle">제　목</td>
                  <td colspan="3" id="csctitle" style="text-align: left">${ vo.csc_title }</td>
               </tr>
               <tr class="contentsize">
                  <td class="center" id="centertitle">내　용</td>
                  <td colspan="3" id="csccont" style="text-align: left">${ vo.csc_cont }</td>
               </tr>
               <tr>
                  <td class="center" id="centertitle"></td>
                  <td colspan="3" id="csccont" style="text-align: center">
               <tr>
                  <td id="centertitle"><c:if test="${post.csc_lvl == 0}">
                ${post.csc_idx}
                </c:if></td>
                  <td id="cscbutton"><c:if test="${sessionScope.username == '쿼카' }">
                        <a
                           href="/Csc/WriteForm?csc_id=${ vo.csc_id }&csc_idx=${ vo.csc_idx }&csc_bnum=${ vo.csc_bnum }&csc_lvl=${ vo.csc_lvl }&csc_step=${ vo.csc_step }&csc_nref=${ vo.csc_nref }&username=${username}"
                           class="btn-reply">답글쓰기</a>
                        <a
                           href="/Csc/Delete?csc_id=${vo.csc_id}&csc_idx=${vo.csc_idx}&username=${username}"
                           class="btn-delete">　삭제　</a>
                     </c:if></td>
                     <td id="cscbutton"></td>
                     <td id="cscbutton"></td>
               </tr>
            </table>
         </form>
      </div>
   </main>
      <a href="/Chat/List3?model_id=MD01" class="fixed-button"> <img
      src="/img/bot.png" alt="Q 봇" style="width: 70px; height: 70px;"></a>
   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>

