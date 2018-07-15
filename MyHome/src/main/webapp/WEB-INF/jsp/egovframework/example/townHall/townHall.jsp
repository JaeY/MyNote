<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

$(document).ready(function() {
	

});

</script>
<form id="frm" name="frm">

</form>
<div class="container-fluid">
   <div class="row">
       <div class="content">
	<form id="frmReq" method="get" action="townHall.do" class="form-horizontal">
	<!--  action 부분 jsp 변경해주기. 진행중인jsp명으로 -->
        
		<button class="btn btn-primary btn-fill btn-wd" id="primaryBtId">검색</button>
                                      
         <label class="checkbox checkbox-inline">
         <input type="checkbox" name="hanq" data-toggle="checkbox" value="타운홀">타운홀
         </label>

         <label class="checkbox checkbox-inline">
         <input type="checkbox" name="hanq" data-toggle="checkbox" value="업그레이드비용">업그레이드비용
         </label>

        <label class="checkbox checkbox-inline">
        <input type="checkbox" name="hanq" data-toggle="checkbox" value="업그레이드시간">업그레이드시간
        </label>
         <label class="checkbox checkbox-inline">
        <input type="checkbox" name="hanq" data-toggle="checkbox" value="집합소인구">집합소인구
        </label>
         <label class="checkbox checkbox-inline">
        <input type="checkbox" name="hanq" data-toggle="checkbox" value=HP>HP
        </label>
        </form>
</div>
              <div class="col-md-12">
                  <div class="card">
                     
                      <div class="content table-responsive table-full-width">
                          <table class="table table-hover table-striped">
                              <thead>
                              <c:forEach items="${arr}" var="arr" varStatus="status">
                              <th>${arr}</th>
                              </c:forEach>
                                 <!--  <th>아이디</th>
                                 <th>이름</th>
                                 <th>나이</th>
                                 <th>국가</th>
                                 <th>기타</th> -->
                              </thead>
                              <tbody>
                               <tbody>
                               <c:forEach items="${townHallList}" var="townHallList" varStatus="status">                        
                                 <tr>
                                    <c:forEach items="${arr}" var="arr" varStatus="status">         
									
                                 <c:if test="${arr == '타운홀' }">
                                    <td><c:out value="${townHallList.townhall}"/></td>
                                 </c:if>
                                 <c:if test="${arr == '업그레이드비용' }">
                                    <td><c:out value="${townHallList.upgradecost}"/></td>
                                 </c:if>
                                 <c:if test="${arr == '업그레이드시간' }">
                                    <td><c:out value="${townHallList.upgradetime}"/></td>
                                 </c:if>
                                 <c:if test="${arr == '집합소인구' }">
                                    <td><c:out value="${townHallList.population}"/></td>
                                 </c:if>
                                 <c:if test="${arr == 'HP' }">
                                    <td><c:out value="${townHallList.hp}"/></td>
                                 </c:if>                           
                              </c:forEach>
                              </tr>
                               </c:forEach>
                              </tbody>
                              
                             <%--  <tbody>
                               <c:forEach items="${welcomeWebList}" var="welcomeWebList" varStatus="status">
                                  <tr>
                                        <td><c:out value="${welcomeWebList.id}"/></td>
                                        <td><c:out value="${welcomeWebList.userName}"/></td>
                                        <td><c:out value="${welcomeWebList.age}"/></td>
                                        <td><c:out value="${welcomeWebList.country}"/></td>
                                        <td><c:out value="${welcomeWebList.etc}"/></td>
                                     </tr>
                               </c:forEach>
                              </tbody> --%>
                          </table>
                   </div>
               </div>
           </div>
       </div>
   </div>