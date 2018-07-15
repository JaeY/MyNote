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


<div class="container-fluid">
   <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header text-center">
                                <h4 class="title">기타 건물 리스트</h4>
                                <!-- <p class="category">A table for content management</p> -->
                                <br />
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-bigboy">
                                    <thead>
                                        <tr>
                                            <th class="text-center">이미지</th>
                                            <th >이름</th>
                                            <th class="th-description">설명</th>
                                            <th class="text-right">상세 보기</th>
                                            <th class="text-right"></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="img-container">
                                                    <img src="images/bootstrap/집합소.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 집합소
                                            </td>
                                            <td>
                                                	유닛은 집합소로 집결합니다. 집합소를더 건설하고 업그레이드하여 강력한 군대를 양성하세요.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="setunit.do" method="post">
                                                <button type="submit" rel="tooltip" data-placement="left" title="상세 보기" class="btn btn-info btn-simple btn-icon">
                                                    <i class="fa fa-image"></i>
                                                </button>
                                            </form>
                
                                            </td>
                                            <td class="td-number">
                                            </td>

                                        </tr>
                                        
                                        
                                        <tr>
                                            <td>
                                                <div class="img-container">
                                                    <img src="images/bootstrap/훈련소1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 훈련소
                                            </td>
                                            <td>
                                                	훈련소에서 훈련한 유닛으로 적을 공격할 수 있습니다. 훈련소를 업그레이드하면 큰 전투에서 활약하는 고급 유닛을 훈련할 수 있습니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="training.do" method="post">
                                                <button type="submit" rel="tooltip" data-placement="left" title="상세 보기" class="btn btn-info btn-simple btn-icon">
                                                    <i class="fa fa-image"></i>
                                                </button>
                                            </form>
                
                                            </td>
                                            <td class="td-number">
                                            </td>

                                        </tr>
                                        
                                        
                                        <tr>
                                            <td>
                                                <div class="img-container">
                                                    <img src="images/bootstrap/암흑병사훈련소1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 암흑병사 훈련소
                                            </td>
                                            <td>
                                                	암흑병사 훈련소는 다크 엘릭서에서 태어난 생물을 소환합니다. 암흑 병사 훈련소를 업그레이드하면 독특한 전투 기술을 지닌 새로운 유닛을 소환할 수 있습니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="darktraining.do" method="post">
                                                <button type="submit" rel="tooltip" data-placement="left" title="상세 보기" class="btn btn-info btn-simple btn-icon">
                                                    <i class="fa fa-image"></i>
                                                </button>
                                            </form>
                
                                            </td>
                                            <td class="td-number">
                                            </td>

                                        </tr>
                                        
                                        
                                        <tr>
                                            <td>
                                                <div class="img-container">
                                                    <img src="images/bootstrap/클랜성1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 클랜성
                                            </td>
                                            <td>
                                                	클랜 성에는 클랜원이 보낸 지원군 또는 마법과 함께, 자원을 보관할 수 있는 금고가 있습니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="clancastle.do" method="post">
                                                <button type="submit" rel="tooltip" data-placement="left" title="상세 보기" class="btn btn-info btn-simple btn-icon">
                                                    <i class="fa fa-image"></i>
                                                </button>
                                            </form>
                
                                            </td>
                                            <td class="td-number">
                                            </td>

                                        </tr>
                                        
                                        
                                        <tr>
                                            <td>
                                                <div class="img-container">
                                                    <img src="images/bootstrap/암흑마법제작소1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 암흑마법 제작소
                                            </td>
                                            <td>
                                                	가장 용감하거나 무모한 마스터 마법사만이 다크엘릭서 제조에 손을 댈 수 있습니다. 암흑 마법에 숙달되려면 깊은 통찰력이 필요하지만, 전투에서 그만큼의 전술적인 효과를 보장합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="darkmagicfactory.do" method="post">
                                                <button type="submit" rel="tooltip" data-placement="left" title="상세 보기" class="btn btn-info btn-simple btn-icon">
                                                    <i class="fa fa-image"></i>
                                                </button>
                                            </form>
                
                                            </td>
                                            <td class="td-number">
                                            </td>

                                        </tr>
                                        
                                        
                                        <tr>
                                            <td>
                                                <div class="img-container">
                                                    <img src="images/bootstrap/연구소1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 연구소
                                            </td>
                                            <td>
                                                	연금술사들은 연구소에 어떤 어두운 비밀을 감추고 있을까요? 아무도 밝혀낼 용기를 내지 못했습니다. 우리가 아는 것은 단지 그들의 연구를 통해 마법과 유닛이 더욱 강력해지고 빨라져서 좋다는 것입니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="laboratory.do" method="post">
                                                <button type="submit" rel="tooltip" data-placement="left" title="상세 보기" class="btn btn-info btn-simple btn-icon">
                                                    <i class="fa fa-image"></i>
                                                </button>
                                            </form>
                
                                            </td>
                                            <td class="td-number">
                                            </td>

                                        </tr>
                                        
                                        
                                        <tr>
                                            <td>
                                                <div class="img-container">
                                                    <img src="images/bootstrap/마법제작소1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 마법 제작소
                                            </td>
                                            <td>
                                                	마법 제작소는 전장에서 활약하는 것보다 마법 무기를 제작하는 것이 더욱 능숙한 베테랑 마법사들이 머무는 곳입니다. 강력한 공격용 마법을 사용하여 전투의 흐름을 원하는 방향으로 바꾸세요!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="magicfactory.do" method="post">
                                                <button type="submit" rel="tooltip" data-placement="left" title="상세 보기" class="btn btn-info btn-simple btn-icon">
                                                    <i class="fa fa-image"></i>
                                                </button>
                                            </form>
                
                                            </td>
                                            <td class="td-number">
                                            </td>

                                        </tr>
                                        
                                        
                                        
                                        
                                        
                                        

                                    </tbody>
                                </table>
                            </div>
                        </div><!--  end card  -->
                    </div> <!-- end col-md-12 -->
                </div> <!-- end row -->
   </div>