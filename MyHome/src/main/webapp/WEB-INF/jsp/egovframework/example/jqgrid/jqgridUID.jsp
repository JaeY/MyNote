<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
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
	
	jqgridTable.init();
});

var CommonJsUtil = 
{
    isEmpty : function(val) {
     	
        if(null == val || null === val || "" == val || val == undefined || typeof(val) == undefined || "undefined" == val || "NaN" == val) {
         	
            return true;
        } else {
         	
            return false;
        }
    },
    
    isNumeric : function(val) {

    	if (/[^0-9]/.test(val)) {
    		
            return false;
        } else {
        	
            return true;
        }
    }
}

/******************************************
 * jqgrid 
 ******************************************/
var jqgridTable = 
{
	init : function() {
		
		var cnames = ['번호','아이디','이름','주소','기타','성별코드','구분'];
		
	    $("#jqGrid").jqGrid({
	    	
	        url: "jqgridStartMain.do",
	        datatype: "local",
	        colNames: cnames,
	        colModel:[
	   	   		{name:'seq',		index:'seq', 		width:55, 	key:true, 		align:"center"},
	   	   		{name:'mberId',		index:'mberId', 		width:100, 					align:"center"},
	   	   		{name:'mberNm',		index:'mberNm', 		width:100, 	editable:true},
	   	   		{name:'phone',		index:'phone', 		width:100, 	editable:true},
	   	   		{name:'address',	index:'address', 	width:100, 	editable:true},
	   	   		{name:'gender',		index:'gender',     width:100,	editable:true, edittype: "select", formatter:"select",
		   	   		editoptions: {
	
	       	        	value		: {"1":"남자","2":"여자"}, 
	       	         	dataEvents 	: [{
	       	        		type: 'change',
	       	         		fn : function(e) {	
	       	            
	       	         		}
	       	         	}]
	       	   		}
	   	   		},
	   	   		//{name:'gender',		index:'gender', 	width:100, 	formatter:gridFunc.fnCellDispType},
	   	   		{name:'btn', 		index:'btn', 		width:100, 	formatter:gridFunc.rowBtn}
			],
	        height			: 480,
	        rowNum			: 10,
	        rowList			: [10,20,30],
	        pager			: '#jqGridPager',
	        cellEdit 		: true,
	        cellsubmit  	: "clientArray",
	        multiselect 	: true, 
	        rownumbers  	: true,      
	        onCellSelect : function(rowId, colId, val, e) {

	        	var seq = $("#jqGrid").getCell(rowId, 'seq');
	       	   	
		       	/* if(colId == 3) {
		       		
		       	   	if(!CommonJsUtil.isEmpty(seq)){

		       	   		$('#jqGrid').setColProp('name',{editable:false});
		       	   	}else{

		       	   		$('#jqGrid').setColProp('name',{editable:true});
		       	   	}
		       	} */
		       	
		       	for(var i = 3; i <= 7; i++) {
		       		
		        	if(colId == i) {
		        		
		        		if(!CommonJsUtil.isEmpty(seq)) {
		        			
		        			$('#jqGrid').setColProp('mberId', 	{editable:false});
		        			$("#jqGrid").setColProp("mberNm", 	{editable:false});
		        			$("#jqGrid").setColProp("phone", 	{editable:false});
		    				$("#jqGrid").setColProp("address", 	{editable:false});
		        			$('#jqGrid').setColProp('gender', 	{editable:false});
		        		} else {
		        			
		        			$('#jqGrid').setColProp('mberId', 	{editable:true});
		        			$("#jqGrid").setColProp("mberNm", 	{editable:true});
		        			$("#jqGrid").setColProp("phone", 	{editable:true});
		    				$("#jqGrid").setColProp("address", 	{editable:true});
		    				$('#jqGrid').setColProp('gender', 	{editable:true});
		        		}
		        	}
	        	}
       	 	},
       	 	
	        ondblClickRow : function(rowId, iRow, iCol, e) {

				if(iCol == 1) {
					
	          		alert(rowId+" 째줄 입니다.");
	          	}
	        },
	    
	        viewrecords : true,
	        caption:"실습용 테이블"
	    });
	    
	/* 	$("#jqGrid").jqGrid('setGroupHeaders', {
			
			useColSpanStyle : true,
			groupHeaders: [
			               {startColumnName: 'name', numberOfColumns: 3, titleText: '한큐헤더2'}
			               ]
		});

		$("#jqGrid").jqGrid('setGroupHeaders', {
			
			useColSpanStyle : true,
			groupHeaders: [
			               {startColumnName: 'phone', numberOfColumns: 2, titleText: '한큐헤더'}
			               ]
		}); */
		
		$('th[rowspan="2"]').attr('rowspan', 3);
	},
	
	goSearch : function() {
		
		var jsonObj = {};

		if($("#selectId").val() != "C") {
			
			jsonObj.serviceImplYn = $("#selectId").val();
		}
		
		$("#jqGrid").setGridParam({
			
	        datatype : "json",
	        postData : {"param" : JSON.stringify(jsonObj)},
	        loadComplete: function(data){
	        	
	        	$.each(data, function (i, item) { 

					if(i == "rows") {	
						
						if(item < 1) {							
				
							alert("데이터가 없습니다.");
						}
					}
	        	});
	        },
	    
	        gridComplete : function() {
		 		
	    	}
	    }).trigger("reloadGrid");
	},
	
	selectData : function(gubun) {
		
		var $input = $("#jqGrid input[type='text']");

		// input 박스 뒤에 input의 value를 추가하고, 부모(td)의 부모(tr)에 edited클래스 추가
		$input.after($input.val()).parent().parent().addClass("edited");
		
		$input.remove();
		
		var gubunText = gubun == 'save' ? '저장' : '삭제';	 
		
		var checkData = $("#jqGrid").getGridParam("selarrrow");

		if(checkData.length == 0) {
			
			alert(gubunText+"할 데이터를 선택하여 주십시오.");
			
			return;
		}
		
		// 실습
		if(gubun =='del') {
			
			for(var i = 0; i < checkData.length; i++) {
				
				var data = $("#jqGrid").getCell(checkData[i], "gender");
				
				if(data == "2") {
					
					alert("여성 데이터는 삭제할 수 없습니다. 다시 선택해 주시기 바랍니다.");				
				
					return;
				}
			} 
		}
		
		if (confirm("선택한 데이터를 "+gubunText+" 하시겠습니까?") == false) {
			
			return false;
		}
		
		var iCnt = 0;
		var jsonArray1 = new Array();

		for(var i = 0; i < checkData.length; i++) {
			
			var jsonObj = {};
			
			var seq = $("#jqGrid").getCell(checkData[i], "seq");
			
			var editType = "";
			
       	   	if(!CommonJsUtil.isEmpty(seq)) {
       	   		
       	   		editType = "D";
       	   	} else {
       	   		
       	   		editType = "I";
       	   	}
       	   	
			jsonObj.editType = editType;
			jsonObj.seq = seq;
			
			jsonObj.mberId = 		$("#jqGrid").getCell(checkData[i], "mberId");  
			jsonObj.mberNm = 		$("#jqGrid").getCell(checkData[i], "mberNm");
			jsonObj.phone = 	$("#jqGrid").getCell(checkData[i], "phone"); 
			jsonObj.address = 	$("#jqGrid").getCell(checkData[i], "address");
			jsonObj.gender = 	$("#jqGrid").getCell(checkData[i], "gender");
			
			jsonArray1[iCnt] = jsonObj;
			
			iCnt++;
		}
	
		var param1 = JSON.stringify(jsonArray1);
		
		return param1;
	},
	
	saveData : function() {
		
		// 저장 전 validation 체크
		if(!this.gridValid()) return false;
		
		var param1 = this.selectData('save');
		
		this.ajaxFn(param1, '저장');
	},
	
	deleteData : function() {
		
		var param1 = this.selectData('del');
		
		this.ajaxFn(param1, '삭제');
	},
	
	ajaxFn : function(param1, gubun) {

		$.ajax({
			
	        type       : "POST",
	        url        : "saveJqgrid.do",
	        data       : {"param1" : param1},
	        async      : false,
	        beforeSend : function(xhr) {
	        	
	            // 전송 전 Code
	        },
	        success    : function(result) {
	        	
	        	if(result == "SUCCESS") {
	        		
	        		alert("성공적으로 "+gubun+"하였습니다.");

	        		// 마지막페이지 삭제관련
	        		var lastPage = $("#jqGrid").getGridParam("lastpage");

	        		if(gubun == "삭제" && $("#jqGrid").getGridParam("reccount") == $("#jqGrid").getGridParam("selarrrow").length) {
	        				
	        			$("#jqGrid").setGridParam({
								
							page: lastPage-1
						}).trigger("reloadGrid");
	        		} else {
	        			
	        			jqgridTable.goSearch();
	        		}
	            }
	        },
	        error      : function() {
	        	
	        	alert("+gubun+"+"시 Error 발생");
	        }
	    });
	},
	
	gridValid : function() {
		
		var trObj = $("#jqGrid").find("tr");
		
		for(var i = 0; i < trObj.length; i++) {
 		   	
			var $this = $(trObj[i]);
			
 	    	if($this.hasClass("edited")) {
 	    		
 	    		var rowId = $this.prop("id");
 	    		var phone = $("#jqGrid").getCell(rowId, "phone");   
 	    		
				if(!CommonJsUtil.isNumeric(phone)) {
					
					alert(rowId+"째 행 전화번호는 숫자만 입력가능합니다.");
					
					return false;
					
					break;
 	    		}
 	    	}
 	    }
		
		return true;
	}
}

