<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<form method="POST" 
				action="${pageContext.request.contextPath}/product/product_update" id="updateForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name="product_id" value="${map.product.product_id }">
				<table class="table table-bordered table-hover table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">상품 정보 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%">제품명</td>
							<td colspan="2"><input type="text" class="form-control" id="product_name" name="product_name" maxlength="50" value="${map.product.product_name}" required="required"></td>
						</tr>
						<tr>
							<td style="width: 20%">제품 브랜드</td>
							<td colspan="2"><input type="text" class="form-control" id="brand" name="brand" maxlength="50" value="${map.product.brand}" required="required"></td>
						</tr>
						<tr>
							<td>제품 설명</td>
							<td colspan="2"><input type="text" class="form-control"  id="description" name="description" maxlength="100" value="${map.product.description}" required="required"></td>
						</tr>
						<tr>
							<td>제품 가격</td>
							<td colspan="2"><input type="text" class="form-control"  id="unit_price" name="unit_price" maxlength="100" required="required"
												value="<fmt:formatNumber 
												type="number" 
												maxFractionDigits="3" 
												value="${map.product.unit_price }" 
												pattern="#,#00.0#"/>" 
											>

							</td>
						</tr>
						<tr>
							<td>제품 카테고리ID</td>
							<td colspan="2">
								<select name="category_id" style="width:1000px;height:30px;"  required="required">
									<c:forEach var="category" items="${map.categoryList}">
										<option value="${category.category_id }" ${category.category_id == map.product.category_id ? 'selected="selected"' : '' }  >${category.category_name }</option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<td>제품 사용유무</td>
							<td colspan="2">
								<select name="is_active" style="width:1000px;height:30px;"  required="required">
									<option value="1" <c:if test="${map.product.is_active eq '1'}">selected</c:if>>사용</option>
									<option value="0" <c:if test="${map.product.is_active eq '0'}">selected</c:if>>미사용</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>제품입고일</td>
							<td colspan="2"><input type="date" class="form-control date-picker" id="receipt_date" name="receipt_date" maxlength="10" value="${map.product.receipt_date }" required="required"></td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<input type="submit" class="btn btn-primary" id="btnSave" name="btnSave" value="저장">
					<input type="button" class="btn btn-success" value="이전화면" onclick="goBack();" />
					<input type="button" class="btn btn-info" value="목록보기" onclick="location.href='${pageContext.request.contextPath}/product/product_list_datatable'" />
				</div>
			</form>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/shared/footer.jsp" %>
	
	<script>
		$(document).ready(function(){
			var formObj = $("#updateForm");
           	var url = getContextPath();
			//component validation 
            $('#btnSave').on('click', function (e) {
            	e.preventDefault();
    			if ($('#product_name').val() == '') {
					alert('제품명을 입력하세요.');
					$('#product_name').focus();
				} else if ($('#brand').val() == '') {
					alert('브랜드명을 입력하세요.');
					$('#brand').focus();
				} else if ($('#description').val() == '') {
					alert('제품 설명을 입력하세요.');
					$('#description').focus();
				} else if ($('#unit_price').val() == '') {
					alert('제품 가격을 입력하세요.');
					$('#unit_price').focus();
				} else if ($('#receipt_date').val() == '') {
					alert('제품 입고일을 입력하세요.');
					$('#receipt_date').focus();
				}
				else{ 
					if (confirm('수정하시겠습니까?')) {
						//remove comma in unit_price
						$('#unit_price').val(Fn_Remove_Comma($('#unit_price').val()));
						
		            	formObj.attr("action", url + "/product/product_update");
		            	formObj.attr("method", "POST");
		            	formObj.submit();
					}	
				}
            });
		});
		
		//prev screen
		function goBack(){
			window.history.back();
		}

        //remove comma
        function Fn_Remove_Comma(number) {
            if (typeof number == "undefined" || number == null || number == "") {
                return "";
            }
            var txtNumber = '' + number;
            return txtNumber.replace(/(,)/g, "");
        }		
		
	</script>	
	
</body>
</html>