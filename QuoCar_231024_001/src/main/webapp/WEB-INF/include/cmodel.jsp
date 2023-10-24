<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메뉴목록 -->


 
<%--     <tr>
   <c:forEach  var="cmodel"  items="${ cmodelList }">   
     <td>
       <a href="/Chat/List3?model_id=${ cmodel.model_id }">
       ${ cmodel.model_name }
       </a> 
     </td>
   </c:forEach>
 
 </tr>
  --%>
<form class="car-selection-form" action="/Chat/List3" method="get">
  <select class="car-select" name="model_id">
    <option value="">차량선택</option>
    <c:forEach var="cmodel" items="${cmodelList}">
      <option value="${cmodel.model_id}">${cmodel.model_name}</option>
    </c:forEach>
  </select>
  <input class="cmodel-button" type="submit" value="선택">
</form>




    