<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터 목록</title>
<link rel="stylesheet" href="/css/common.css" />
<link rel="icon" type="image/x-icon" href="/img/쿼카얼굴.png">
<style>
  tr:first-child {
     background-color : #666;
     color            : #fff;
     font-weight      : bold;   
  }
  
  td  {  text-align :center; 
     border-right-color: #fff; 
  }
  
  td:last-child {
     border-right-color: #666;
  }
  

</style>
</head>
<body>
   <div id="main">
   <h2>고객센터</h2>
   
   <table>
     <tr>
       <td>csc_id</td>
       <td>csc_name</td>
       </tr>
     <tr>
     </tr>
    <c:forEach var="cmenu"  items="${ cmenuList }"> 
     <tr>
       <td>${ cmenu.csc_id }</td>
       <td>${ cmenu.csc_name }</td>
     </tr>   
    </c:forEach> 
   </table>   
   
   </div>
</body>
</html>















