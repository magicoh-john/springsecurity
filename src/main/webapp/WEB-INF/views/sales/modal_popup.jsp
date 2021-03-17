<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/shared/header.jsp" %>

<div class="container">
	
	  <h2>Modal Example</h2>
	


	<a data-toggle="modal" href="modal_popup.jsp" data-target="myModal">Click me</a>
	
	<a href="javascript:$('myModal .modal-body').load('modal_popup.jsp',function(e){$('#myModal').modal('show');});">Click me</a>


    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" id="closbtn" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Product</h4>
                </div>
                <div id="myModalContent" class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

	<button type="button" class="btn btn-info btn-lg" onclick="show('aaa')">Open Modal</button>

	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
 		 Launch demo modal
	</button>
	
	 <button data-target="#myModal" data-toggle="modal" data-backdrop="static" data-keyboard="false">
    	Launch demo modal
 	</button>`
	
</div>

	<!-- jQuery link -->	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- jQuery UI Library -->
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<!-- Bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



 	<script type="text/javascript"> 
// 		function show(str){
// 			var options = { "backdrop": "static", keyboard: true };
// 		    $("#myModalContent").html("<table border='1'><tr><td>번호</td><td>이름</td></tr> <tr><td>1</td><td>홍길동</td></tr><tr><td>2</td><td>이순신</td></tr><tr><td>2</td><td>킹세종이름</td></tr></table>");
// 		    $('#myModal').modal(options);
// 		    $('#myModal').modal('show');
// 		}
	
		$('#myModal').on('show.bs.modal', function(){
			alert("show.bs.modal");
			var data = "<table border='1'><tr><td>번호</td><td>이름</td></tr> <tr><td>1</td><td>홍길동</td></tr><tr><td>2</td><td>이순신</td></tr><tr><td>2</td><td>킹세종이름</td></tr></table>";
		    $.get("modal_popup.jsp", function(data){
		        $('#myModal').find('.myModalContent').html(data);
		    });
		});
	</script> 
    
	
	
</body>
</html>