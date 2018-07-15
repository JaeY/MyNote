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

var popRe = {
	
	btnClick : function() {

		var inputNotEmpty = true;

		var $inputObjs = $("#tbody1 input");

		inputNotEmpty = this.mandatoryCheckFn($inputObjs);

		if(!inputNotEmpty) {
			
			return false;
		}
		
		inputObjs = $("#indInfoProcUtakmnNm");

		inputNotEmpty = this.mandatoryCheckFn(inputObjs);

		if(!inputNotEmpty) {
			
			return false;
		}
		
		if($("#wrtmnUtakBizsCodeLast").is(":checked")) {
			
			if($("#wrtmnUtakEtcCntt").val() == "") {
				
				alert("기타 내용을 입력하세요.");
				
				return true;
			}
		}
		
		var $checkDlObj = $("#checkDl input.chk");
		var jsonCheckArray = new Array();
		
		var chkCount = 0;
		var arrayCount = 0;
		
		$checkDlObj.each(function(index) {
			
			var chk = $(this).is(":checked");

			if(chk) {
				
				jsonCheckArray[arrayCount] = $(this).val();
				
				arrayCount++;
				chkCount ++;
			}
		});
		
		if(chkCount == 0) {
			
			alert("설문 체크박스는 필수입니다.");
			
			return true;
		}
		
		var jsonArray = new Array();
		var jsonObjEduMgt = {};
		
		jsonObjEduMgt.wrtmnUtakBizsCode 	= jsonCheckArray;
		jsonObjEduMgt.eduDate				= "<c:out value="${nowDate}"/>";
		jsonObjEduMgt.eduTrgDivCode			= "<c:out value="${trgKey}"/>";
		jsonObjEduMgt.eduCntt				= $("#eduCntt").text();
	
		jsonObjEduMgt.mngrPstNm				= $("#mngrPstNm").val();
		jsonObjEduMgt.mngrPstnNm			= $("#mngrPstnNm").val();
		jsonObjEduMgt.mngrNm				= $("#mngrNm").val();
		jsonObjEduMgt.utakmnPstNm			= $("#utakmnPstNm").val();
		jsonObjEduMgt.utakmnPstnNm			= $("#utakmnPstnNm").val();
		jsonObjEduMgt.utakmnNm				= $("#utakmnNm").val();
		jsonObjEduMgt.wrtmnPstNm			= $("#wrtmnPstNm").val();
		jsonObjEduMgt.wrtmnPstnNm			= $("#wrtmnPstnNm").val();
		jsonObjEduMgt.wrtmnNm				= $("#wrtmnNm").val();
		jsonObjEduMgt.emplPnumCnt			= $("#emplPnumCnt").val();
		jsonObjEduMgt.indInfoProcPnumCnt	= $("#indInfoProcPnumCnt").val();
		jsonObjEduMgt.indInfoProcUtakmnNm	= $("#indInfoProcUtakmnNm").val();
		jsonObjEduMgt.etcPplSbjtCntt		= $("#etcPplSbjtCntt").val();
		jsonObjEduMgt.wrtmnUtakEtcCntt		= $("#wrtmnUtakEtcCntt").val();
		
		for(var i = 0; i < $("[name=qustListCount]").length; i++) {
			
			var jsonObj = {};
			var nameCount = i+1;

			if($("[name=rdotit1_"+nameCount+"]:checked").val() == undefined) {
				
				alert("설문문항은 필수입니다.");
				
				inputNotEmpty = false;
				
				return false;
			}

			jsonObj.qustCodeNm 	= $("[name=rdotit1_"+nameCount+"]:checked").val();
			jsonObj.qustCode 	= $("[name=hdCmbnCode"+nameCount+"]").val();

			jsonArray[i] = jsonObj;
		}
		
		this.save(jsonArray, jsonObjEduMgt);
	},
	
	mandatoryCheckFn : function(obj) {
		
		var inputNotEmpty = true;
		var focus;
			
		obj.each(function(index) {

			if($(this).val() == "") {
				
				focus = $(this);
				
				inputNotEmpty = false;
				
				alert($(this).attr('title') + "은(는) 필수 입력사항입니다.");
				
				focus.focus();
				
				return false;
			}
		});
			
		return inputNotEmpty;
	},
	
	save : function(jsonArray, jsonObjEduMgt) {
		
		$.ajax({
			
			type       	: "POST"
		   ,url        	: "checkRadioSave.do"
		   ,dataType   	: "json"
		   ,data       	: {
			   				"qustList" : JSON.stringify(jsonArray), 
							"mainInfo":JSON.stringify(jsonObjEduMgt),
							"signTrgNo":"<c:out value="${param.signTrgNo}"/>"
							}
		   ,async      	: false
	       ,success   	: function(result){
			
	    	   if(result.result) {

	    		   alert("저장이 완료되었습니다.");
	   			
	   				window.opener.returnFn();
	   			
	   				self.close();
	    		}
	       }
	    });
	}
}

