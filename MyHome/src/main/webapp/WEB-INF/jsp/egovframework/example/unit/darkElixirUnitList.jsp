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
                                <h4 class="title">다크엘릭서 유닛 리스트</h4>
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
                                                    <img src="images/bootstrap/볼러1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 볼러
                                            </td>
                                            <td>
                                                	이 덩치 크고 시퍼런 친구는 단순하게 사는걸 종하합니다. 바로 다크 엘릭서를 마시고 바위를 던지는 것이죠. 볼러의 거대한 바위는 목표물에 명중한 뒤 튕겨나가 다시 뒤에 있는 사물을 공격합니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="baller.do" method="post">
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
                                                    <img src="images/bootstrap/골렘1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 골렘
                                            </td>
                                            <td>
                                                	강력한 골렘은 엄청난 피해량을 견딜 수 있습니다! 골렘이 파괴되면 폭발하면서 작은 골렘 둘로 나뉘고, 골렘의 공격력과 체력의20%를 지니게 됩니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="golem.do" method="post">
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
                                                    <img src="images/bootstrap/호그라이더1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 호그 라이더
                                            </td>
                                            <td>
                                                	난폭한 돼지를 길들여 벽을 넘어다니는 호그 라이더는 보잘것없는 장벽 뒤에 숨은 적들을 응징합니다! 다크 엘릭서의 힘이 충만한 전사들은 패배를 모릅니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="hog.do" method="post">
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
                                                    <img src="images/bootstrap/라바하운드1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 라바 하운드
                                            </td>
                                            <td>
                                                	이 화염 괴물은 적의 대공포 시설을 공격하며 다른 부대를 훌륭하게 보호합니다. 파괴되면 수많은 작고 약한 괴물로 분리됩니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="lava.do" method="post">
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
                                                    <img src="images/bootstrap/미니언1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 미니언
                                            </td>
                                            <td>
                                                	다크 엘릭서에서 태어난 하늘의 골칫덩어리입니다 대공 지뢰가 감지할 수 없기에 쉽게 적 마을에 접근할 수 있지만 이 세상에선 허약한 편에 속합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="minian.do" method="post">
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
                                                    <img src="images/bootstrap/발키리1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 발키리
                                            </td>
                                            <td>
                                                	양손 도끼의 달인인 이 영광된 여전사들은 가까운 건물 사이를 뛰어다니며 질풍처럼 무기를 휘둘러 여러 적이나 건물을 한 방에 쓸어버립니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="valkyrie.do" method="post">
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
                                                    <img src="images/bootstrap/마녀1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 마녀
                                            </td>
                                            <td>
                                                	마녀는 절대 혼자 싸우지 않습니다 끊임없이 옛 전투에서 쓰러진 언데드 병사들을 일으켜 세워 그녀의 길을 안내하도록 만듭니다. 마녀를 업그레이드 하면 동시에 소환할 수 있는 해골의 수가 증가합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="witch.do" method="post">
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