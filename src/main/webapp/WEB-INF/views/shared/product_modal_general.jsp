<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<div class="container" style="width:400px;">
	    <nav class="navbar navbar-default">
	        <form name="product_modal_form" class="navbar-form pull-right">
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        	<input type="hidden" id="product_id" name="product_id" />
                <div class="form-group">
	                <a href="#" class="navbar-brand">Search</a>
                    <input type="text" id="product_name_m" name="product_name" class="form-group product_name" placeholder="검색" value="${product_name}" />
                    <button type="submit" id="btnSearch_m" class="btn btn-success">search</button>
                </div>
	         </form>       
	    </nav>
		<div class="row">
			<div>
				<table id="product_datatable" class="table table-bordered table-hover table-striped"  style="width:100%">
					<thead>
						<tr>
							<th style="background-color: #eeeeee">product_id</th>
							<th style="background-color: #eeeeee">product_name</th>
							<th style="background-color: #eeeeee">unit_price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
						<tr>
							<td align=left>${product.product_id }</td>
							<td align=left><a href="#">${product.product_name}</a></td>
							<td align=left>${product.unit_price }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		
	<script>
		var table ;
		$(document).ready(function(){
	        //search when the modal is first opened
			table =  $('#product_datatable').removeAttr('width').DataTable({
					select: true,
			    	"processing": true,
			    	"lengthChange": true,
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
		                }
					], 
			        fixedColumns: true
			 });	//end of product_datatable
			 
			// search btn click 
            $('#btnSearch_m').on('click', function () {
            	event.preventDefault(); //모달 창에서 조회했을 때 팝업이 닫히는 문제를 막아줌.	
            	var product_name = $('#product_name_m').val();
                Fn_Search_Product(product_name);
            });

            //Attaches click events for newly added rows. 
//             $("#product_datatable").on("click", "a", function(event) { 
//             	alert("click events for newly added rows");
// 				var temp = $(this);
// 				Fn_Click_ProductName(temp);
// 			});

            //click specified client name(when the popup dialog first opened)
			$('#product_datatable a').on("click", function(e){
				var temp = $(this);
				Fn_Click_ProductName(temp);
			});	

		});	//end of ready()
		
		//send the selected product name to parents window
		function Fn_Click_ProductName(that) {
			var row = that.closest("tr");
			var td = row.find("td");
			var productId = td.eq(0).html().trim();
			var productName = td.eq(1).text();	//a href가 있어서 text()

	        $('#product_id').val(productId);
	        $('#product_name').val(productName);
	        $('#myModal').modal('hide');
		}

		//search product in product modal dialog
		function Fn_Search_Product(product_name) {
			var url = getContextPath() + "/sales/product_modal_search_general";
			var data = {product_name : product_name};
			$.ajax({
				type : "GET",
				url : url,
				data : data,
                //[Get 방식에서는 필요없음]setting before ajax call for spring security
                //beforeSend: function(xhr){
                //	var csrf_tocken = $("meta[name='_csrf']").attr("content");
                //	var csrf_header = $("meta[name='_csrf_header']").attr("content");
                //	xhr.setRequestHeader(csrf_header, csrf_tocken);
               	//},
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					console.log(data);
					//delete instance of product_datatable if aleady instance
					if ($.fn.dataTable.isDataTable('#product_datatable')) {
						//alert('aleady instincaited');
             		    $('#product_datatable').DataTable().clear().destroy();               
            		}
					$('#product_datatable').DataTable({
				    	"data": data,
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
			                }
						], 
						"columns": [
		                    { "data": "product_id", "name": "product_id", "width": "100px"},
		                    { 
		                    	"data": "product_name", "name": "product_name", "width": "100px",
		                    	"render": function (data, type, full, meta) {
		                    		return $('<a>').attr('href', '#').text(data).wrap('<td></td>').parent().html();
		                    	}			
		                    },
		                    { "data": "unit_price", "name": "unit_price", "width": "100px"}
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

		
		//search client (actually use)
// 		function Fn_Search_Product(product_name) {
// 			var url = getContextPath() + "/sales/product_modal_search";
// 			var data = {product_name: product_name};
// 			$.ajax({
// 				type : "GET",
// 				url : url,
// 				data : data,
// 				contentType : "application/json; charset=utf-8",
// 				dataType : "html",
// 				success : function(response) {
// 					//alert(response);
// 					var jasonData = JSON.parse(response);
// 					$('#product_datatable tr:not()').remove();
	
// 					var text = "";
// 					text += "<tr>\n";
// 					text += "<th style='background-color: #eeeeee; text-align:center;'>product_id</th> \n";
// 					text += "<th style='background-color: #eeeeee; text-align:center;'>product_name</th> \n";
// 					text += "<th style='background-color: #eeeeee; text-align:center;'>unit_price</th> \n";
// 					text += "</tr>\n";
// 					for (var i = 0; i < jasonData.length; i++) {
// 						text += "<tr>\n";
// 						text += "<td>" + jasonData[i].product_id
// 								+ "</td>\n";
// 						text += "<td><a href='#'>"
// 								+ jasonData[i].product_name
// 								+ "</a></td>\n";
// 						text += "<td>" + jasonData[i].unit_price
// 								+ "</td>\n";
// 						text += "</tr>\n";
// 					}
// 					$('#product_datatable').append(text);
// 				},
// 				failure : function(response) {
// 					alert(response);
// 				},
// 				error : function(response) {
// 					alert(response);
// 				}
// 			});
// 		}		
		
	</script>	
</body>
</html>