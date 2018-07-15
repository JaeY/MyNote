<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<%@ include file="../cmmn/common_lib.jsp" %>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="js/jquery-confirm.js"></script>
<link rel="stylesheet" type="text/css" href="css/popup/jquery-confirm.min.css" />

<title>설문조사</title>
</head>
<body>
<script type="text/javascript">
var returnValueYN = "N";
var fiveSc = "";

var popPartnerEduVideo = {
	
	ddeng : "",
	confirmJs : "",
	sengSungJa : function() {

		$("#btnS").hide();

		fiveSc = setInterval(this.limitCount, 5000);
	},

	limitCount : function() {

		var that = this;
		
		clearInterval(fiveSc);
		
		if(returnValueYN == "N") {
			
			$("#btnS").show();
			
			returnValueYN = "Y";
		}
		
		this.ddeng = setTimeout(function(){
			
	    	that.confirmJs.close();
	    	
			window.close();
		}, 5000);

		this.confirmJs = $.confirm({

			title : "잔인한 시험",
			content : "나 보고 있어?",
			buttons : {
				
				그럼: {
					action : function() {
						
						clearTimeout(that.ddeng);
						
						fiveSc = setInterval(popPartnerEduVideo.limitCount, 5000);
					}
				},
				
				한눈팔아 : {
					action : function() {
						
						that.confirmJs.close();
						
						window.close();
					}

				}
			}

		});
		
		this.confirmJs.open();
	}
}

$(document).ready(function(){
	
	popPartnerEduVideo.sengSungJa();
});

window.onbeforeunload = function(e) {

	if(returnValueYN == "N") {
	
		return "※ 영상을 끝까지 보신 후 개인정보보호 교육확인서를 작성해주셔야 교육이 완료됩니다. 종료하시겠습니까?";	
	}
};

function buttonGo() {
	
	clearInterval(fiveSc);
	
	var url = "";

	if("<c:out value="${clcoStatDivCode}"/>" == "10") {
		
		url   = "popRe.do";
	} else {
		
		url   = "popVi.do";
	}
	
	var params  = "?signTrgNo=<c:out value="${params.signTrgNo}"/>";
	
	var opt = "width=950,height=1280,scrollbars=yes";

	window.open(url+params, "", opt);
}

function returnFn() {
	
	window.opener.returnFn();
		
	self.close();
}

</script>
<div>
	<iframe width="640" height="360" src="https://www.youtube.com/embed/d9IxdwEFk1c?autoplay=1" frameborder="0"></iframe>
	<input type="button" id="btnS" onclick="buttonGo()" value="설문조사 확인서" />
</div>
</body>
</html>