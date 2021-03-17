<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<!-- <form action="modify" method="post">  -->
				<!-- <input type="hidden" name="bId" value="${content_view.bId}">  -->
				<table class="table table-bordered table-hover table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #eeeeee; text-align: center;">카테고리 상세 페이지</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 20%">카테고리 ID</td>
								<td colspan="2" style="text-align: left;">${category.category_id} </td>
							</tr>
							<tr>
								<td>카테고리명</td>
								<td colspan="2" style="text-align: left;">${category.category_name}</td>
							</tr>
							<tr>
								<td>카테고리 설명</td>
								<td colspan="2" style="text-align: left;">${category.description }</td>
							</tr>
							<tr>
								<td>사용여부</td>
								<td colspan="2" style="text-align: left;">${category.is_active }</td>
							</tr>
						</tbody>
				</table>
			<!--  </form> -->				
				<a href="category_list" class="btn btn-primary">목록</a>
				<%
					//if(userID != null && userID.equals(bbs.getUserID())){
				%>
				<a href="${pageContext.request.contextPath}/product/category_updateform?category_id=${category.category_id}" class="btn btn-info">수정</a>
				<a href="${pageContext.request.contextPath}/product/category_delete?category_id=${category.category_id}" onclick="return confirm('정말로 삭제하시겠습니까?');"  class="btn btn-danger">삭제</a>
				<%
					//}
				%>
		</div>
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	
</body>
</html>