$(document).ready(function(){	

	$("#emplPnumCnt").numeric("positiveInteger");
	$("#indInfoProcPnumCnt").numeric("positiveInteger");
});
</script>
<body>
<form id="ckFrm" name="ckFrm">

</form>
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
                        <th scope="row" rowspan="2">사용 스킬</th>
                        <td rowspan="2" id="eduCntt">체크박스,<br />라디오버튼</td>
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
                        <td><input type="text" id="mngrPstNm" 	class="txt" maxlength="100" title="학생 책임자 소속"/></td>
                        <td><input type="text" id="mngrPstnNm" 	class="txt" maxlength="100" title="학생 책임자 직위"/></td>
                        <td><input type="text" id="mngrNm" 		class="txt" maxlength="100" title="학생 책임자 성명"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt2">직업</label></th>
                        <td><input type="text" id="utakmnPstNm" 	class="txt" maxlength="100" title="취준생 담당자 소속"/></td>
                        <td><input type="text" id="utakmnPstnNm" 	class="txt" maxlength="100" title="취준생 담당자 직위"/></td>
                        <td><input type="text" id="utakmnNm" 		class="txt" maxlength="100" title="취준생 담당자 성명"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt3">게임 기간</label></th>
                        <td><input type="text" id="wrtmnPstNm" 		class="txt" maxlength="100" title="개발자 작성자 소속"/></td>
                        <td><input type="text" id="wrtmnPstnNm" 	class="txt" maxlength="100" title="개발자 작성자 직위"/></td>
                        <td><input type="text" id="wrtmnNm" 		class="txt" maxlength="100" title="개발자 작성자 성명"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt4">나이</label></th>
                        <td><input type="text" id="emplPnumCnt" class="txt" maxlength="8" title="나이"/></td>
                        <th scope="row"><label for="txt5">1+1은?</label></th>
                        <td><input type="text" id="indInfoProcPnumCnt" class="txt" maxlength="8" title="1+1은?"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="txt6">기타 사항<br />(기타 사항)</label></th>
                        <td colspan="3" class="lt">
                            <textarea rows="3" cols="100" id="indInfoProcUtakmnNm" title="기타 사항"></textarea>
                            <p class="txt01">* 기타 사항</p>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="tit02">
                <h2>2.설문조사</h2>
                <dl id="checkDl">
                    <dt>* 설문을 작성하신 분은 체크박스를 눌러주세요</dt>
                    <c:forEach items="${bizList}" var="bizList" varStatus="status">
                    	<c:choose>
                    		<c:when test="${status.last}">
                    			<dd>
			                        <input type="checkbox" id="wrtmnUtakBizsCodeLast" 
			                        name="wrtmnUtakBizsCode" class="chk" 
			                        value="<c:out value="${bizList.cmbnCode}" />"/>
			                        <label>
			                        	<c:out value="${bizList.cmbnCodeNm}"/>
			                        	:(<input type="text" id="wrtmnUtakEtcCntt" class="txt" />)
			                        </label>
			                    </dd>
                    		</c:when>
                    		<c:otherwise>
								<dd>
			                        <input type="checkbox" name="wrtmnUtakBizsCode" 
			                        class="chk" value="<c:out value="${bizList.cmbnCode}"/>"/>
			                        <label><c:out value="${bizList.cmbnCodeNm}"/></label>
			                    </dd>
							</c:otherwise>
                    	</c:choose>
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
                    <c:forEach items="${qustList}" var="qustList" varStatus="status">
                		<tr>
	                        <td>${status.count}</td>
	                        <td class="lt"><label><c:out value="${qustList.cmbnCodeNm}"/></label></td>
	                        <td><input type="radio" name="rdotit1_${status.count}" class="rdo" value="1"/></td>
	                        <td><input type="radio" name="rdotit1_${status.count}" class="rdo" value="2"/></td>
	                        <td><input type="radio" name="rdotit1_${status.count}" class="rdo" value="3"/></td>
	                        <td><input type="radio" name="rdotit1_${status.count}" class="rdo" value="4"/></td>
	                        <td>
	                        	<input type="radio"  name="rdotit1_${status.count}" class="rdo" value="5" />
	                        	<input type="hidden" name="qustListCount" />
	                        	<input type="hidden" name="hdCmbnCode${status.count}" value="<c:out value='${qustList.cmbnCode}'/>"/>
	                        </td>
	                    </tr>
                	</c:forEach>
                	<tr>
                        <td colspan="7" class="form">
                            <label>기타 건의사항</label>
                            <div>
                            	<textarea rows="4" cols="120" id="etcPplSbjtCntt" maxlength="1000" title="기타 건의사항" ></textarea>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="popbtn">
            <a href="#" class="btn" onclick="javascript:popRe.btnClick();">저장하기</a>
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
