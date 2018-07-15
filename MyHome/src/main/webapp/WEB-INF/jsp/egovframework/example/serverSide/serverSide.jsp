<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	
	<link rel="icon" type="image/png" href="images/bootstrap/favicon.ico">
	
	<!-- Bootstrap core CSS     -->
	<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	
	<!--  Light Bootstrap Dashboard core CSS    -->
	<link href="css/bootstrap/light-bootstrap-dashboard.css" rel="stylesheet"/>
	
	<!--  CSS for Demo Purpose, don't include it in your project     -->
	<link href="css/bootstrap/demo.css" rel="stylesheet" />

	<!--     Fonts and icons     -->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">

	<link href="css/bootstrap/pe-icon-7-stroke.css" rel="stylesheet" />

	<title>회원가입</title>
</head>
<body>
<nav class="navbar navbar-transparent navbar-absolute">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li>
                   <a href="egovLoginUsr.do">
                        로그인
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="wrapper wrapper-full-page">
	<div class="full-page register-page" data-color="orange" data-image="images/bootstrap/full-screen-image-2.jpg">
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
                        <div class="header-text">
                            <h2>회원가입을 해주세요.</h2>
                            <h4>클래시오브클랜 포럼</h4>
                            <hr />
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-2">
                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-user"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>회원가입 하는곳</h4>
                                이름과 아이디를 적으시고 이름과 아이디를 적으시되 이름과 아이디는 적으세요.
                            </div>
                        </div>

                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-graph1"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>비밀번호 규칙</h4>
                                비밀번호는 자유롭게 4자리 이상으로 적어주시고 특수문자는 빼주세요. 같은번호를 반복해서 쓰거나 자신의
                                생년월일을 비번으로 하지마세요~
                            </div>
                        </div>
                    </div>
                    <form:form commandName="serverSideVO"> <!-- serverSideVO라는 인스턴스를 만든것이다 -->
                    <div class="col-md-4 col-md-offset-s1">
                        <div class="card card-plain">
                            <div class="content">
                             	<div class="form-group">
                             	<!-- input도 form태그 input으로 가져가야 한다. path속성의 값을 읽고 VO의 setter메서드를 탄다 -->
                                    <form:input path="mberId" type="text" title="아이디" placeholder="아이디" class="form-control" maxlength="20" />
                                	<form:errors path="mberId"/> <!-- 벨리데이션에 걸렸을 경우 이 부분에 메시지를 뿌려준다. -->
                                </div>
                                <div class="form-group">
                                   	<form:input path="mberNm" type="text" title="이름" placeholder="이름" class="form-control" maxlength="20" />
                                	<form:errors path="mberNm"/> <!-- 벨리데이션에 걸렸을 경우 이 부분에 메시지를 뿌려준다. -->
                                </div>
                                <div class="form-group">
                                    <form:input path="password" type="text" title="비밀번호" placeholder="비밀번호" class="form-control" maxlength="20" />
                                </div>
                                <div class="form-group">
                                    <form:input path="passwordCheck" type="text" title="비밀번호확인" placeholder="비밀번호확인" class="form-control" maxlength="20" />
                                </div>
                            </div>
                            <div class="footer text-center">
                                <button type="submit" class="btn btn-fill btn-warning btn-wd" onclick="javascript:fnSbscrb()">회원가입</button>
                            </div>
                        </div>
                    </div>
                    </form:form>
				</div>
			</div>
		</div>
		<footer class="footer footer-transparent">
            <div class="container">
                <p class="copyright text-center">
                    &copy; 2017 <a href="#">김재연</a>, 010-7445-1549
                </p>
            </div>
        </footer>
	</div>
</div>
</body>
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="js/bootstrap/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/bootstrap/bootstrap.min.js" type="text/javascript"></script>

<!--  Forms Validations Plugin -->
<script src="js/bootstrap/jquery.validate.min.js"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="js/bootstrap/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->
<script src="js/bootstrap/bootstrap-datetimepicker.js"></script>

<!--  Select Picker Plugin -->
<script src="js/bootstrap/bootstrap-selectpicker.js"></script>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="js/bootstrap/bootstrap-checkbox-radio-switch-tags.js"></script>

<!--  Charts Plugin -->
<script src="js/bootstrap/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="js/bootstrap/bootstrap-notify.js"></script>

<!-- Sweet Alert 2 plugin -->
<script src="js/bootstrap/sweetalert2.js"></script>

<!-- Vector Map plugin -->
<script src="js/bootstrap/jquery-jvectormap.js"></script>

<!-- Wizard Plugin    -->
<script src="js/bootstrap/jquery.bootstrap.wizard.min.js"></script>

<!--  Bootstrap Table Plugin    -->
<script src="js/bootstrap/bootstrap-table.js"></script>

<!--  Plugin for DataTables.net  -->
<script src="js/bootstrap/jquery.datatables.js"></script>

<!--  Full Calendar Plugin    -->
<script src="js/bootstrap/fullcalendar.min.js"></script>

<!-- Light Bootstrap Dashboard Core javascript and methods -->
<script src="js/bootstrap/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="js/bootstrap/demo.js"></script>
  
<script type="text/javascript">

function fnSbscrb() {
	$("#serverSideVO").attr("action", "serverSideCheck.do");
	$("#serverSideVO").submit();
}

	$(document).ready(function() {

		// light-bootstrap-dashboard.js 199line
		lbd.checkFullPageBackgroundImage();

        setTimeout(function(){
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 1000)
        
        
        var eSangMu = "";
        eSangMu = "<c:out value="${eSangMu}"/>";
        if(eSangMu == "Y") {
        	
        	$("#serverSideVO").attr("action", "serverSideInsert.do");
        	$("#serverSideVO").submit();
        	
        }
	});
</script>  
</html>