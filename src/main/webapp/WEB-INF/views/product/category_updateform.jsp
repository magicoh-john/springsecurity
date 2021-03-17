<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<form method="post" 
				action="${pageContext.request.contextPath}/product/category_update">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="category_id" value="${map.category.category_id }">
				<table class="table table-bordered table-hover table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">카테고리 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%">카테고리명</td>
							<td colspan="2"><input type="text" class="form-control" name="category_name" maxlength="50" value="${map.category.category_name}"></td>
						</tr>
						<tr>
							<td>카테고리 설명</td>
							<td colspan="2"><input type="text" class="form-control"  name="description" maxlength="100" value="${map.category.description}"></td>
						</tr>
						<tr>
							<td>사용유무</td>
							<td colspan="2"><input type="text" class="form-control"  name="is_active" maxlength="200" value="${map.category.is_active}"></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-rigth" value="저장">
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	
</body>
</html>