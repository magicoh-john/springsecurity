<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<div>
				<p>
				    <button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/product/product_insertform'"><i class="fa fa-plus"></i> New Product</button>
				</p>
			</div>
			<div id="wrap" align="center" >
			    <form name="productForm" method="get">
			    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			    	<!-- condition of paging and searching  -->
    				<input type="hidden" name="pageNum" value="${product.pageNum_p }">
			    	<input type="hidden" name="product_name_p" value="${product.product_name_p }">
			    	<input type="hidden" name="brand_p" value="${product.brand_p }">
			    	<input type="hidden" name="unit_price_p" value="${product.unit_price_p }">
			    	<input type="hidden" name="category_id_p" value="${product.category_id_p }">
			    	<input type="hidden" name="receipt_date_from_p" value="${product.receipt_date_from_p }">
			    	<input type="hidden" name="receipt_date_to_p" value="${product.receipt_date_to_p }">
			    	
			        <div>
	                    <h4>상품 정보 조회</h4>
	                        <table class="table  table-responsive">
	                            <tr style="line-height:32px;">
	                                <td style="text-align:right;">상품 ID</td>
	                                <td >
	                                    <input type="number" name="product_id" class="form-control" value="">
	                                </td>
	                                <td style="text-align:right;">상품 이름</td>
	                                <td>
	                                    <input type="text" id="product_name" name="product_name" class="form-control" value="">
	                                </td>                        
	                            </tr>
	                            <tr>
	                                <td style="text-align:right;">브랜드명</td>
	                                <td>
	                                    <input type="text" name="brand" class="form-control" maxlength="10" value="">                                    
	                                </td>
	                                <td style="text-align:right;">카테고리명</td>
	                                <td>
	                                    <input type="text" name="category_name" class="form-control" maxlength="10" value="">                                    
	                                </td>
	                            </tr>  
	                            <tr>
	                                <td style="text-align:right;">입고일(from)</td>
	                                <td colspan="">
	                                    <input type="text" class="form-control date-picker" id="receipt_date_from" name="receipt_date_from" maxlength="10" value="${receipt_date_from }">
                 								                                    
	                                </td>
	                                <td style="text-align:right;">~ 입고일(to)</td>
	                                <td>
	                                    <input type="text" class="form-control date-picker" id="receipt_date_to" name="receipt_date_to" maxlength="10" value="${receipt_date_to }">
	                                </td>
	                            </tr>  
	                            <tr>
	                            	<td colspan="4" style="text-align:center;">
										<button type="submit" id="btnSearch" class="btn btn-default">조회</button>
									</td>
	                            </tr>  
	                        </table>
			        </div>
			    </form>		
			    	
				<table class="table table-bordered table-hover table-striped" id="datatable" style="width:100%">
					<thead>
						<tr>
							<th >product_id</th>
							<th >product_name</th>
							<th >brand</th>
							<th >unit_price</th>
							<th >category_name</th>
							<th >receipt_date_from</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
						<tr>
							<td align=left>${product.product_id }</td>
							<td align=left><a href="${pageContext.request.contextPath}/product/product_view?product_id=${product.product_id}">${product.product_name}</a></td>
							<td align=left>${product.brand }</td>
							<td align=left><fmt:formatNumber value="${product.unit_price }" pattern="#,###"/> 원</td>
							<td align=left>${product.category_name }</td>
							<td align=left>${product.receipt_date }</td>
						</tr>
						</c:forEach>
					</tbody>
					<tr>
						<td align="center" colspan="9">${page_navigator }</td>
					</tr>
				</table>
			</div>

		</div>
	</div>
	
	<script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script src="<c:url value="/resources/js/jquery.serialize-object.js" />"></script>
		
	<script>
		$(document).ready(function(){
			//calendar
			$('.date-picker').datepicker({ 
				dateFormat: 'yy-mm-dd', 
				changeMonth: 'true', 
				changeYear: 'true',
		        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				showButtonPanel: true, 
		        currentText: '오늘 날짜', 
		        closeText: '닫기',
			});
			
			//search 
            $('#btnSearch').on('click', function () {
            	//alert('btnSearch click event');
            	event.preventDefault(); 	
            	//var client_name = $('.client_name').val();
                Fn_Search_Product();
            });
		});
		
		//search client (actually use)
		function Fn_Search_Product() {
			var url = getContextPath() + "/product/product_list_search";
			var data = $("form[name=productForm]").serializeObject();
			//alert(JSON.stringify(data));
			$.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(data), 
				contentType : "application/json; charset=utf-8",
				dataType : "html",
				success : function(response) {
					//alert(response);
					var jasonData = JSON.parse(response);
					$('#datatable tr:not()').remove();
	
					var text = "";
					text += "<tr>\n";
					text += "<th style='text-align:center;'>product_id</th> \n";
					text += "<th style='text-align:center;'>product_name</th> \n";
					text += "<th style='text-align:center;'>brand</th> \n";
					text += "<th style='text-align:center;'>unit_price</th> \n";
					text += "<th style='text-align:center;'>category_name</th> \n";
					text += "<th style='text-align:center;'>receipt_date_from</th> \n";
					text += "</tr>\n";
					
					for (var i = 0; i < jasonData.length; i++) {
						text += "<tr>\n";
						text += "<td>" + jasonData[i].product_id	+ "</td>\n";
						text += "<td><a href='${pageContext.request.contextPath}/product/product_view?product_id=" + jasonData[i].product_id + "'>"	+ jasonData[i].product_name	+ "</a></td>\n";
						text += "<td>" + jasonData[i].brand	+ "</td>\n";
						text += "<td>" + jasonData[i].unit_price	+ "</td>\n";
						text += "<td>" + jasonData[i].category_name	+ "</td>\n";
						text += "<td>" + jasonData[i].receipt_date	+ "</td>\n";
						text += "</tr>\n";
						
						
						
					}
					$('#datatable').append(text);
				},
				failure : function(response) {
					alert('2');
					//alert(response);
				},
				error : function(xhr, status) {
					alert('3');
					alert(xhr.responseText);
				}
			});
		}		
	</script>	
		
<%@ include file="/WEB-INF/views/shared/footer.jsp" %>