/******************************************
 * 그리드 관련 메소드
 ******************************************/
var gridFunc = 
{			
	//그리드 초기화
	clearGrid : function() {
		
		$("#jqGrid").clearGridData();
	},	
	
	/* fnCellDispType : function(cellVal, options, rowObj) {
		
		var strDisp = "";																							//셀렉트박스 ID              ROW ID              // DB 컬럼 ID 
			strDisp = "<select id='cbGender_"+options.rowId+"' onchange=javascript:gridFunc.cbGenderChange('cbGender_"+options.rowId+"','"+options.rowId+"','"+rowObj.id+"') >\n";	 
			
		for(i = 1; i < 3; i++) {
			
			var cellText = (i == 1)?'남자':'여자';
			var selected = (i == rowObj.gender)? 'selected="selected"':'';
			
			strDisp +="<option "+selected+" value='" + i + "'>" + cellText + "</option>";
		}
			
			strDisp +='</select>';
	    	return strDisp;
		
	}, */
	
	cbGenderChange : function(comboId, rowId, id) {
		
		var selectedVal = $("#"+comboId).val();
		
		alert("comboId : "+comboId+" rowId : "+ rowId+" id : "+id+" selectedVal : "+selectedVal);
		
		$('#jqGrid').setCell(rowId,'gender',selectedVal);
	},
	
	// 행 추가
	addRow : function() {

		var totCnt = $("#jqGrid").getGridParam("records");

		var addData = {"seq":"" ,"mberId":"" ,"mberNm":"", "phone":"", "address":"", "gender":"1"};

		$("#jqGrid").addRowData(totCnt+10, addData);
		$("#jqGrid").setColProp("mberId", {editable:true});
	},
	
	// 글 넣기
	rowBtn : function(cellvalue, options, rowObject) {
		
		if(rowObject.seq == "") {
			
			return '<a href="javascript:gridFunc.delRow('+options.rowId+');"> 행삭제 </a>';			
		} else {
			
			return "";
		}		
	},
	
	// 행 삭제
	delRow : function(rowid) {
		
		if(rowid != "") {
			
		 	$("#jqGrid").delRowData(rowid);
		}
	},
	
	// 초기화
	clearGrid : function() {
		
		$("#jqGrid").clearGridData();
	}
}
</script>

<body>
	<div class="row">
		<div>
			<select id="selectId">
				<option value="">전체</option>
				<option value="A">임플A</option>
				<option value="B">임플B</option>
				<option value="C">임플C</option>
				<option value="D">임플D</option>			
			</select>
			<span><a href="#" onclick="javascript:jqgridTable.goSearch();">조회</a></span> 
			<span><a href="#" onclick="javascript:gridFunc.addRow();">행추가</a></span>
			<span><a href="#" onclick="javascript:jqgridTable.saveData();">저장</a></span>
			<span><a href="#" onclick="javascript:gridFunc.clearGrid();">초기화</a></span>
			<span><a href="#" onclick="javascript:jqgridTable.deleteData();">삭제</a></span>
		</div>			
		<div>
			<table id="jqGrid"></table>
    		<div id="jqGridPager"></div>
		</div>	
	</div>
</body>
</html>