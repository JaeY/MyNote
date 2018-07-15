<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.favor {
    background-color: #fff;
    border: 1px solid #888888;
    border-radius: 5px;
    color: #888888;
    padding-right: 10px;
    font-size:24px;
}
.red {
    color: red;
}
.atext {
    color: #000;
}
.replyUBtn{
    vertical-align: top;
    height: 46px;
    background-color: #f1f0f0;
    border: 1px solid #8a8989ee;
}
.redClass {
	color:red;
}
</style>
<script>
var detailForm = {
		$formTarget	: $,
		
		init		: function() {
			this.$formTarget = $("#detailFrm");
		},
		
		pageSumbitFn	: function(pageName) {
			this.$formTarget.attr("action", pageName + ".do");
			
			this.$formTarget.submit();
		},
		
		clickEvent		: function(target, pageName) {
			var $target = $("#" + target),
				that = this;
			
			this.init();
			
			$target.click(function() {
				
				if (target === "btnList") {
					left2.pageSubmitFn(pageName);
				} else {
					that.pageSumbitFn(pageName);
				}
			});
		}
		
}

var favorite = {
		$favorTarget	: $,
		
		init			: function() {
			this.$favorTarget = $("#favorBtn");
		},
		
		clickEvent		: function() {
			var that = this;
			
			that.init();
			
			that.$favorTarget.click(function() {
				var $this = $(this),
			    $cSpan = $this.children().eq(0),
			    $cI = $this.children().eq(1),
				hno = $("input[name=hno]").val();
			
				var param = {
					"hno" : hno		
				}
				
				// 좋아요를 클릭 했을 경우,좋아요 취소를 했을 경우 처리
				if ($cI.hasClass("fa-heart-o")) {
					param.status = "I";
					
					console.log("param", param);
					
					$.ajax({
						type       : "POST",
				        url        : "changeFavorite.do",
				        contentType : "application/json",
				        data	   : JSON.stringify(param),
				        async      : false,
				        success    : function(data) {
				        	console.log("data",data);
				        	var jObj = JSON.parse(data);
				        	console.log("jObj",jObj);
				        	
				        	if (jObj.result === "SUCCESS") {
			        			$cI.removeClass("fa-heart-o");
			        			$cI.addClass("fa-heart");
			        			$cI.addClass("red");	
				        		
				        		$cSpan.text(jObj.favoriteTotCnt);
				        		alert(jObj);
				        	} else {
				        		alert("좋아요 클릭 시, 에러가 발생했습니다.");	
				        	}
				        },
				        error      : function() {
				        	alert("좋아요 클릭 시, 에러가 발생했습니다.");
				        } 
				    });
				} else { 
					param.status = "D";
					
					$.ajax({
				        type       : "POST",
				        url        : "changeFavorite.do",
				        contentType: "application/json",
				        data	   : JSON.stringify(param),
				        async      : false,
				        success    : function(data) {
				        	
				        	var jObj = JSON.parse(data);
				        	
				        	if (jObj.result === "SUCCESS") {
			        			$cI.removeClass("fa-heart");
			        			$cI.removeClass("red");
			        			$cI.addClass("fa-heart-o");
				        		
				        		$cSpan.text(jObj.favoriteTotCnt);
				        	} else {
				        		alert("좋아요 클릭 시, 에러가 발생했습니다.");	
				        	}
				        },
				        error      : function() {
				        	alert("좋아요 클릭 시, 에러가 발생했습니다.");
				        }
				    });
				}
			});
		},
		
		toggleClass		: function(target, isTrue) {
			
			if (isTrue) {
				target.removeClass("fa-heart-o");
				target.addClass("fa-heart");
				target.addClass("red");
			} else {
				target.addClass("fa-heart-o");
				target.removeClass("fa-heart");
				target.removeClass("red");
			}
		}
	}

