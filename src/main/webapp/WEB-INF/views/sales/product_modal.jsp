<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--  Bootstrap CSS--> 
	<link href="css/bootstrap.css" rel="stylesheet"  />
	<!--  jQuery UI CSS--> 
	<link href="http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
	<!--  jQuery awesome font CSS-->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<!--  Datatable UI CSS--> 
	<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/custom.css" />
	
	<div class="container" style="width:400px;">
	    <nav class="navbar navbar-default">
	        <form action="boardList" method="get">
	                <div class="form-group">
		                <a href="#" class="navbar-brand">Search</a>
	                    <input type="text" id="product_name" name="product_name" class="form-group" />
	                    <button type="button" id="btnSearch" class="btn btn-success">search</button>
	                </div>
	         </form>       
	    </nav>
		<div class="row">
			<div>
				<table class="table table-bordered table-hover table-striped" id="datatable" style="width:50%">
					<thead>
						<tr>
							<th style="background-color: #eeeeee">product_id</th>
							<th style="background-color: #eeeeee">product_name</th>
							<th style="background-color: #eeeeee">brand</th>
							<th style="background-color: #eeeeee">unit_price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${productList}">
						<tr>
							<td align=left>${product.product_id }</td>
							<td align=left><a href="product_view?product_id=${product.product_id}">${product.product_name}</a></td>
							<td align=left>${product.brand }</td>
							<td align=left>${product.unit_price }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="parentLowNo" value="${parentLowNo}" />
	
	<script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
		
	<script>
		$(document).ready(function(){
			$("#datatable").DataTable({
				"paging": true,
				columnDefs: [
                    { "targets": 0, "orderable": false, 'width': '100px'   },
                    { "targets": 1, "orderable": false, 'width': '100px'  },
                    { "targets": 2, "orderable": false, 'width': '100px'  },
                    { "targets": 3, "orderable": false, 'width': '100px'  }
               ],
				"columns": [
                    { "data": "product_id"},
                    { "data": "product_name"},
                    { "data": "brand"},
                    { "data": "unit_price"}
                ]
            });
			
			$('a').on("click", function(event){
				event.preventDefault();
				
				var row = $(this).closest("tr");
				
				alert(row.find("td").eq(0).html());
				//var row = $(this).closest("tr");
				
				
				//alert('product_modal.jsp hi');
			});
			
		})
	</script>	
</body>
</html>