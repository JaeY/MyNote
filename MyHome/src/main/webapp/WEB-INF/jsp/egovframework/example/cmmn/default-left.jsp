<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

var ajaxCl = {
		
		ajaxCallFn : function(options) {
			
			var that = this;
			
			var settings = {
					url : "mainMenuList.do",
					FCGubun : "F",
					
			}
			
			settings = $.extend({}, settings, options);
							
			$.ajax({

				type : "POST",
				url : settings.url,				
				async : false, 
				beforeSend : function(xhr) {
					
				},
				success    : function(result) {
	                   
	                var jsonRes = JSON.parse(result); // json스트링을 json으로 파싱
	                
	                // i는 0,1,2,3,4... item에는 한 row
	                $.each(jsonRes, function (i, item) {
	                	
	                	if(item.collapseYn == 'Y') {
	                	    
	                          var strSubMenu = "";
	                          
	                          //서브메뉴 가져오기
	                          strSubMenu = that.ajaxSubCallFn({url: "subMenuList.do", FCGubun: "C", menuId: item.menuId});
	                          
	                          //1depth에 하위메뉴가 있는 케이스
	                          var strMenu2 = "";
	                          
	                          strMenu2 += '<li prop="menu">'
	                                     + '<a data-toggle="collapse" href="#' +  item.menuUrl + '">'
	                                        + '<i class="' + item.menuClass + '"></i>'
	                                        + '<p>' + item.menuNm 
	                                           + '<b class="caret"></b>'
	                                        + '</p>'
	                                     + '</a>'
	                                     + '<div class="collapse" id="'+item.menuUrl+'">'
	                                        + '<ul class="nav" id="subMenu' + item.menuId +'">'
	                                           + strSubMenu
	                                          + '</ul>'
	                                     + '</div>'
	                                    + '</li>';
	                                                  
	                           $("#targetMenu").append(strMenu2);
	                		
	                	} else {
	                		var strMenu = "";
		                	
		                	strMenu += '<li prop="menu" class="active" id="menu' + item.menuId + '">'
	                       				 + '<a href="#" onclick="javascript:left.pageSubmitFn(\'menu' + item.menuId + '\',\'' + item.menuUrl + '\')">'
	                        					+ '<i class="' + item.menuClass + '"></i>'
			               					 	+ '<p>' + item.menuNm + '</p>'
			               				 + '</a>'
			                		+ '</li>';
			                            
			             $("#targetMenu").append(strMenu);
			             
	                	}	                		                		                		                		              	                	
	                });
                },
				error : function() {
					alert("main menu조회시 error 발생");
				}
			});		
		},
		
		ajaxSubCallFn : function(options) {

			var settings = {

				url : "mainMenuList.do",
				FCGubun : "F",
				menuId: ""
			}

			settings = $.extend({}, settings, options);

			var subMenu = "";

			$.ajax({

			        type       : "POST",
			        url        : settings.url,
			        data	   : {"menuId" : settings.menuId},
			        async      : false,
			        beforeSend : function(xhr) {        

			        },
			        success    : function(result) {
			        	   var jsonRes = JSON.parse(result); 
			        	   
			        	   $.each(jsonRes, function (i, item) {
			                	subMenu += '<li id="menu' + item.menuId + '">'
			                  				 + '<a href="#" onclick="javascript:left.pageSubmitFn(\'menu' + item.menuId + '\',\'' + item.menuUrl + '\')">'
				             					+ item.menuNm
				            				 + '</a>'
		             					 + '</li>';
			                	
			        	   });
			        },
			        error      : function() {
			        
			        	alert("sub menu 조회시 Error 발생");
			        }
			    }); 
			
				return subMenu;
			}
		
}

var left = 
{		
	// 4.01
	findMainMenuFn : function() {
		ajaxCl.ajaxCallFn({url: "mainMenuList.do", FCGubun: "F"});	
	},
	
	pageSubmitFn : function(pageName, action) {

		$("#pageName").val(pageName);       // menu id
		
		if(pageName == "serverSideMenu") {
			
			$("#frm").attr("action", "serverSide.do");	
		} else if(pageName == "egovLoginUsr") {
            
            $("#frm").attr("action", "egovLoginUsr.do");   
        }else if(pageName == "logout") {
            
            $("#frm").attr("action", "logoutGo.do");   
        }else if(pageName == "control") {
            
            $("#frm").attr("action", "jqgridUID.do");   
        }
		
		
		$("#frm").attr("action", action);	// action url 
		$("#frm").submit();
	}
	

}

