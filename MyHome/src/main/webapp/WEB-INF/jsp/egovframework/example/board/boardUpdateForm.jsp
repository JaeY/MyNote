<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
var updateForm = {
		$updateFrm		:$,
		init			:function() {
			this.$updateFrm = $("#updateFrm");
		},
		
		pageSubmitFn	:function() {
			this.$updateFrm.attr("action", "boardUpdate.do");
			this.$updateFrm.attr("method", "post");
			
			this.$updateFrm.submit();
			
		}
}


 $(function(){
	 $("#btnUpdate").click(function() {
		 updateForm.init();
	 	 updateForm.pageSubmitFn();
	 })
	 $("#btnUpdateCancel").click(function() {
		 window.history.back();
	 })
});


</script>
<div class="fixed-item" id="favorites">
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card" style="overflow: hidden;padding: 20px;">
				<div class="header">
					<h4 class="title">게시판도 뭐 어렵지 않아요</h4>
					<p class="category">
						게시판도 아작내봅시다!!!
					</p>
					<div class="text-right">
						<button id="btnUpdate" type="button" class="btn btn-info">수정</button>
						<button id="btnUpdateCancel" type="button" class="btn btn-custom-default">취소</button>			
					</div>
				</div>
				<div class="content table-responsive table-full-width">
					<form id="updateFrm" class="form-horizontal">
						<table class="table table-borderd text-center table-border2">
							<tr>
								<td class="bg-info" width="30%;">작성자</td>
								<td>
									<input class="form-control" type="text" name="writer" 
										value="<c:out value='${boardVO.writer}'/>" readonly="readonly"> 
									<input class="form-control" type="hidden" name="hno"
										value="<c:out value='${boardVO.hno}'/>" >
								</td>
							</tr>
							<tr>
								<td class="bg-info">작성일</td>
								<td>
									<input class="form-control" type="text"  name="regdate" 
										value="<c:out value='${boardVO.regDate}'/>" readonly="readonly">		
								</td>
							</tr>							
							<tr>
								<td class="bg-info">글제목</td>
								<td>
									<input class="form-control" type="text"  name="title" 
									placeholder="제목을 입력해주세요" value="<c:out value='${boardVO.title}'/>">
								</td>
							</tr>
							<tr>
								<td class="bg-info">글내용</td>
								<td>
									<textarea name="content" class="form-control" rows="4" 
									placeholder="내용을 입력해주세요"><c:out value='${boardVO.content}'/></textarea>			
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>