$(function(){
	detailForm.clickEvent("btnList",	"boardList");
	detailForm.clickEvent("btnModify",	"boardUpdateForm");
	detailForm.clickEvent("btnDelete",	"boardDelete");
	
	favorite.clickEvent();
	
	var favoriteOwnCnt = "<c:out value='${favoriteOwnCnt}'/>";
	var favoriteOwnCntInt = parseInt(favoriteOwnCnt);
	
	favorite.toggleClass(favorite.$favorTarget.children().eq(1), favoriteOwnCntInt);
	
	
	reply.init();
	reply.insertReply();
	reply.deleteReply();
	reply.updateReplyTxt();
	reply.updateReplyBtn();
	
	/* $("#btnList").click(function(){
		left.pageSubmitFn("hanqBoardList");
	});
	
	detailForm.init();
	
	$("#btnModify").click(function(){
		detailForm.pageSubmitFn("hanqBoardUpdateForm");
	});
	
	$("#btnDelete").click(function(){
		detailForm.pageSubmitFn("hanqBoardDelete");
	}); */
});

var reply = {
		   
		   $replyInsert   : $,
		   repContentTemp   : "",
		   repNoTemp      : "",
		   
		   init         : function() {
		      this.$replyInsert = $("#replyInsert");
		   },
		   
		   insertReply      : function() {
		      
		      this.$replyInsert.click(function() {
		         var hno       = $("input[name=hno]").val(),
		            repContent   = $("textarea[name=repContent]").val(),
		            boardWriter   = "<c:out value='${boardVO.writer}' />";
		            
		         var param = {
		            "hno"         : hno,
		            "repContent"   : repContent
		         }
		         
		         $.ajax({
		            type          : "POST",
		              url           : "insertReply.do",
		              contentType : "application/json",
		              data         : JSON.stringify(param),
		              async         : false,
		              success      : function(result) {
		                 var resultJson = JSON.parse(result);
		                 
		                 console.log("resultJson", resultJson);
		                 
		                 if (resultJson.result === "SUCCESS") {
		                    var data      = resultJson.data,
		                       strReview   = "";
		                    
		                    strReview   +=   "<tr>"
		                             +      "<td>"
		                             +         "<input type='hidden' name='repNo'"
		                             +         "value='" + data.repNo + "'/>"
		                             +         data.repWriter;
		                    
		                    if (boardWriter === data.repWriter) {
		                       strReview += "<span class='label label-default'>작성자</span>";
		                    }
		                    
		                    strReview   +=      "</td>"
		                             +      "<td>"
		                             +         "<span class='tdTarget'>"
		                             +            data.repContent
		                             +         "</span>"
		                             +      "</td>"
		                             +      "<td>"
		                             +         data.regDate
		                             +      "</td>"
		                             +      "<td>"
		                             +         "<a class='atext replyUpdate' href='#'>수정</a>"
		                             +         "<a class='atext replyDelete' href='#'>삭제</a>"
		                             +      "</td>"
		                             +   "</td>"
		                    
		                    $("#reviewList tr:last").before(strReview);
		                             
		                    var $reviewNone = $("#reviewList").children().eq(0);
		                    
		                    if ($reviewNone.hasClass("reviewNone")) {
		                       $reviewNone.remove();
		                    }
		                    
		                    $("textarea[name=repContent]").val("");
		                 } else {
		                    alert("댓글 작성시 error111 발생");
		                 }
		              },
		              error      : function() {
		                 alert("댓글 작성시 error 발생222");
		              }
		         })
		      })
		   },
		   
		   deleteReply   : function() {
			      
			      $("#reviewList").on("click", "a.replyDelete", function() {
			         var $this   = $(this);
			         var hno      = $("input[name=hno]").val(),
			            repNo   = $this.parent().parent().children().eq(0).children().eq(0).val();
			         
			         var param   = {
			            
			            "hno"   : hno,
			            "repNo"   : repNo
			         }
			         
			         if (confirm("삭제하시겠습니까?")) {
			            
			            $.ajax({
			               
			               type          : "POST",
			                 url           : "deleteReply.do",
			                 contentType : "application/json",
			                 data         : JSON.stringify(param),
			                 async         : false,
			                 
			                 success      : function(result) {
			                    var resultJson = JSON.parse(result);
			                    
			                    if (resultJson.result === "SUCCESS") {
			                       $this.parent().parent().remove();
			                    } else {
			                       alert("댓글 삭제시 Error가 발생했습니다.");
			                    }
			                 },
			                 error      : function() {
			                    alert("댓글 삭제시 error");
			                 }
			            })
			         }
			      })
			   },
			   
			   updateReplyTxt : function() {
			      var that = this;
			      
			      $("#reviewList").on("click", "a.replyUpdate", function() {
			         var $this      = $(this);
			         
			         if ($this.hasClass("redClass")) {
			            that.updateCommonProc($this);
			         } else {
			            
			            /* // repNo를 기준으로 타겟잡아서 진행한 것
			            var $repNoTarget = $("#reviewList input[value=" + that.repNoTemp + "]");
			            
			            if ($repNoTarget.val() !== undefined) {
			               
			               var $updateTarget = $repNoTarget.parent().parent().find("a.replyUpdate");
			               
			               that.updateCommonProc($($updateTarget));
			            } */
			            
			            // 기존 a.redClass에서 반복문 돌려서 얻은 결과
			             
			            $("a.redClass").each(function(i, items) {
			               
			               if ($(items).hasClass("redClass")) {
			                  that.updateCommonProc($(items));
			               }
			            })
			             
			             
			            that.updateCommonProc($this);
			         }
			      })
			   },
			   
			   
			   
			   
			   updateCommonProc : function($target) {
			      var $tdRepContentTarget = $target.parent().prev().prev(),
			         hasRedClass         = $target.hasClass("redClass"),
			         repContent         = "",
			         chgStr            = "";
			      
			      if (hasRedClass) {
			         $target.next().show();
			         $target.text("수정");
			         $target.removeClass("redClass");
			         
//			          repContent   = $tdRepContentTarget.children().children().eq(0).val();
			         repContent   = this.repContentTemp;
			         chgStr      = "<span class='tdTarget'><td>" + repContent + "</td></span>";
			         
			      } else {
			         this.repContentTemp = $tdRepContentTarget.children().eq(0).text();
			         this.repNoTemp      = $target.parent().parent().children().eq(0).children().eq(0).val();
			         
			         $target.next().hide();
			         $target.text("수정취소");
			         $target.addClass("redClass");
			         
			         repContent   =    $tdRepContentTarget.children().eq(0).text(),
			         chgStr       =    "<div class='updateTxt'><textarea>" + repContent + "</textarea>" +
			                        "<button class='replyUBtn updateBtnClk'>수정</button></div>";
			            
			      }
			      
			      $tdRepContentTarget.children().eq(0).remove();
			      $tdRepContentTarget.append(chgStr);
			   },
			   
			   updateReplyBtn : function() {
			      
			      $("#reviewList").on("click", "button.updateBtnClk", function() {
			         var $this      = $(this);
			         var   hno         = $("input[name=hno]").val(),
			            repNo      = $this.parent().parent().parent().find("input[name=repNo]").val(),
			            repContent   = $this.prev().val();
			            
			         var param      = {
			            
			            "hno"         : hno,
			            "repNo"         : repNo,
			            "repContent"   : repContent
			         }
			         
			         $.ajax({
			            
			            type          : "POST",
			               url           : "updateReply.do",
			               contentType   : "application/json",
			               data         : JSON.stringify(param),
			               async         : false,
			               success       : function(result) {
			                  var resultJson = JSON.parse(result);
			                    
			                    console.log("resultJson", resultJson);
			                    
			               if (resultJson.result === "SUCCESS") { 
			                  var data = resultJson.data;
			                  
			                  $this.parent().parent().next().next().children().eq(0).text("수정");
			                      $this.parent().parent().next().next().children().eq(0).removeClass("redClass");
			                      $this.parent().parent().next().next().children().eq(1).show();
			                      
			                      var str = "<span>" + data.repContent + "</span>";
			                      
			                      $this.parent().parent().append(str);
			                      
			                      $(".updateTxt").remove();
			                    } else {
			                       alert("댓글  수정시  Error가 발생했습니다.")
			                    }
			               },
			               error      : function() {
			                  alert("댓글  수정시  Error가 발생했습니다.");
			               }
			         })
			      })
			   }
		   
		   
		   
		   
		   
}
</script>
<%
	pageContext.setAttribute("crcn", "\r\n");
	pageContext.setAttribute("br", "<br>");
