<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>

<div class="container">
	<div id="wrap" align="center">
		<h4><b>제품 리스트 조회</b></h4>
		<form name="productForm" class="form-horizontal" role="form">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        
	        <div class="form-group">
	            <label class="control-label col-sm-3" for="product_id">제품 ID</label>
	            <div class="col-sm-3" >
					<input type="text" class="form-control" id="product_id">
	            </div>
	            <label class="control-label col-sm-3" for="product_name">제품 이름</label>
	            <div class="col-sm-3">
	                <input type="text" class="form-control" id="product_name" name="product_name">
	            </div>
	        </div>
	
		    <div class="form-group">
	            <label class="control-label col-sm-3" for="receipt_date_from">제품 입고일(From)</label>
	            <div class="col-sm-3" >
					<input type="date"	class="form-control date-picker" id="receipt_date_from"	name="receipt_date_from" maxlength="10" value="${receipt_date_from }">
	            </div>
	            <label class="control-label col-sm-3" for="receipt_date_to">제품 입고일(To)</label>
	            <div class="col-sm-3">
	                <input type="date"	class="form-control date-picker" id="receipt_date_to" name="receipt_date_to" maxlength="10" value="${receipt_date_to }">
	            </div>
	        </div>
	
	        <div class="form-group">
	            <label class="control-label col-sm-3" for="brand">제품 브랜드명</label>
	            <div class="col-sm-3" >
					<input type="text" class="form-control" id="brand" name="brand">
	            </div>
	            <label class="control-label col-sm-3" for="category_name">제품 카테고리</label>
	            <div class="col-sm-3">
	            	<div class="input-group">
	                	<input type="text" class="form-control" id="category_name" name="category_name" >
	                	<input type="hidden" class="form-control" id="category_id" name="category_id" >
	                	<span class="input-group-btn">
							<button class="categoryBtn btn btn-default" id="categoryBtn" data-toggle="modal" data-target="#myModal" type="button"><i class="fa fa-search"></i></button>
						</span>
					</div>	 
	            </div>
	        </div>
        
		    <div>
				<button type="submit" id="btnSearch" class="btn btn-primary">조회</button>
			</div>
		</form>

		<table id="datatable"
			class="table table-striped table-bordered dt-responsive nowrap"
			style="width: 100%">
			<thead>
				<tr>
					<th>product_id</th>
					<th>product_name</th>
					<th>brand</th>
					<th>unit_price</th>
					<th>category_name</th>
					<th>receipt_date</th>
					<th>operation</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="product" items="${productList}">
					<tr>
						<td align=left>${product.product_id }</td>
						<td align=left><a href="${pageContext.request.contextPath}/product/product_view?product_id=${product.product_id}">${product.product_name}</a></td>
						<td align=left>${product.brand }</td>
						<td align=left><fmt:formatNumber value="${product.unit_price }" pattern="#,###" /></td>
						<td align=left>${product.category_name }</td>
						<td align=left>${product.receipt_date }</td>
						<td align=left><a href="${pageContext.request.contextPath}/product/product_updateform?product_id=${product.product_id}"
							class="btn btn-info btn-sm"><i class="fa fa-pencil"></i> Edit</a>
							<a	class="btn btn-danger btn-sm" onclick="Fn_Product_Delete(${product.product_id})"
							style="margin-left: 5px"><i class="fa fa-trash"></i> Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>

			<tfoot>
				<tr>
					<th>product_id</th>
					<th>product_name</th>
					<th>brand</th>
					<th>unit_price</th>
					<th>category_name</th>
					<th>receipt_date</th>
					<th>operation</th>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

<!-- Modal Dialog Div -->
<div id="myModal" class="modal fade" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-size">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" id="closbtn" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel">Modal</h4>
              </div>
              <div class="modal-body" id="myModalContent" ></div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">close</button>
              </div>
          </div>
      </div>
</div>

