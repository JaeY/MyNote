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
                                <h4 class="title">엘릭서 유닛 리스트</h4>
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
                                                    <img src="images/bootstrap/아처1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 아처
                                            </td>
                                            <td>
                                                	전장뿐만 아니라 일상생활에서도 거리 두길 좋아하는 명사수입니다. 집중해서 공격 대상을 파괴하는 것이야말로 이들의 진정한 행복입니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="archer.do" method="post">
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
                                                    <img src="images/bootstrap/해골비행선1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 해골 비행선
                                            </td>
                                            <td>
                                                	장벽을 파괴하는 즐거움을 방어 시설을 파괴하는 즐거움으로 대체한 상급 해골입니다. 거슬리는 박격포와 대포를 철거하세요!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="balloon.do" method="post">
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
                                                    <img src="images/bootstrap/베이비드래곤1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 베이비 드래곤
                                            </td>
                                            <td>
                                                	하늘을 나는 이 아기 용은 얼핏 소심해 보이지만. 혼자 내버려 두면 굉장한 화력을 발휘합니다! 다른 공중 유닛들과 같이 있지 않으면, 베이비 드래곤은 분노하여 공격력과 공격 속도가 증가합니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="babyDragon.do" method="post">
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
                                                    <img src="images/bootstrap/바바리안1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 바바리안
                                            </td>
                                            <td>
                                                	멋들어진 콧수염과 불거져 나온 근육에서 솟구치는 힘으로 적 마을을 아수라장으로 만드는 용감한 전사입니다. 투입한 바바리안 무리가 만드는 아수라장을 감상하세요!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="babarian.do" method="post">
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
                                                    <img src="images/bootstrap/드래곤1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 드래곤
                                            </td>
                                            <td>
                                                	드래곤의 강력함은 이미 세계적으로 유명합니다. 비늘로 뒤덮인 하늘의 공포는 무자비하여 누구도 그의 화염으로부터 도망칠 수 없을 것입니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="dragon.do" method="post">
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
                                                    <img src="images/bootstrap/자이언트1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 자이언트
                                            </td>
                                            <td>
                                                	차분해 보이는 덩치들이지만 포탑이나 대포를 발견하면 내면의 분노를 표출합니다! 비록 속도는 느리지만 꾸준한 면모를 보이는 이 전사들은 앞장서서 피해를 견디는데 매우 뛰어납니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="giant.do" method="post">
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
                                                    <img src="images/bootstrap/고블린1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 고블린
                                            </td>
                                            <td>
                                                	오직 약탈에만 전념하는 작고 귀찮은 생물입니다! 고블린은 점핑 트랩보다 빠르고 자원에 대한 끝없는 욕망을 보여줍니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="goblin.do" method="post">
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
                                                    <img src="images/bootstrap/치유사1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 치유사
                                            </td>
                                            <td>
                                                	오직 아군 유닛을 보호하고 치유할 목적으로 살아가는 성스러운 존재입니다. 그녀의 치유력은 모든 유닛에 도움이 되니 방공 시설로부터 그녀를 보호하는 것을 잊지 말아야 합니다!
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="hiller.do" method="post">
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
                                                    <img src="images/bootstrap/광부1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 광부
                                            </td>
                                            <td>
                                                	이 유닛은 땅속에서 몰래 굴을 파고 장벽을 통과해 목표물 바로 옆에 나타납니다. 땅속에 있는 광부는 피해를 입거나 함정을 작동시키지 않지만 마법에 의한 보너스 효과는 고스란히 받습니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="miner.do" method="post">
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
                                                    <img src="images/bootstrap/페카1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 페카
                                            </td>
                                            <td>
                                                	P.E.K.K.A는 기사일까요? 사무라이? 아니면 로봇? 아무도 모릅니다! P.E.K.K.A의 갑옷은 엄청난 피해도 견딜 수 있습니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="pekka.do" method="post">
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
                                                    <img src="images/bootstrap/월브1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 폭탄 돌격병
                                            </td>
                                            <td>
                                                	해골 돌격병의 차가운 언데드 심장을 데울 방법은 오로지 장벽 폭발뿐입니다. 분대 단위로 투입하면 큰 폭발과 함께 지상 유닛을 위한 길을 열어줍니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="wallBreak.do" method="post">
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
                                                    <img src="images/bootstrap/마법사1.PNG" alt="...">
                                                </div>
                                            </td>
                                            <td class="td-name">
                                               	 마법사
                                            </td>
                                            <td>
                                                	전장의 마법사란 매우 무서운 존재입니다. 동료들과 함께 투입하면 지상과 공중을 가리지 않고 마법을 날려 집중포화가 무엇인지 보여줍니다.
                                            </td>
                                            <td class="td-number"></td>
                                            <td class="td-actions">
                                            <form action="wizard.do" method="post">
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