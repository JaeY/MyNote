<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="today" class="java.util.Date" />
<style>
.oneRowClk{
	cursor:pointer;
}
</style>
<script>
$(function(){
	
	$(".oneRowClk").click(function() {
		var hno = $(this).children().eq(0).text();
		location.href = "boardDetail.do?hno=" + hno;
	});
	
	$("#writeBtn").click(function() {
		left2.pageSubmitFn("boardInsertForm");
	});
});

function fnGoPaging(page) {
	location.href = "boardList.do?page=" + page;
}
</script>


<fmt:formatDate var="formatToday" value="${today}" pattern="yyyy-MM-dd HH:mm" />
<fmt:parseDate var="parseToday" value="${formatToday}" pattern="yyyy-MM-dd HH:mm" />

<div class="fixed-item" id="favorites">
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="header" style="overflow:hidden;">
					<div class="text-left col-md-4">
						<h4 class="title">자유 게시판</h4>
						
					</div>
					<div class="text-right col-md-offset-5 col-md-3">
						<button id="writeBtn" type="button" class="btn btn-custom-warning">
							<i class="pe-7s-pen"></i> 글쓰기
						</button>
					</div>
				</div>
				<div class="content table-responsive table-full-width">
					<table class="table table-hover table-striped">
						<colgroup>
							<col width="10%"/>
							<col width="40%"/>
							<col width="15%"/>
							<col width="15%"/>
							<col width="10%"/>
							<col width="10%"/>
						</colgroup>
						<thead class="text-center">
								<td>번호</td>
								<td>글 제목</td>
								<td>글쓴이</td>
								<td>작성일</td>
								<td>조회수</td>
								<td>좋아요</td>
								
						</thead>
						<tbody class="text-center">
							<c:forEach items="${freeBoardList}" var="freeBoardList">
								<tr class="oneRowClk">
									<td><c:out value="${freeBoardList.hno}"/></td>
									<td class="text-center">
									
										<c:if test="${freeBoardList.favorCnt >= 2}">
											<span class="label label-warning">HOT</span>
										</c:if>
								
									 <fmt:parseDate var="parseDate" value="${freeBoardList.regDate}" 
                                          pattern="yyyy-MM-dd HH:mm" />
                             		 <fmt:parseNumber value="${parseDate.time / (1000*60*60*24)}"
                                          integerOnly="true" var="strInt" />
                              		 <fmt:parseNumber value="${parseToday.time / (1000*60*60*24)}"
                                          integerOnly="true" var="endInt" />
                                              
                              			<c:if test="${endInt - strInt eq 0}">
                                			 <span class="label label-danger">NEW</span>
                              			</c:if>
                              			
                              			
									<c:out value="${freeBoardList.title}"/>
									</td>
									
									<td><c:out value="${freeBoardList.writer}"/></td>
									<td><c:out value="${freeBoardList.regDate}"/></td>		
									<td><c:out value="${freeBoardList.viewCnt}"/></td>		
									<td><c:out value="${freeBoardList.favorCnt}"/></td>		
								</tr>		
							</c:forEach>					
						</tbody>
					</table>
					<%-- paging처리 시작 --%>
					 <div class="text-center">
						<ul class="pagination">
						<c:if test="${resMap.pageGroup > 1}">
							<li>
								<a href="#" onclick="fnGoPaging(<c:out value='${resMap.prePage}'/>)"> « </a>
							</li>
						</c:if>
						
						<c:forEach var="i" begin="${resMap.startPage}"
								   end="${resMap.endPage > resMap.totalPage ? resMap.totalPage : resMap.endPage}">
								   <c:choose>
								   	<c:when test="${resMap.page eq i }">
								   		<li class="active">
								   			<a href="#" onclick="fnGoPaging(${i});">${i}</a>
								   		</li>
								   	</c:when>
								   	<c:otherwise>
								   		<li>
								   			<a href="#" onclick="fnGoPaging(${i});">${i}</a>
								   		</li>
								   	</c:otherwise>
								   </c:choose>
						</c:forEach>
						
						<c:if test="${resMap.nextPage <= resMap.totalPage}">
							<li>
								<a href="#" onclick="fnGoPaging(<c:out value='${resMap.nextPage}'/>)"> » </a>
							</li>
						</c:if>
	                    </ul>  
                    </div>
                    <%-- paging처리 끝 --%>		
				</div>
			</div>
		</div>
	</div>
</div>

