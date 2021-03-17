<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	<div class="container">
		<div class="row">
			<form method="post" action="member_update" name="updateForm">
				<table class="table table-bordered table-hover table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">사용자 정보 변경</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%">사용자명</td>
							<td colspan="2"><input type="text" class="form-control" name="product_name" maxlength="50" value="${map.customUser.user_name}"></td>
						</tr>
						<tr>
							<td style="width: 20%">비밀번호</td>
							<td colspan="2"><input type="text" class="form-control" name="product_name" maxlength="50" value=""></td>
						</tr>
						<tr>
							<td style="width: 20%">이메일</td>
							<td colspan="2"><input type="text" class="form-control" name="brand" maxlength="50" value="${map.customUser.email}"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td colspan="2"><input type="text" class="form-control"  name="description" maxlength="100" value="${map.customUser.phone}"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td colspan="2"><input type="text" class="form-control"  name="description" maxlength="100" value="${map.customUser.address1}"></td>
						</tr>
						<tr>
							<td>부서</td>
							<td colspan="2"><input type="text" class="form-control"  name="description" maxlength="100" value="${map.customUser.dept_id}"></td>
						</tr>
						<tr>
							<td>권한</td>
							<td colspan="2"><input type="text" class="form-control"  name="description" maxlength="100" value="${map.customUser.role_id}"></td>
						</tr>
					</tbody>
				</table>
				<div align="center">
					<input type="submit" class="btn btn-primary" name="btnSave" value="저장">
					<input type="button" class="btn btn-success" value="이전화면" onclick="goBack();" />
					<!-- <input type="button" class="btn btn-info" value="목록보기" onclick="location.href='product_list'" />  -->
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
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
			
			//save 
            $('#btnSave').on('click', function () {
            	alert('btnSave');
            	//event.preventDefault(); 	
                Fn_Update_Save();
            });
			
		});
		
		//prev screen
		function goBack(){
			window.history.back();
		}
		
		
		//수정사항 저장시 Validation
		function go_modify_save(pageNum, code) {
			var theForm = document.frm;

			if (theForm.kind.value == '') {
				alert('상품분류를 선택하세요');
				theForm.kind.focus();
			} else if (theForm.name.value == '') {
				alert('상품명을 입력하세요');
				theForm.name.focus();
			} else if (theForm.cost_price.value == '') {
				alert('원가를 입력하세요');
				theForm.cost_price.focus();
			} else if (theForm.list_price.value == '') {
				alert('판매가를 입력하세요');
				theForm.list_price.focus();
			} 

			else {
				if (confirm('수정하시겠습니까?')) {
					// [1] 상품을 삭제하지 않는 대신 사용하지 않음을 products 테이블의 useyn 컬럼에 1을 채워 넣기 위해서
					// useyn hidden 태그에 1을 지정한다.
					if (theForm.useyn.checked == true) {
						theForm.useyn.value = "y";
					}
					if(theForm.bestyn.checked == true) {
						theForm.bestyn.value = "y";
					}
					theForm.encoding = "multipart/form-data";
					// theForm.seq.value=seq;
					theForm.cost_price.value = removeComma(theForm.cost_price);
					theForm.list_price.value = removeComma(theForm.list_price);
					theForm.sales_margin.value = removeComma(theForm.sales_margin);
					// [2] products 테이블의 상품 정보를 수정하는 처리를 하는 product_modsave.jsp 페이지로
					// 이동하되 상품 코드를 전달해준다. 상품코드로 폴더를 생성해서 그곳에 이미지 파일을 업로드하기 때문이다.			
					theForm.action = "ShoppingServlet?command=admin_product_update&pageNum=" + pageNum;
					theForm.submit();
				}
			}
		}
		
	</script>	
	
</body>
</html>