%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="card" style="overflow: hidden;padding: 20px;">
				<div class="row header">
					<div class="text-left">
						<h4 class="title">자유 게시판</h4>
						
						<div class="text-right">
							<button class="favor" id="favorBtn">
								<span><c:out value="${favoriteTotCnt}"/></span>
								<i class="fa fa-heart-o"></i>
							</button>
							<button id="btnList" type="button"   class="btn btn-custom-default">
								<i class="pe-7s-back"></i>목록으로
							</button>
							<c:if test="${loginVO.id eq boardVO.writer}">
								<button id="btnModify" type="button" class="btn btn-custom-primary">
									<i class="pe-7s-tools"></i> 수정
								</button>
								<button id="btnDelete" type="button" class="btn btn-custom-danger">
									<i class="pe-7s-trash"></i> 삭제
								</button>
							</c:if>			
						</div>
					</div>
				</div>
				<div class="content table-responsive table-full-width">
					<div>
						<form id="detailFrm" method="get" class="form-horizontal">
							<table class="table table-borderd table-border2">
								<tr>
									<td class="bg-info">작성자</td>
									<td class="text-left">
										<c:out value="${boardVO.writer}"/>
										<input type="hidden" name="hno" value="<c:out value='${boardVO.hno}'/>" />
									</td>
								</tr>
								<tr>
									<td class="bg-info">작성일</td>
									<td class="text-left">
										<c:out value="${boardVO.regDate}"/>
									</td>
								</tr>							
								<tr>
									<td class="bg-info">글제목</td>
									<td class="text-left">
										<c:out value="${boardVO.title}"/>
									</td>
								</tr>
								<tr>
									<td class="bg-info">글내용</td>
									<td class="text-left" style="height:200px">
										${fn:replace(boardVO.content, crcn, br)}
									</td>
								</tr>
							</table>
						</form>
					</div>					
				</div>
				
				<div class="replyContent">
					<div class="header">
						<span>댓글</span>
					</div>
					<div>
						<div class="content table-responsive table-full-width">
							<div class="content">
								<table class="table table-bigboy">
									<colgroup>
										<col width="20%"/>
										<col width="50%"/>
										<col width="20%"/>
										<col width="10%"/>
									</colgroup>
									<thead>
										<tr>
											<th class="text-center">작성자</th>
											<th class="text-center">내용</th>
											<th class="text-center">작성일</th>
											<th class="text-center"></th>
										</tr>
									</thead>
									<tbody class="text-center" id="reviewList">
									<c:choose>
											<c:when test="${empty replyList}">
												<tr class="reviewNone">
													<td colspan="3" class="text-center">댓글이 없습니다. 댓글을 남겨주세요</td>
												</tr>
											</c:when>
											<c:otherwise>
													<c:forEach items="${replyList}" var="replyList"></c:forEach>
											</c:otherwise>
										</c:choose>
										
									<c:forEach items="${replyList}" var="replyList">
										<tr>
											<td>
												<c:out value="${replyList.repWriter}"/>
												<input type="hidden" name="repNo" value="<c:out value='${replyList.repNo }'/>"/>
											
												<c:if test="${replyList.repWriter eq boardVO.writer}">
													<span class="label label-default">작성자</span>
												</c:if>
											</td>
											<td>
												<span class="tdTarget"><c:out value="${replyList.repContent}"/></span>
											</td>
											<td><c:out value="${replyList.regDate}"/></td>
											
											<td>
												<c:if test="${loginVO.id eq replyList.repWriter}">
													<a class="atext replyUpdate"  href="#">수정</a>
													<a class="atext replyDelete" href="#">삭제</a>
												</c:if>
											</td>
										</tr>		
										
										</c:forEach>	
														
										<tr>
		                            		<td colspan="3">
		                            			<textarea name="repContent" class="form-control" rows="3" placeholder="댓글내용을 입력해주세요"></textarea>			
											</td>
		                            		<td>			                            
			                            		<button type="button" id="replyInsert" style="height:80px" class="btn btn-custom-success">
			                            			<i class="pe-7s-pen"></i> 댓글작성하기
			                            		</button>
		                            		</td>
		                            	</tr>
									</tbody>
								</table>
		                    </div>
						</div>	
                    </div>
				</div>
				
				
				<hr>
				<div>
					<div>
						<c:choose>
							<c:when test="${nextHno > 0}">
								<a href="boardDetail.do?hno=<c:out value='${nextHno}'/>">
									<span>다음글 보러가기</span>
								</a>
							</c:when>
							<c:otherwise>
								<span>다음글이 없습니다.</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<c:choose>
							<c:when test="${previousHno > 0}">
								<a href="boardDetail.do?hno=<c:out value='${previousHno}'/>">
									<span>이전글 보러가기</span>
								</a>
							</c:when>
							<c:otherwise>
								<span>이전글이 없습니다.</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>