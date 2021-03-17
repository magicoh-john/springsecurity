<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>

	<div class="container">
		<div class="row">
			<form method="post" action="${pageContext.request.contextPath}/product/category_insert">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table class="table table-bordered table-hover table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">카테고리 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%">카테고리명</td>
							<td colspan="2"><input type="text" class="form-control" name="category_name" maxlength="50" ></td>
						</tr>
						<tr>
							<td>카테고리 설명</td>
							<td colspan="2"><input type="text" class="form-control"  name="description" maxlength="100" ></td>
						</tr>
					</tbody>
				</table>
				<div>
					<input type="submit" class="btn btn-primary pull-rigth" value="저장">
					<a href="category_list" class="btn btn-info">목록</a>
				</div>
			</form>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/shared/footer.jsp" %>
