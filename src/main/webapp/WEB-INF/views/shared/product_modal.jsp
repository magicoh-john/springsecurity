<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<div class="container" style="width:400px;">
	    <nav class="navbar navbar-default">
	        <form action="${pageContext.request.contextPath}/sales/product_modal" method="GET">
	        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	        	<input type="hidden" id="parentsLowNo" value="${parentsLowNo}" />
                <div class="form-group">
	                <a href="#" class="navbar-brand">Search</a>
                    <input type="text" id="product_name" name="product_name" class="form-group product_name" placeholder="검색" value="${product_name}" />
                    <button type="button" id="btnSearch" class="btn btn-success">search</button>
                </div>
	         </form>       
	    </nav>
		<div class="row">
			<div>
				<table class="table table-bordered table-hover table-striped" id="datatable" style="width:100%">
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
		$(document).ready(function(){
			//search
            $('#btnSearch').on('click', function () {
            	event.preventDefault(); //모달 창에서 조회했을 때 팝업이 닫히는 문제를 막아줌.	
            	var product_name = $('.product_name').val();
                Fn_Search_Product(product_name);
            });

            //Attaches click events for newly added rows. 
//             $("#datatable").on("click", "a", function(event) { 
//             	alert("click events for newly added rows");
// 				var temp = $(this);
// 				Fn_Click_ProductName(temp);
// 			});

            //click specified client name(when the popup dialog first opened)
			$('#datatable a').on("click", function(event){
				var temp = $(this);
				Fn_Click_ProductName(temp);
			});	

		});	//end of ready()
		
		//pass the selected product info to parent table
		function Fn_Click_ProductName(that){
			var row = that.closest("tr");
			var td = row.find("td");
			var productId = td.eq(0).html();  			  	//product Id in modal dialog
			var productName = td.eq(1).text();				//row.find("td").eq(1).html(); <-- 주석처럼 하면 <a href="~~">값까지 갖고옴"
	        var productPrice = td.eq(2).html(); 			//product Price in modal dialog
	        var parentsLowNo = $('#parentsLowNo').val();    //Parents row number hidden field
	        
	       //Check Dubplicate purduct Id in parents table
	        var isDup = Fn_IsDuplicate_Items(productId);
	        if (isDup) {
	            if (confirm('Duplicate product exist. Would you like to continue?')) {
	                table.cell(parentsLowNo, 1).nodes().to$().find('input').val(productName);   
	                table.cell(parentsLowNo, 2).nodes().to$().find('input').val(parseInt(productId));
	                table.cell(parentsLowNo, 3).nodes().to$().find('input').val(productPrice);
	                $('#myModal').modal('hide'); 
	            }
	            else {
	                return false;
	            }
	        }
	        
			table.cell(parentsLowNo, 1).nodes().to$().find('input').val(productName);
	        table.cell(parentsLowNo, 2).nodes().to$().find('input').val(parseInt(productId));
	        table.cell(parentsLowNo, 3).nodes().to$().find('input').val(productPrice);
	        $('#myModal').modal('hide');
		}
		
		
		//Check duplicate productId from parents table
		function Fn_IsDuplicate_Items(productId) {
	        var dup = false;
	        $('#invoiceDetails tbody tr').each(function (index, ele) {
	            var pid = table.cell(this, 2).nodes().to$().find('input').val();       //each productId in parent productId
	            if (productId.trim() == pid.trim()){
	            	dup = true;
	            	return false;
	            }
	        });
	        return dup;
	    }
		
		//search client (actually use)
		function Fn_Search_Product(product_name) {
			var url = getContextPath() + "/sales/product_modal_search";
			var data = {product_name: product_name};
			$.ajax({
				type : "GET",
				url : url,
				data : data,
				contentType : "application/json; charset=utf-8",
				dataType : "html",
				success : function(response) {
					//alert(response);
					var jasonData = JSON.parse(response);
					$('#datatable tr:not()').remove();
	
					var text = "";
					text += "<tr>\n";
					text += "<th style='background-color: #eeeeee; text-align:center;'>product_id</th> \n";
					text += "<th style='background-color: #eeeeee; text-align:center;'>product_name</th> \n";
					text += "<th style='background-color: #eeeeee; text-align:center;'>unit_price</th> \n";
					text += "</tr>\n";
					for (var i = 0; i < jasonData.length; i++) {
						text += "<tr>\n";
						text += "<td>" + jasonData[i].product_id
								+ "</td>\n";
						text += "<td><a href='#'>"
								+ jasonData[i].product_name
								+ "</a></td>\n";
						text += "<td>" + jasonData[i].unit_price
								+ "</td>\n";
						text += "</tr>\n";
					}
					$('#datatable').append(text);
				},
				failure : function(response) {
					alert(response);
				},
				error : function(response) {
					alert(response);
				}
			});
		}		
		
	</script>	
</body>
</html>