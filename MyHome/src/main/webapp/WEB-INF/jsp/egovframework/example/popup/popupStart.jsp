<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../cmmn/common_lib.jsp" %>

<script type="text/javascript">

function returnFn() {
	
	alert("다시 접속하셔서 설문조사 결과를 확인해주세요.");
}

$(document).ready(function() {
	
	$("#defaultBtId").click(function() {
		
		var params  = "?signTrgNo=test";
		var url = "partnerEduVideo.do";
		var opt = "width=650,height=400";
		
		window.open(url+params, "", opt);
	});
});

</script>
<form id="frmContent" >

</form>
<div class="row">
	<div class="content buttons-with-margin">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="header">
                                    <h4 class="title">설문조사에 참여해주세요</h4>
                                </div>
                                <div class="content" id="doksurio">
                                    <button class="btn btn-default btn-fill btn-wd" id="defaultBtId">시작</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>