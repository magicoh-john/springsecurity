<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>

	<div class="container">
		<div class="content-container">
            <section>
            </section>
        </div>
		<div class="row">
			<div>
				<p>
				    <button type="button" class="btn btn-success" onclick="location.href='insert_form'"><i class="fa fa-plus"></i> 카테고리 등록</button>
				</p>
			</div>
		
			<div>
				<table class="table table-bordered table-hover table-striped" id="datatable" style="width:100%">
					<thead>
						<tr>
							<th style="background-color: #eeeeee">category_id</th>
							<th style="background-color: #eeeeee">category_name</th>
							<th style="background-color: #eeeeee">description</th>
							<th style="background-color: #eeeeee">is_active</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="category" items="${categoryList}">
						<tr>
							<td align=left>${category.category_id }</td>
							<td align=left><a href="${pageContext.request.contextPath}/product/category_view?category_id=${category.category_id}">${category.category_name}</a></td>
							<td align=left>${category.description }</td>
							<td align=left>${category.is_active }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	
<!-- 	<script type="text/javascript" src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script> -->
<!-- 	<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script> -->
		
	<script>
		$(document).ready(function(){
			$("#datatable").DataTable();
		})
	</script>	
		
<%@ include file="/WEB-INF/views/shared/footer.jsp" %>