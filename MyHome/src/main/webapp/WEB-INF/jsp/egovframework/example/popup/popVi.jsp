<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../cmmn/common_lib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>설문조사</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" type="text/css" href="css/popup/popup.css" />
	
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>  
	<script type="text/javascript" src="js/json2.js"></script>
	<script type="text/javascript" src="js/jquery.alphanum.js"></script>
</head>
<script type="text/javascript">

var popVi = {
		
	btnClick : function() {
		
		window.opener.returnFn();
			
		self.close();	
	}
}
$(document).ready(function(){	
	
	$(".chk").attr("disabled", true);
	$(".rdo").attr("disabled", true);
});
</script>
<body>
    <div class="pop_wrapper">
        <div class="popcont">
            <h1>설문조사</h1>

            <table class="tbl_type01">
                <caption>설문조사</caption>
                <colgroup>
                    <col width="16%" />
                    <col width="34%" />
                    <col width="16%" />
                    <col width="34%" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">사이트명</th>
                        <td><c:out value="${userMap.clcoNm}"/></td>
                        <th scope="row">대상구분</th>
                        <td><c:out value="${trgValue}"/></td>
                    </tr>
                    <tr>
                        <th scope="row">대표자</th>
                        <td><c:out value="${userMap.userNm}"/></td>
                        <th scope="row" rowspan="2">사용스킬</th>
                        <td rowspan="2" id="eduCntt">체크박스,<br /> 라디오버튼</td>
                    </tr>
                    <tr>
                        <th scope="row">설문일자</th>
                        <td><c:out value="${sDate}"/></td>
                    </tr>
                </tbody>
            </table>

            <div class="tit01">
                <h2>1.회원의 coc</h2>
                <span class="btn_info">도움말</span>
                <!-- 도움말 레이어 -->
                <div class="infobox">
                    <div class="boxin">
                        <div class="cont">
                            <h3>화면 개발 설명</h3>
                            <ul>
                                <li>교육대상 위 내용은 화면이 뜨자마자 테이블1에서 읽어와야하며 JSTL 사용 </li>
                                <li>교육대상항목 필수</li>
                                <li>체크박스 필수아님</li>
                                <li>기타를 체크시 기타내용 필수 아님</li>
                                <li>기타에 내용을 적고 다른 체크박스 클릭시 내용 초기화<br />
                                <span>ex) 기타에 욕을 쓰지 마시오</span></li>
                                <li>라디오버튼 필수, 건의사항 필수 아님</li>
                                <li>체크박스는 DB에서 가져오기때문에 유동적으로 늘어남</li>
                                <li>라디오버튼은 DB에서 가져오기때문에 유동적으로 늘어남</li>
                                <li>여러분의 고민, 기타 건의 사항 최대 1000자 제한</li>
                                <li>나이, 1+1항목 숫자만 적게</li>
                                <li>저장 후 메시지 호출 하고 저장한 결과값을 보여주는 화면 호출</li>
                            </ul>
                            <div class="popbtn">
                                <a href="#none" class="btn">닫기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //도움말 레이어 -->
            </div>
            <table class="tbl_type02">
                <caption>설문조사</caption>
                <colgroup>
                    <col width="16%" />
                    <col width="34%" />
                    <col width="16%" />
                    <col width="34%" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">구분</th>
                        <th scope="col">정보</th>
                        <th scope="col">비고</th>
                        <th scope="col">비고</th>
                    </tr>
                </thead>
                <tbody id="tbody1">
                    <tr>
                        <th scope="row"><label for="txt1">이름</label></th>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.mngrPstNm}"/></td>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.mngrPstnNm}"/></td>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.mngrNm}"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt2">직업</label></th>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.utakmnPstNm}"/></td>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.utakmnPstnNm}"/></td>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.utakmnNm}"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt3">게임 기간</label></th>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.wrtmnPstNm}"/></td>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.wrtmnPstnNm}"/></td>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.wrtmnNm}"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt4">나이</label></th>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.emplPnumCnt}"/></td>
                        <th scope="row"><label for="txt5">1+1은?</label></th>
                        <td><c:out value="${tsmIndInfoEduMgtInfo.indInfoProcPnumCnt}"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt6">가타 사항<br />(기타 사항)</label></th>
                        <td colspan="3" class="lt">
                            <c:out value="${tsmIndInfoEduMgtInfo.indInfoProcUtakmnNm}"/>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="tit02">
                <h2>2.설문조사</h2>
                <dl id="checkDl">
                    <dt>* 설문을 작성하신 분은 체크박스를 눌러주세요</dt>
                    
                    <c:forEach items="${bizList}" var="bizList" varStatus="status">
                 		<dd>
                 			<c:choose>
                 				<c:when test="${bizList.checked eq 'checked'}">
                 					<input type="checkbox" class="chk" checked = "checked"/>
                 					<label for="chktit${status.index}">
                 						<c:out value="${bizList.cmbnCodeNm}"/>
               							<c:if test="${status.last}">
               								:(<c:out value="${tsmIndInfoEduMgtInfo.wrtmnUtakEtcCntt}"/>)
               							</c:if>
                 					</label>
                 				</c:when>
                 				<c:otherwise>
                 					<input type="checkbox" class="chk"/>
                 					<label for="chktit${status.index}">
                 						<c:out value="${bizList.cmbnCodeNm}"/>
                 						<c:if test="${status.last}">
                 							:(&nbsp;)
                 						</c:if>
                 					</label>
                 				</c:otherwise>
                 			</c:choose>	
                    	</dd>                    	
                    </c:forEach>
                </dl>
            </div>
            <table class="tbl_type02 tbl_chk">
                <caption>이 새미나가 당신에게 얼마나 유용했는가!</caption>
                <colgroup>
                    <col width="7%" />
                    <col width="58%" />
                    <col width="7%" />
                    <col width="7%" />
                    <col width="7%" />
                    <col width="7%" />
                    <col width="7%" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">설문 문항</th>
                        <th scope="col" class="np"><span>매우<br />아니다</span>(1점)</th>
                        <th scope="col" class="np"><span>아니다</span>(2점)</th>
                        <th scope="col" class="np"><span class="one">보통</span>(3점)</th>
                        <th scope="col" class="np"><span class="one">그렇다</span>(4점)</th>
                        <th scope="col" class="np"><span class="one">매우<br />그렇다</span>(5점)</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${tsmIndInfoEduDtlList}" var="tsmIndInfoEduDtlList" varStatus="status">
                		<tr>
	                        <td>${status.count}</td>
	                        <td class="lt"><label for="chktit1"><c:out value="${tsmIndInfoEduDtlList.cmbnCodeNm}"/></label></td>
	                        <td>
	                        	<input type="radio" class="rdo" value="1" disabled 
	                        	<c:if test="${tsmIndInfoEduDtlList.indInfoQustScor == '1'}">checked="checked"</c:if>/>
	                        </td>
	                        <td>
	                        	<input type="radio" class="rdo" value="2" disabled 
	                        	<c:if test="${tsmIndInfoEduDtlList.indInfoQustScor == '2'}">checked="checked"</c:if>/>
	                        </td>
	                        <td>
	                        	<input type="radio" class="rdo" value="3" disabled 
	                        	<c:if test="${tsmIndInfoEduDtlList.indInfoQustScor == '3'}">checked="checked"</c:if>/>
	                        </td>
	                        <td>
	                        	<input type="radio" class="rdo" value="4" disabled 
	                        	<c:if test="${tsmIndInfoEduDtlList.indInfoQustScor == '4'}">checked="checked"</c:if>/>
	                        </td>
	                        <td>
	                        	<input type="radio" class="rdo" value="5" disabled 
	                        	<c:if test="${tsmIndInfoEduDtlList.indInfoQustScor == '5'}">checked="checked"</c:if>/>
	                        </td>
	                    </tr>
                	</c:forEach>
                    
                    <tr>
                        <td colspan="7" class="form">
                            <label for="chktit10">기타 건의사항</label>
                            <div><c:out value="${tsmIndInfoEduMgtInfo.etcPplSbjtCntt}"/></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="popbtn">
            <a href="#" class="btn" onclick="javascript:popVi.btnClick();">닫기</a>
        </div>
    </div>
    <script type="text/javascript">
        $(function(){
            $(".pop_wrapper .btn_info").click(function(){
                if($(this).next(".infobox").css("display") == "none"){
                    $(".pop_wrapper .infobox").show();
                } else {
                    $(".pop_wrapper .infobox").hide();
                }
                return false;
            });
            $(".pop_wrapper .infobox .btn").click(function(){
                $(".pop_wrapper .infobox").hide();
                return false;
            });
        });
    </script>
</body>
</html>
