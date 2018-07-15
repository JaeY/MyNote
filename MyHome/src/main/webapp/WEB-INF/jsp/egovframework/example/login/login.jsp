<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
	<meta name="viewport" content="width=device-width" />
	
	<link rel="icon" type="image/png" href="images/bootstrap/favicon.ico">
	
	<!-- Bootstrap core CSS     -->
	<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	
	<!--  Light Bootstrap Dashboard core CSS    -->
	<link href="css/bootstrap/light-bootstrap-dashboard.css" rel="stylesheet"/>
	
	<!--  CSS for Demo Purpose, don't include it in your project     -->
	<link href="css/bootstrap/demo.css" rel="stylesheet" />

	<!--     Fonts and icons     -->
	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
	<link href="css/bootstrap/pe-icon-7-stroke.css" rel="stylesheet" />	
	
	<title>로그인</title>
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
            <a class="navbar-brand" href="../dashboard.html">클래시오브클랜 포럼!!</a>
        </div>
        <div class="collapse navbar-collapse">       
            <ul class="nav navbar-nav navbar-right">
                <li>
                     
                     <a href="serverSide.do">
                        회원가입
                    </a>
                    
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="wrapper wrapper-full-page">
    <div class="full-page login-page" data-color="orange" data-image="images/bootstrap/full-screen-image-1.jpg">  
    <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <div class="container">
                <div class="row">                   
                    <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                    	<form name="loginForm" action ="<c:url value='actionLogin.do'/>" method="post">
	                        <!--   if you want to have the card without animation please remove the ".card-hidden" class   -->
	                        <div class="card card-hidden">
	                            <div class="header text-center">로그인</div>
	                            <div class="content">
	                                <div class="form-group">
	                                    <label>아이디</label>
	                                    <input type="text" name="id" id="id" placeholder="아이디를 입력하세요." class="form-control" maxlength="10">
	                                </div>
	                                <div class="form-group">
	                                    <label>비밀번호</label>
	                                    <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요." class="form-control" />
	                                </div>                                    
	                                <div class="form-group">
	                                    <label class="checkbox">
	                                        <input type="checkbox" name="checkId" id="checkId" onClick="javascript:saveid(document.loginForm);" data-toggle="checkbox">
	                                        아이디 저장
	                                    </label>    
	                                </div>
	                                
	                                
	                                
	                                <div class="form-group">
	                                	<label for="captcha" style="display:block;">자동 로그인 방지</label>
	                                	<div class="captcha">
	                                		<div class="form-group">
	                                			<img id="captchaImg" title="캡차 이미지" src="captchaImg.do" alt="캡차 이미지" />
	                                			<div id="captchaAudio" style="display:none;"></div>
	                                		</div>
	                                		<div class="form-group">
	                                			<a onclick="javascript:refreshBtn()" class="refreshBtn">
	                                				<input type="button" value="새로고침" />
	                                			</a>
	                                			<a onclick="javascript:audio()" class="refreshBtn">
	                                				<input type="button" value="음성듣기" />
	                                			</a>
	                                		</div>
	                                		<div class="form-group">
	                                    		<input type="text" name="answer" id="answer"  class="form-control" />
	                                		</div>   
	                                	</div>
	                                </div>
	                                
	                                
	                                
	                            </div>
	                            <div class="footer text-center">
	                                <button type="submit" class="btn btn-fill btn-warning btn-wd">로그인</button>
	                            </div>
	                        </div>
                        </form>
                    </div>                    
                </div>
            </div>
        </div>
    	<footer class="footer footer-transparent">
            <div class="container">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Company
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Portfolio
                            </a>
                        </li>
                        <li>
                            <a href="#">
                               Blog
                            </a>
                        </li>
                    </ul>
                </nav>
	            <p class="copyright pull-right">
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
	
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	
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
    
	function actionLogin() {
    	
        if (document.loginForm.id.value =="") {
        	
            alert("아이디를 입력하세요");
        } else if (document.loginForm.password.value =="") {
        	
            alert("비밀번호를 입력하세요");
        } else {
        	
            document.loginForm.action="<c:url value='actionLogin.do'/>";

            document.loginForm.submit();
        }
    }
    
	function saveid(form) {
    	
        var expdate = new Date();
        alert(form.checkId.checked);
        if(form.checkId.checked) {
        	
        	expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
        } else {
        	
        	expdate.setTime(expdate.getTime() - 1);
        }
        
        setCookie("saveid", form.id.value, expdate);
    }
	
	function setCookie(name, value, expires) {
    	
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expires.toGMTString();
	}
    
    function getid(form) {

        form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
    }
    
	function getCookie(name) {
		
        var search = name + "=";

        if (document.cookie.length > 0) {
        	
            offset = document.cookie.indexOf(search);

            if (offset != -1) {

                offset += search.length;

                end = document.cookie.length;

                return unescape(document.cookie.substring(offset, end));
            }
        }
        
        return "";
    }
    
   	$(document).ready(function() {
       
   		lbd.checkFullPageBackgroundImage();
           
       	setTimeout(function() {
       	
           	// after 1000 ms we add the class animated to the login/register card
           	$('.card').removeClass('card-hidden');
       	}, 700)
       	
       	getid(document.loginForm);
    });
   	
   	
   	function audio(){
   		var rand = Math.random();
   		var url = 'captchaAudio.do';
   		$.ajax({
   			url: url,
   			type: 'POST',
   			dataType: 'text',
   			data: 'rand=' + rand,
   			async: false,
   			success: function(resp) {
   				var uAgent = navigator.userAgent;
   				var soundUrl = 'captchaAudio.do?rand=' + rand;
   				
   				if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
   					winPlayer(soundUrl);
   				} else if (!!document.createElement('audio').canPlayType) {
   					try{
   						new Audio(soundUrl).play();
   					} catch(e) {
   						winPlayer(soundUrl);
   					}
   				}else {
   					window.open(soundUrl, '', 'width=1, height=1');
   				}
   			}	
   			
   		});
   		
   	}
   	
   	function refreshBtn(type){
   		var rand = Math.random();
   		var url = "captchaImg.do?rand=" + rand;
   		$('#captchaImg').attr("src", url);
   	}
   	function winPlayer(objUrl){
   		$('#captchaAudio').html('<vgsound src="' + objUrl + '">');
   	}
   	
   	
    </script>
</html>