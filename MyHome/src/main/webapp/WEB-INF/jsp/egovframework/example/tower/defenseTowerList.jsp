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
                                <h4 class="title">방어타워 리스트</h4>
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
                                                    <img src="images/bootstrap/airDefense.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 대공포
                                            </td>
                                            <td>
                                                	대공포는 상대의 공중 유닛에 치명적인 피해를 주지만 지상 유닛은 공격할 수 없습니다. 최대한 넓은 영공을 방어할 수 있도록 그 위치를 잘 선정해야 합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="airDefense.do" method="post">
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
                                                    <img src="images/bootstrap/airSweeper.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 바람 방출기
                                            </td>
                                            <td>
                                                	바람 방출기는 강력한 바람을 내뿜어 공중의 적을 밀어내며 하늘을 방어합니다. 바람 방출기의 바람은 한 방향으로만 보낼 수 있으므로, 방향을 바꿔가며 최대한의 효과를 얻으세요!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="airSweeper.do" method="post">
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
                                                    <img src="images/bootstrap/archerTower.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 아처 타워
                                            </td>
                                            <td>
                                                	아처 타워는 대포보다 사정거리가 더 길고 공중 유닛도 공격할 수 있습니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="archerTower.do" method="post">
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
                                                    <img src="images/bootstrap/bombTower.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 폭탄 타워
                                            </td>
                                            <td>
                                                	폭탄 타워는 근처의 지상 유닛에게 폭탄을 던지고, 파괴 시 폭발합니다! 근접 유닛은 가까이 가지 않는게 좋아요!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="bombTower.do" method="post">
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
                                                    <img src="images/bootstrap/cannon.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 대포
                                            </td>
                                            <td>
                                                	대포는 훌륭한 거점 방어 시설입니다. 업그레이드하면 공격력이 증가하지만 업그레이드 중에는 작동하지 않습니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="cannon.do" method="post">
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
                                                    <img src="images/bootstrap/eagleArtillery.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 독수리 포탑
                                            </td>
                                            <td>
                                                	독수리 포탑의 사정거리는 거의 무제한이며, 폭발하는 포탄으로 강력한 적을 겨냥해 공격합니다. 하지만 이 포탑은 많은 수의 병력이 배치되어야만 작동합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="eagleArtillery.do" method="post">
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
                                                    <img src="images/bootstrap/hiddenTesla.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 숨겨진 뇌전탑
                                            </td>
                                            <td>
                                                	숨겨진 뇌전탑으로 치명적인 함정을 준비하세요! 마법사들이 번개 구름을 가둬든 은밀한 포탑입니다. 적이 충분히 가까이 걸오거나 날아오면 포탑이 튀어나와 전기 마법의 힘으로 지져버립니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="hiddenTesla.do" method="post">
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
                                                    <img src="images/bootstrap/infernoTower.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 인페르노 타워
                                            </td>
                                            <td>
                                                	인페르노 타워의 다크 엘릭서로 화염을 일으켜 단일 표적에게 막대한 피해를 주거나, 여러 표적을 게속해서 불태울 수 있습니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="infernoTower.do" method="post">
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
                                                    <img src="images/bootstrap/mortar.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 박격포
                                            </td>
                                            <td>
                                                	박격포는 광역 피해를 주는 포탄으로 적 무리를 쓸어버립니다. 너무 가까이 접근한 적은 공격할 수 없습니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="mortar.do" method="post">
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
                                                    <img src="images/bootstrap/wizardTower.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 마법사 타워
                                            </td>
                                            <td>
                                                	궁극의 비전 방어 시설! 타워 위의 마법사는 강력한 광역 마법으로 자싱 및 공중 유닛을 동시에 공격합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="wizardTower.do" method="post">
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
                                                    <img src="images/bootstrap/xbow.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 대형 석궁
                                            </td>
                                            <td>
                                                	대형 석궁은 끔찍할 정도로 강력한 힘을 지닌 신비로운 화살을 발사합니다. 엘릭서로 대형 석궁을 장전하면 자동으로 작동합니다. 지상 및 공중 유닛 모두를 공격 할 수 있지만 지상 유닛만 공격하도록 설정하면 사정거리가 증가합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="xbow.do" method="post">
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