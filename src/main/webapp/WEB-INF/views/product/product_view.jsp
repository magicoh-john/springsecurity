<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<form action="modify" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="product_id" value="${product.product_id }">
				<table class="table table-bordered table-hover table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3" style="background-color: #eeeeee; text-align: center;">제품 상세 페이지</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>제품명</td>
								<td colspan="2" style="text-align: left;">${product.product_name}</td>
							</tr>
							<tr>
								<td>제품 브랜드</td>
								<td colspan="2" style="text-align: left;">${product.brand }</td>
							</tr>
							<tr>
								<td>제품 설명</td>
								<td colspan="2" style="text-align: left;">${product.description }</td>
							</tr>
							<tr>
								<td>제품 가격</td>
								<td colspan="2" style="text-align: left;">${product.unit_price }</td>
							</tr>
							<tr>
								<td>제품 카테고리명</td>
								<td colspan="2" style="text-align: left;">${product.category_name }</td>
							</tr>
							<tr>
								<td>제품 사용유무</td>
								<td colspan="2" style="text-align: left;">
									<c:if test="${product.is_active eq '1'}">사용</c:if>
									<c:if test="${product.is_active eq '0'}">미사용</c:if>
								</td>
							</tr>
							<tr>
								<td>입고일</td>
								<td colspan="2" style="text-align: left;">${product.receipt_date }</td>
							</tr>
						</tbody>
				</table>
				<div align="center">			
					<a href="${pageContext.request.contextPath}/product/product_list_datatable" class="btn btn-primary">목록</a>
					<a href="${pageContext.request.contextPath}/product/product_updateform?product_id=${product.product_id}" class="btn btn-info">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?');" href="${pageContext.request.contextPath}/product/product_delete?product_id=${product.product_id}" class="btn btn-danger">삭제</a>
				</div>
			</form>	
		</div>
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	
</body>
</html>