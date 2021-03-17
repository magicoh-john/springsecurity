<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	<div class="container">
		<div id="wrap" align="center">
			<h4><b>인보이스 조회</b></h4>

			<form name="invoiceForm" class="form-horizontal" role="form">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        
		        <div class="form-group">
		            <label class="control-label col-sm-3" for="invoice_id">인보이스 ID</label>
		            <div class="col-sm-3" >
						<input type="text" class="form-control" id="invoice_id" name="invoice_id">
		            </div>
		            <label class="control-label col-sm-3" for="client_name">거래처명</label>
		            <div class="col-sm-3">
		            	<div class="input-group">
			                <input type="text" class="form-control" id="client_name" name="client_name" >
			                <input type="hidden" class="form-control" id="client_id" name="client_id">
			                <span class="input-group-btn">
								<button class="clientBtn btn btn-default" id="clientBtn" data-toggle="modal" data-target="#myModal" type="button"><i class="fa fa-search"></i></button>
							</span>
						</div>
		            </div>
		        </div>
		
		        <div class="form-group">
		            <label class="control-label col-sm-3" for="product_name">제품명</label>
		            <div class="col-sm-3">
		            	<div class="input-group">
		                	<input type="text" class="form-control" id="product_name" name="product_name" >
		                	<input type="hidden" class="form-control" id="product_id" name="product_id">
		                	<span class="input-group-btn">
								<button class="productBtn btn btn-default" id="productBtn" data-toggle="modal" data-target="#myModal" type="button"><i class="fa fa-search"></i></button>
							</span>
						</div>	 
		            </div>
		            <label class="control-label col-sm-3" for="category_name">카테고리</label>
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
	        
			    <div class="form-group">
		            <label class="control-label col-sm-3" for="invoice_date_from">인보이스 날짜(From)</label>
		            <div class="col-sm-3" >
						<input type="date"	class="form-control date-picker" id="invoice_date_from"	name="invoice_date_from" maxlength="10" value="${invoice_date_from }">
		            </div>
		            <label class="control-label col-sm-3" for="invoice_date_to">인보이스 날짜(To)</label>
		            <div class="col-sm-3">
		                <input type="date"	class="form-control date-picker" id="invoice_date_to" name="invoice_date_to" maxlength="10" value="${invoice_date_to }">
		            </div>
		        </div>
	        
	        
			    <div>
					<button type="submit" id="btnSearch" class="btn btn-primary">조회</button>
				</div>
			</form>
		
			<div>
				<table id="datatable" 
					class="table table-bordered table-hover table-striped"  
					style="width:100%">
					<thead>
						<tr>
							<th style="background-color: #eeeeee">client_name</th>
							<th style="background-color: #eeeeee">invoice_id</th>
							<th style="background-color: #eeeeee">total_amt</th>
							<th style="background-color: #eeeeee">shipping_address</th>
							<th style="background-color: #eeeeee">invoice_date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="invoice" items="${invoiceList}">
						<tr>
							<td align=left>${invoice.client_name }</td>
							<td align=left><a href="invoice_updateform?invoice_id=${invoice.invoice_id}">${invoice.invoice_id}</a></td>
							<td align=left><fmt:formatNumber type="number" maxFractionDigits="3" value="${invoice.total_amt }" pattern="#,#00.0#"/></td> 
							<td align=left>${invoice.shipping_address }</td>
							<td align=left>${invoice.invoice_date }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
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
			//데이터테이블 초기화
			Fn_Init_Datatable();

			//search 
			$('#btnSearch').on('click', function (e) {
				e.preventDefault(); 	
				Fn_Search_Invoice();
			});

			//Client modal open
			//clicked clientBtn
			$('#clientBtn').on('click', function () {
				var client_name = $('#client_name').val();
				Fn_Client_Modal(client_name);
			});
			
			//clicked client input box
			$('#client_name').on('change', function () {
				var client_name = $(this).val();
				Fn_Client_Modal(client_name);
			});

			//product modal open
            //when clicked product select button
            $('#productBtn').on('click', function () {
            	var product_name = $('#product_name').val();
            	Fn_Product_Modal(product_name);
            });
			
          	//when changed product name input box
            $('#product_name').on('change', function () {
                var product_name = $(this).val();
                Fn_Product_Modal(product_name);
            });

			//search category modal
            //when clicked category select button
            $('#categoryBtn').on('click', function () {
            	var category_name = $('#category_name').val();
                Fn_Category_Modal(category_name);
            });
			
          	//search category modal when changed category input box
            $('#category_name').on('change', function () {
                var category_name = $(this).val();
                Fn_Category_Modal(category_name);
            });
		})	//end of ready()

		//데이터테이블 초기화
		function Fn_Init_Datatable(){
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
		        	"scrollCollapse": true,
			    	"processing": true,
			    	"lengthChange": false,
			    	"searching": true,
			    	"order": [[ 1, "desc" ]],	//default order column index and sort direction
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
		                }
					], 
			        fixedColumns: true
			 });	//end of datatable
		}
		
		//search product(actually used)
		function Fn_Search_Invoice() {
			var url = getContextPath() + "/sales/invoice_list_search";
			var data = $("form[name=invoiceForm]").serializeObject();
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
			                }
						], 
						fixedColumns: true,
				    	"columns": [
			                    { 
			                    	"data": "client_name", "name": "client_name", "width": "100px",
			                    	"render": function (data, type, full, meta) {
			                    		return $('<a>').attr('href', 'invoice_updateform?invoice_id=' + full.invoice_id).text(data).wrap('<td></td>').parent().html();
			                    	}			
			                    },
			                    { "data": "invoice_id", "name": "invoice_id", "width": "100px",
			                    	"render": function (data, type, full, meta) {
			                    		return $('<a>').attr('href', 'invoice_updateform?invoice_id=' + full.invoice_id).text(data).wrap('<td></td>').parent().html();
			                    	}			
			                    },
			                    { 
			                      "data": "total_amt", "name": "total_amt", "width": "100px", 
			                      "render" : $.fn.dataTable.render.number( ',', '.', 1 )
			                    },
			                    { "data": "shipping_address", "name": "shipping_address", "width": "100px" },
			                    { "data": "invoice_date", "name": "invoice_date", "width": "100px" }
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

		
		//Open Client Madal Dialog
        function Fn_Client_Modal(client_name) {
            var url = getContextPath() + "/sales/client_modal";
            //alert(encodeURIComponent(productName));
            var data = {client_name: client_name};

            $.ajax({
                type: "GET",
                url: url,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "html",
                success: function (data) {
                	//console.log(data);
                    $('#myModalContent').html(data);
                    $('#myModal').modal('show');
                },
                failure: function (data) {
                    alert(data.responseText);
                },
                error: function (data) {
                    alert(data.responseText);
                }
            });
        }

		
        //search product with ajax
        function Fn_Product_Modal(productName) {
            var url = getContextPath() + "/sales/product_modal_general";
            var data = {product_name: productName}
            $.ajax({
                type: "GET",
                url: url,
                data: data,
                contentType: "application/json; charset=utf-8",
                dataType: "html",
                success: function (data) {
                    $('#myModalContent').html(data);
                    $('#myModal').modal('show');
                }, failure: function (data) {
                    alert(data.responseText);
                }, error: function (data) {
                    alert(data.responseText);
                }
            });
        }

		//search category with ajax
        function Fn_Category_Modal(category_name) {
            var url = getContextPath() + "/sales/category_modal";
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
                    alert(data.responseText);
                },
                error: function (data) {
                    alert(data.responseText);
                }
            });
        }
        
	</script>	
