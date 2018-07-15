<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

$(document).ready(function() {

   var dataPreferences = {
         
       series: [
           [25, 30, 20, 25]
       ]
   };

   var optionsPreferences = {
         
       donut: true,
       donutWidth: 40,
       startAngle: 0,
       height: "245px",
       total: 100,
       showLabel: false,
       axisX: {
           showGrid: false
       }
   };

   Chartist.Pie('#chartPreferences', dataPreferences, optionsPreferences);

    var contry = new Array();
   var percent = new Array();         

    <c:forEach items="${pieChartList}" var="pieChartList" varStatus="status">
       contry[<c:out value="${status.index}"/>] = ('<c:out value="${pieChartList.country}"/>');
      percent[<c:out value="${status.index}"/>] = ('<c:out value="${pieChartList.percent}"/>');
   </c:forEach> 
   
   Chartist.Pie('#chartPreferences', {
     labels: contry,
     series: percent
   });
   
   // 선택한 요소 뒤에 값을 추가합니다.
   $(".text-info").after(contry[0]);
   $(".text-danger").after(contry[1]);
   $(".text-warning").after(contry[2]);
});

</script>
<form id="frm" name="frm">

</form>
<div class="container-fluid">
   <div class="row">
   
              <div class="col-md-12">
                  <div class="card">
              <img src="images/bootstrap/미니언3.PNG" alt="...">
                      <div class="header">
                          <h4 class="title">미니언 업그레이드 정보</h4>
                          <!-- <p class="category">기본 확실하게 다져서 갑시다~</p> -->
                      </div>
                      <div class="content table-responsive table-full-width">
                          <img src="images/bootstrap/미니언2.PNG" alt="...">
                   </div>
               </div>
           </div>
       </div>
   </div>