var left2 = 
{
	pageSubmitFn : function(pageName) {
		$("#pageName").val(pageName);

		$("#frm").attr("action", pageName + ".do");
		
		$("#frm").submit();
	}
}

$(document).ready(function() {	
	
	//4.01
	left.findMainMenuFn();

	var pageName = "<c:out value="${param.pageName}"/>";
	
	$("[prop=menu]").removeClass("active");
	
	$("#"+pageName).addClass("active");
	
	// 4.01
    $("#"+pageName).closest(".collapse").addClass('in');
	$("#"+pageName).closest(".collapse").addClass('aria-expanded', 'true');
 	
});
</script>

<form id="frm" name="frm">
	<input type="hidden" id="pageName"  name="pageName" />
</form>

<div class="sidebar" data-color="orange" data-image="images/bootstrap/full-screen-image-3.jpg">
	<div class="logo">
        <a href="#" class="logo-text">
            HOME
        </a>
    </div>
	<div class="logo logo-mini">
		<a href="#" class="logo-text">
			Ct
		</a>
	</div>
    <div class="sidebar-wrapper">
        <div class="user">
            <div class="photo">
                <img src="images/bootstrap/mainlogo.jpg" />
            </div>
            <div class="info">
                <a data-toggle="collapse" href="#collapseExample" class="collapsed">
                    MY
                    <b class="caret"></b>
                </a>
                <div class="collapse" id="collapseExample">
                    <ul class="nav">
                        <li><a href="#">My Profile</a></li>
                        <li><a href="#">Edit Profile</a></li>
                        <li><a href="#">Settings</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <ul class="nav" id="targetMenu">
            <!-- <li prop="menu" class="active" id="mainMenu">
                <a href="#" onclick="javascript:left.pageSubmitFn('mainMenu')">
                    <i class="pe-7s-graph"></i>
                    <p>HOME</p>
                </a>
            </li>
            <li>
                <a data-toggle="collapse" href="#componentsExamples"  aria-expanded="false">
                    <i class="pe-7s-plugin"></i>
                    <p>11주차 에요~
                       	<b class="caret"></b>
                    </p>
                </a>
                <div class="collapse in" id="componentsExamples">
                    <ul class="nav">
                        <li prop="menu" class="active" id="welcomeWebMenu">
                        	<a href="#" onclick="javascript:left.pageSubmitFn('welcomeWebMenu')">시작해봅시다.</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <a data-toggle="collapse" href="#componentsExamples2"  aria-expanded="false">
                    <i class="pe-7s-gift"></i>
                    <p>부모자식 셀렉트박스
                       	<b class="caret"></b>
                    </p>
                </a>
                <div class="collapse" id="componentsExamples2">
                    <ul class="nav">
                        <li prop="menu" class="active" id="selectBoxMenu">
                        	<a href="#" onclick="javascript:left.pageSubmitFn('selectBoxMenu')">부모자식셀렉트</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <a data-toggle="collapse" href="#componentsExamples3"  aria-expanded="false">
                    <i class="pe-7s-note2"></i>
                    <p>레프트메뉴를 시작해봐요
                       	<b class="caret"></b>
                    </p>
                </a>
                <div class="collapse" id="componentsExamples3">
                    <ul class="nav">
                        <li prop="menu" class="active" id="left1">
                        	<a href="#" onclick="javascript:left.pageSubmitFn('left1')">left1</a>
                        </li>
                        <li prop="menu" class="active" id="left2">
                        	<a href="#" onclick="javascript:left.pageSubmitFn('left2')">left2</a>
                        </li>
                        <li prop="menu" class="active" id="left3">
                        	<a href="#" onclick="javascript:left.pageSubmitFn('left3')">left3</a>
                        </li>
                    </ul>
                </div>
            </li> -->
        </ul>
	</div>
</div>