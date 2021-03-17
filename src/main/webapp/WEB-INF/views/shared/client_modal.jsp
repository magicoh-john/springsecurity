<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="container" style="width:400px;">
	    <nav class="navbar navbar-default">
			<form action="${pageContext.request.contextPath}/sales/client_modal" class="navbar-form pull-right" method="GET">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" id="client_id" name="client_id" />
				<input type="text" id="client_name_m" name="client_name" class="form-group client_name" placeholder="검색" value="${client_name}" />
				<button type="submit" id="btnSearch" class="btn btn-success">조회</button>
			</form>
	    </nav>
		<div class="row">
			<div>
				<table id="client_modal" class="table table-bordered table-hover table-striped"  style="width:100%">
					<thead>
						<tr>
							<th style="background-color: #eeeeee">client_id</th>
							<th style="background-color: #eeeeee">client_name</th>
							<th style="background-color: #eeeeee">address</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="client" items="${clientList}">
						<tr>
							<td align=left>${client.client_id }</td>
							<td align=left><a href="#">${client.client_name}</a></td>
							<td align=left>${client.address }</td>
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
            	var client_name = $('.client_name').val();
                Fn_Search_Client(client_name);
            });
            
            //Attaches click events for newly added rows. 
            $("#client_modal").on("click", "a", function(event) { 
            	//alert("click events for newly added rows");
				var temp = $(this);
				Fn_Click_ClientName(temp);
			});

            //click specified client name(when the popup dialog first opened)
			$('#client_modal a').on("click", function(event){
				//alert("a href click");
				var temp = $(this);
				Fn_Click_ClientName(temp);
			});	
            
		});	//end of ready()
		
		//put the selected client name to parents window
		function Fn_Click_ClientName(that) {
			var row = that.closest("tr");
			var td = row.find("td");
			var clientId = td.eq(0).html().trim();
			var clientName = td.eq(1).text();	//a href가 있어서 text()
	        var clientPrice = td.eq(2).html();

	        $('#client_id').val(clientId);
	        $('#client_name').val(clientName);
	        $('#myModal').modal('hide');
		}

		//search client (actually use)
		function Fn_Search_Client(client_name) {
			var url = getContextPath() + "/sales/client_modal_search";
			var data = {client_name: client_name};
			$.ajax({
				type : "GET",
				url : url,
				data : data,
				contentType : "application/json; charset=utf-8",
				dataType : "html",
				success : function(response) {
					//alert(response);
					
					//convert response data to javascript Object
					var jasonData = JSON.parse(response);
					$('#client_modal tr:not()').remove();
	
					var text = "";
					text += "<tr>\n";
					text += "<th style='background-color: #eeeeee; text-align:center;'>client_id</th> \n";
					text += "<th style='background-color: #eeeeee; text-align:center;'>client_name</th> \n";
					text += "<th style='background-color: #eeeeee; text-align:center;'>address</th> \n";
					text += "</tr>\n";
					for (var i = 0; i < jasonData.length; i++) {
						text += "<tr>\n";
						text += "<td>" + jasonData[i].client_id
								+ "</td>\n";
						text += "<td><a href='#'>"
								+ jasonData[i].client_name
								+ "</a></td>\n";
						text += "<td>" + jasonData[i].address
								+ "</td>\n";
						text += "</tr>\n";
					}
					$('#client_modal').append(text);
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