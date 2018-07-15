<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
var insertForm = {
		$insertBtn		: $,
		
		init			: function(){
			this.$insertBtn = $("#insertForm");
		},
		pageSubmitFn	: function(pageName) {
			this.$insertBtn.attr("action", pageName + ".do");
			this.$insertBtn.submit();
		}
		
}

$(function(){
	$("#cancelBtn").click(function(){
		left2.pageSubmitFn("boardList");
	});
	
	$("#insertBtn").click(function(){
		insertForm.init();
		insertForm.pageSubmitFn("boardInsert");
	});
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
						<button id="insertBtn" type="button" class="btn btn-custom-success">등록</button>
						<button id="cancelBtn" type="button" class="btn btn-custom-default">취소</button>			
					</div>
				</div>
				<div class="content table-responsive table-full-width">
					<form id="insertForm" method="post" class="form-horizontal">
						<table class="table table-borderd text-center table-border2">
							<tr>
								<td class="bg-info" width="30%;">작성자</td>
								<td>
									<input class="form-control" type="text" name="writer" value="<c:out value='${loginVO.id}'/>" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td class="bg-info">글제목</td>
								<td>
									<input class="form-control" type="text"  name="title" placeholder="제목을 입력해주세요" >
								</td>
							</tr>
							<tr>
								<td class="bg-info">글내용</td>
								<td>
									<textarea name="content" class="form-control" rows="4" placeholder="내용을 입력해주세요"></textarea>			
								</td>
							</tr>
						</table>					
					</form>
				</div>		
			</div>
		</div>
	</div>
</div>