<%@ include file="/WEB-INF/views/shared/footer.jsp" %>

	<script>
		var table ;
		$(document).ready(function(){
			//datatables setting
			table =  $('#datatable').removeAttr('width').DataTable({
					select: true,
					mark: true, // Highlight search terms
					aLengthMenu: [
						// Show entries incrementally
						[5, 15, 30, 50, -1],
						[5, 15, 30, 50, "All"]
					],
					dom: 'Bfrtip',
			        buttons: [
			        	  { extend: 'pdf', text: '<i class="fa fa-pencil" aria-hidden="true"> PDF</i>' },
		                  { extend: 'csv', text: '<i class="fas fa-file-csv fa-1x">CSV</i>' },
		                  { extend: 'excel', text: '<i class="fas fa-file-excel" aria-hidden="true">EXCEL</i>' }
			        ],
// 					"scrollY": "700px",			//default scrool with
// 		        	"scrollX": true,
// 		        	"scrollCollapse": true,
			    	"processing": true,
			    	"lengthChange": false,
			    	"searching": true,
			    	"order": [[ 0, "desc" ]],	//default order column index and sort direction
			    	"columnDefs": [
			    		{  
		                    "targets": [0],  
		                    "visible": true,  
		                    "searchable": true,
		                    "orderable": true
		                },  
		                {  
		                    "targets": [1],  
		                    "visible": true,  
		                    "searchable": true,
		                    "orderable": true
		                },  
		                {  
		                    "targets": [2],  
		                    "visible": true,  
		                    "searchable": true,
		                    "orderable": true
		                },  
		                {  
		                    "targets": [3],  
		                    "className": 'dt-body-right',	//align right
		                    "visible": true,  
		                    "searchable": true,
		                    "orderable": true
		                },
		                {  
		                    "targets": [4],  
		                    "visible": true,  
		                    "searchable": true,
		                    "orderable": true
		                },
		                {  
		                    "targets": [5],  
		                    "visible": true,  
		                    "searchable": true,
		                    "orderable": true
		                },
		                {  
		                    "targets": [6],  
		                    "visible": true,  
		                    "searchable": true,
		                    "orderable": false
		                }
					], 
			        fixedColumns: true,
			        //footer sum
			        "footerCallback": function (row, data, start, end, display) {
			            var api = this.api(), data;
			            // Remove the formatting to get integer data for summation
			            var intVal = function (i) {
			                return typeof i === 'string' ? i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ? i : 0;
			            };
			            // Total over all pages
			            var total = api.column(3).data().reduce( 
			            	function (a, b) {
			                	//console.log(a);	console.log(b);
			                	return intVal(a) + intVal(b);
			                }, 0 );
			            // Total over this page
			           var pageTotal = api.column( 3, { page: 'current'} ).data().reduce( 
							function (a, b) {
			                	return intVal(a) + intVal(b);
			                }, 0);
			 
			            // Update footer
			            $(api.column(3).footer()).html(Fn_Add_Comma(pageTotal.toFixed(1))  + ' (' + Fn_Add_Comma(total.toFixed(1)) + ')');
			        }
			        
			 });	//end of datatable

			//calendar jQuery-ui
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
            $('#btnSearch').on('click', function (e) {
            	e.preventDefault(); 	
                Fn_Search_Product();
            });
			
			//category modal open
            //when clicked category select button
            $('#categoryBtn').on('click', function () {
            	var category_name = $('#category_name').val();
                Fn_Category_Modal(category_name);
            });
			
          	//when changed category input box
            $('#category_name').on('change', function () {
                var category_name = $(this).val();
                Fn_Category_Modal(category_name);
            });
		});	//end of ready()
		
		//search product(actually used)
		function Fn_Search_Product() {
			var url = getContextPath() + "/product/product_list_search_datatable";
			var data = $("form[name=productForm]").serializeObject();
			$.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(data), 
				beforeSend: function(xhr){
					var csrf_tocken = $("meta[name='_csrf']").attr("content");
					var csrf_header = $("meta[name='_csrf_header']").attr("content");
					xhr.setRequestHeader(csrf_header, csrf_tocken);
				},
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					//console.log(data);
					if ($.fn.dataTable.isDataTable('#datatable')) {
             		    $('#datatable').DataTable().clear().destroy();               
            		}
					
					$('#datatable').DataTable({
				    	"data": data,
						select: true,
						dom: 'Bfrtip',
				        buttons: [
				        	  { extend: 'pdf', text: '<i class="fa fa-pencil" aria-hidden="true"> PDF</i>' },
			                  { extend: 'csv', text: '<i class="fas fa-file-csv fa-1x">CSV</i>' },
			                  { extend: 'excel', text: '<i class="fas fa-file-excel" aria-hidden="true">EXCEL</i>' }
				        ],
				    	"processing": true,
				    	"lengthChange": false,
				    	"searching": true,
				    	"order": [[ 0, "desc" ]],	//default order column index and sort direction			        	
				    	"columnDefs": [
				    		{  
			                    "targets": [0],  
			                    "visible": true,  
			                    "searchable": true,
			                    "orderable": true
			                },  
			                {  
			                    "targets": [1],  
			                    "visible": true,  
			                    "searchable": true,
			                    "orderable": true
			                },  
			                {  
			                    "targets": [2],  
			                    "visible": true,  
			                    "searchable": true,
			                    "orderable": true
			                },  
			                {  
			                    "targets": [3],  
			                    "className": 'dt-body-right',	//align right
			                    "visible": true,  
			                    "searchable": true,
			                    "orderable": true
			                },
			                {  
			                    "targets": [4],  
			                    "visible": true,  
			                    "searchable": true,
			                    "orderable": true
			                },
			                {  
			                    "targets": [5],  
			                    "visible": true,  
			                    "searchable": true,
			                    "orderable": true
			                },
			                {  
			                    "targets": [6],  
			                    "visible": true,  
			                    "searchable": true,
			                    "orderable": false
			                }
						], 
						fixedColumns: true,
				    	"columns": [
			                    { "data": "product_id", "name": "product_id", "width": "100px"},
			                    { 
			                    	"data": "product_name", "name": "product_name", "width": "100px",
			                    	"render": function (data, type, full, meta) {
			                    		return $('<a>').attr('href', 'product_view?product_id=' + full.product_id).text(data).wrap('<td></td>').parent().html();
			                    	}			
			                    },
			                    { "data": "brand", "name": "brand", "width": "100px" },
			                    { 
			                      "data": "unit_price", "name": "unit_price", "width": "100px", 
			                      "render" : $.fn.dataTable.render.number( ',', '.', 1 )
			                    },
			                    { "data": "category_name", "name": "category_name", "width": "100px" },
			                    { "data": "receipt_date", "name": "receipt_date", "width": "100px" },
			                    {
			                        "data": "product_id", "name": "product_id", "render": function (data, type, full, meta) {   
			                            return '<a href="${pageContext.request.contextPath}/product/product_updateform?product_id=' + full.product_id + '" class="btn btn-info btn-sm" ><i class="fa fa-pencil"></i> Edit</a><a class="btn btn-danger btn-sm" onclick=Fn_Product_Delete("' + full.product_id + '") style="margin-left:5px"><i class="fa fa-trash"></i> Delete</a>';
			                        },
			                        "width": "100px"
			                    }
			          ]
				    });
				},
				failure : function(data) {
					alert(data);
				},
				error : function(xhr, status) {
					alert(xhr.responseText);
				}
			});
		}	//end of Fn_Search_Product		
		
		//search category
        function Fn_Category_Modal(category_name) {
            var url = getContextPath() + "/product/category_modal";
            var data = {category_name: category_name};
            $.ajax({
                type: "GET",
                url: url,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "html",
                success: function (data) {
                	console.log(data);
                    $('#myModalContent').html(data);
                    $('#myModal').modal('show');
                },
                failure: function (data) {
                    alert('1');
                    alert(data.responseText);
                },
                error: function (data) {
                	alert('2');
                    alert(data.responseText);
                }
            });
        }
		
		//Add comma at thousand unit(int and decimal)
        function Fn_Add_Comma(number) {
            var number_string = number.toString();
            var number_parts = number_string.split('.');
            var regexp = /\B(?=(\d{3})+(?!\d))/g;
            if (number_parts.length > 1) {
                return number_parts[0].replace(regexp, ',') + '.' + number_parts[1];
            }
            else
            {
                return number_string.replace(regexp, ',');
            }
        }
		
		//delete
        function Fn_Product_Delete(product_id) {
            if (confirm('Are you sure to delete this record?')) {
            	var data = {product_id: product_id};
            	var url = getContextPath() + "/product/product_delete";
                $.ajax({
                    type: "POST",
                    url: url,     
                    data: data,
                    success: function (data) {
                        if (data.success)
                        {
                        	table.ajax.reload();
                            //$.notify(data.message, {
                            //    globalPosition: "top center",
                            //    className: "success"
                            //});
                        }
                        else
                        {
                            //$.notify(data.message, {
                            //    globalPosition: "top center",
                            //    className: "error"
                            //});
                            alert('2');
                        }
                    }
                });
            }
        }
	</script>	

