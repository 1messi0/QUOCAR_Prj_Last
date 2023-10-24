<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴목록 -->


 
 <tr>
   
   <c:forEach  var="mechanic"  items="${ mechanicList }">   
     <td>
       <a href="/Chat/List3?mechanic_id=${ mechanic.mechanic_id }">
       ${ mechanic.mechanic_name }
       </a> 
     </td>
   </c:forEach>
 
 </tr>










    