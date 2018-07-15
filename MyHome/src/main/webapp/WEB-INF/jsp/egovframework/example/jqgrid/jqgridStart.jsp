<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<link rel="stylesheet" type="text/css" href="jqGrid-master/themes/redmond/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="jqGrid-master/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="jqGrid-master/css/addons/ui.multiselect.css" />

<script type="text/javascript" src="jqGrid-master/jquery.js"></script>  
<script type="text/javascript" src="jqGrid-master/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="jqGrid-master/js/jquery.jqGrid.min.js"></script>

    <title>Hanq</title>
</head>
<script type="text/javascript">
$(document).ready(function() {

	var cnames = ['아이디','이름','전화번호','주소','기타','성별코드'];

       $("#jqGrid").jqGrid({
         url: "jqgridStartMain.do",
         datatype: "local",
         colNames: cnames,
         colModel:[
         {name:'seq',index:'seq', width:55, key:true, align:"center"},
         {name:'name',index:'name', width:100, align:"center"},
         {name:'phone',index:'phone', width:100},
         {name:'address',index:'address', width:100},
         {name:'etcc',index:'etcc', width:100},
         {name:'gender',index:'gender',     width:100}
   		],
           height: 480,
           rowNum: 10,
           rowList: [10,20,30],
           pager: '#jqGridPager',
           rownumbers  : true,                     
           ondblClickRow : function(rowId, iRow, iCol, e) {

   			if(iCol == 1) {             

             alert(rowId+" 째줄 입니다.");
             }
           },
       
           viewrecords : true,
           caption:"실습용 테이블"
       });
   });
   
function goSearch() {
	var jsonObj = {};
	
	if($("#selectId").val() != "C") {
		jsonObj.serviceImplYn = $("#selectId").val();
	}
	alert(JSON.stringify(jsonObj));
	
	$("#jqGrid").setGridParam({   //파라미터를 받아 .do로 간다.
        datatype : "json",      //이벤트가 일어나면 컨트롤러단으로 간다. 
        postData : {"param" : JSON.stringify(jsonObj)},   // 키와 밸류를 들고 간다.
        loadComplete: function(data){
              $.each(data, function(i, item) {
            	 if(i == "rows") {
            		 if(item < 1) {
            			 alert("데이터가 없습니다");
            		 }
            	 } 
              });
        },
        gridComplete : function(){
        	
        }
     }).trigger("reloadGrid");
}
</script>

<html>

<body>
   <div class="row">
      <div>
      	<select id="selectId">
      		<option value="">전체</option>
      		<option value="A">A</option>
      		<option value="B">B</option>
      		<option value="C">C</option>
      		<option value="D">D</option>
      	</select>
      		<span><a href="#" onclick="javascript:goSearch();">조회</a></span>
       </div>
       <div>
         <table id="jqGrid"></table>
         <div id="jqGridPager"></div>
       </div>
      </div>
jqgrid Start
</body>
</html>