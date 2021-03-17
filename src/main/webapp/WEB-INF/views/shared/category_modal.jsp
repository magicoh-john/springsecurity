<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="container" style="width:400px;">
	    <nav class="navbar navbar-default">
			<form  name="category_modal_form" class="navbar-form pull-right" >
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" id="category_id" name="category_id" />
				<input type="text" id="category_name_m" name="category_name" class="form-group category_name" placeholder="검색" value="${category_name}" />
				<button type="submit" id="btnSearch_m" class="btn btn-success">조회</button>
			</form>
	    </nav>
		<div class="row">
			<div>
				<table id="category_datatable" class="table table-bordered table-hover table-striped"  style="width:100%">
					<thead>
						<tr>
							<th style="background-color: #eeeeee">category_id</th>
							<th style="background-color: #eeeeee">category_name</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${categoryList}">
						<tr>
							<td align=left>${category.category_id }</td>
							<td align=left><a href="#">${category.category_name}</a></td>
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
			table =  $('#category_datatable').removeAttr('width').DataTable({
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
		                }
					], 
			        fixedColumns: true
			 });	//end of datatable
			// search btn click            
            $('#btnSearch_m').on('click', function () {
            	event.preventDefault(); //모달 창에서 조회했을 때 팝업이 닫히는 문제를 막아줌.	
            	var category_name = $('.category_name').val();
                Fn_Search_Category(category_name);
            });
            
            //Attaches click events for newly added rows. 
            $("#category_datatable").on("click", "a", function(event) { 
				var temp = $(this);
				Fn_Click_CategoryName(temp);
			});

            //click specified category name(when the popup dialog first opened)
			$('#category_datatable a').on("click", function(event){
				var temp = $(this);
				Fn_Click_CategoryName(temp);
			});	
            
		});	//end of ready()
		
		//get ContextPath value saved through header.jsp file
// 		function getContextPath() {
// 			return sessionStorage.getItem("contextpath");
// 		}
		
		//send the selected category name to parents window
		function Fn_Click_CategoryName(that) {
			var row = that.closest("tr");
			var td = row.find("td");
			var categoryId = td.eq(0).html().trim();
			var categoryName = td.eq(1).text();	//a href가 있어서 text()

	        $('#category_id').val(categoryId);
	        $('#category_name').val(categoryName);
	        $('#myModal').modal('hide');
		}

		//search category in category modal dialog
		function Fn_Search_Category(category_name) {
			event.preventDefault();
			var url = getContextPath() + "/sales/category_modal_search";
			var data = $("form[name=category_modal_form]").serializeObject();
			$.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(data),
               //setting before ajax call for spring security
                beforeSend: function(xhr){
                	var csrf_tocken = $("meta[name='_csrf']").attr("content");
                	var csrf_header = $("meta[name='_csrf_header']").attr("content");
                	xhr.setRequestHeader(csrf_header, csrf_tocken);
               	},
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					console.log(data);
					//delete instance of datatable if aleady instance
					if ($.fn.dataTable.isDataTable('#category_datatable')) {
						//alert('aleady instincaited');
             		    $('#category_datatable').DataTable().clear().destroy();               
            		}
					$('#category_datatable').DataTable({
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
			                }
						], 
						"columns": [
		                    { "data": "category_id", "name": "category_id", "width": "100px"},
		                    { 
		                    	"data": "category_name", "name": "category_name", "width": "100px",
		                    	"render": function (data, type, full, meta) {
		                    		return $('<a>').attr('href', '#').text(data).wrap('<td></td>').parent().html();
		                    	}			
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
		}	//end of Fn_Search_Category

	</script>	
</body>
</html>