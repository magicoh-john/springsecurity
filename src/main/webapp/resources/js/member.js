$(document).ready(function() {

	//[join] btnSave button click event handler			
	$("#btnJoin").click(function() {
		//e.preventDefault();	// 걸면  submit() 안됨(주의)
		fn_join_save();
	});

	//[join]id duplication check with Ajax call
	$("#user_id").blur(function(e) {
		
		e.preventDefault();
		fn_id_dup_check();
	});

	//[join] check password validation		
	$("#user_pwd").change(function(e) {
		e.preventDefault();
		fn_pwd_check();
	});

	//[join] campare password + confirm password
	$("#pwdConfirm").change(function(e) {
		e.preventDefault();
		fn_pwd_confirm_check();
	});

	//[join] name validation
	$("#user_name").change(function(e) {
		e.preventDefault();
		fn_name_check();
	});

	//[join] email validation
	$("#email").change(function(e) {
		e.preventDefault();
		fn_email_check();
	});

	//[join] phone number validation
	$("#phone").change(function(e) {
		e.preventDefault();
		fn_phone_check();
	});

	//[login] btn click event handler			
	$("#btnLogin").click(function() {
		var id = $.trim($("#id").val()); 
		var pwd = $.trim($("#pwd").val()); 
		if (id == "") {
			$("#login_id_error").css("color", "red");
			$("#login_id_error").text("아이디를 입력하세요.");
			$('#id').focus();			
			return false;
		} 
		if (pwd == "") {
			$("#login_pwd_error").css("color", "red");
			$("#login_pwd_error").text("비밀번호를 입력하세요.");
			$('#pwd').focus();			
			return false;
		}
	});
	
	//[login] btn click event handler			
	$("#btnZipNum").click(function() {
		fn_zip_num();
	});
	
});	//end of ready()


//[join]save all
function fn_join_save() {
	
	if($("#id_check").val() == 'no'){
		$('#id_error_msg').text("아이디를 확인하세요.");
		$('#id_error_msg').css('color', 'red');
		$('#user_id').focus();
	} else if($("#pwd_check").val() == 'no'){
		$("#pwd_error_msg").css("color", "red");
		$("#pwd_error_msg").text("비밀번호를 확인하세요.");
		$('#user_pwd').focus();
	} else if($("#pwdConfirm_check").val() == 'no'){
		$("#pwdConfirm_error_msg").css("color", "red");
		$("#pwdConfirm_error_msg").text("비밀번호(확인)을 확인하세요.");
		$('#pwdConfirm').focus();		
	} else if($("#user_name_check").val() == 'no'){
		$("#name_error_msg").css("color", "red");
		$("#name_error_msg").text("이름을 확인하세요.");
		$('#user_name').focus();		
	} else if($("#email_check").val() == 'no'){
		$("#email_error_msg").css("color", "red");
		$("#email_error_msg").text("이메일을 확인하세요.");
		$('#email').focus();		
	} else if($("#phone_check").val() == 'no'){
		$("#phone_error_msg").css("color", "red");
		$("#phone_error_msg").text("전화번호를 확인하세요.");
		$('#phone').focus();		
	} else if($("#address_check").val() == 'no'){
		$("#address_error_msg").css("color", "red");
		$("#address_error_msg").text("주소를 확인하세요.");
		$('#address2').focus();		
	}
}

//get ContextPath value saved through header.jsp file
function getContextPath() {
	return sessionStorage.getItem("contextpath");
}

//주소찾기 버튼 클릭시 호출
function fn_zip_num() {
	var url = getContextPath() + "/zipNum";
	window.open(url, "_blank_1",
		"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=300, top=300, left=300, ");
}

//id validation 
function fn_id_dup_check(){
	$("#id_check").val('no');					//id validation init
	var id = $.trim($("#user_id").val());
	if (id == "") {
		$('#user_id').focus();
		return false;
	}
	var url = getContextPath() + "/checkId";
	$.ajax({
		url: url,
		type: 'POST',
		data: { id: id },
		dataType: "text",
		beforeSend: function(xhr){
			var csrf_tocken = $("meta[name='_csrf']").attr("content");
            var csrf_header = $("meta[name='_csrf_header']").attr("content");
            xhr.setRequestHeader(csrf_header, csrf_tocken);
    	},
		success: function(data) {
			console.log("Id 중복 체크 결과 data : " + data);
			if (data == "1") { 			// 아이디 중복
				$("#id_error_msg").text("이미 사용중인 아이디입니다.");
				$("#id_error_msg").css("color", "red");
				$('#user_id').focus();
				$("#id_check").val('no');	//id check no!!
				return false;
			} else {					// 중복아니므로 아이디 적합성 검사 
				$('#id_error_msg').text('');
				//id check regex
				if (!id_check(id)) {
					$('#id_error_msg').text('아이디는 영문 대소문자와 숫자 포함 4~12자리로 입력하세요.');
					$('#id_error_msg').css('color', 'red');
					$('#user_id').focus();
					return false;
				}
				$('#id_error_msg').text('적합한 아이디입니다.');
				$('#id_error_msg').css('color', 'blue');
				$("#id_check").val('yes');	//id check ok!!
			}
		},
		error: function(xhr, status, error) {
			if (xhr.status == 401 || xhr.status == 400) {
				console.log( "code:" + xhr.status+"\n" + "message:" + xhr.responseText+"\n" + "error:" + error );
				// 로그인 안된 상태에서 ajax call 했을 경우 사용
				//if (confirm("로그인이 필요합니다. 지금 바로 로그인하시겠습니까?")) {
				//	window.open(contextPath + "/login", "_self");
				//}
			}
			else {
				alert(xhr.status + ": " + error);
			}
		}
	});
}

//only id validation 
//function fn_id_check(){
//	$("#id_check").val('no');					//id validation init
//	var id = $.trim($("#user_id").val());
//	if (id == "") {
//		$("#id_error_msg").css("color", "red");
//		$("#id_error_msg").text("아이디를 입력하세요.");
//		$('#user_id').focus();
//		return false;
//	}
//
//	if (!id_check(id)) {				// id check regexp
//		$("#id_error_msg").css("color", "red");
//		$("#id_error_msg").text('아이디는 영문 대소문자와 숫자 포함 4~12자리로 입력하세요.');
//		$("#user_id").focus();
//		return false;
//	}
//	$("#id_check").val('yes');
//}


//password validation
function fn_pwd_check(){
	$("#pwd_check").val('no');					//pwd validation init
	var pwd = $.trim($("#user_pwd").val());
	
	if (pwd == "") {						//password empty
		$("#pwd_error_msg").css("color", "red");
		$("#pwd_error_msg").text("비밀번호를 입력하세요.");
		$('#user_pwd').focus();
		return false;
	}

	if (!pwd_check(pwd)) {				// password check regexp
		$("#pwd_error_msg").css("color", "red");
		$("#pwd_error_msg").text('비밀번호는 영문 대소문자와 숫자 포함 4~12자리로 입력하세요.');
		$("#user_pwd").focus();
		return false;
	}

	$("#pwd_error_msg").css("color", "blue");
	$('#pwd_error_msg').text('적합한 비밀번호입니다.');
	$("#pwd_check").val('yes');		//password check ok!!
	return true;
}

//password confirm validation
function fn_pwd_confirm_check(){
	$("#pwdConfirm_check").val('no');
	if ($.trim($("#user_pwd").val()) != $.trim($("#pwdConfirm").val())) {
		$("#pwdConfirm_error_msg").css("color", "red");
		$("#pwdConfirm_error_msg").text("비밀번호가 일치하지 않습니다.");
		$("#pwdConfirm").focus();
		return false;
	}
	$("#pwdConfirm_error_msg").css("color", "blue");
	$("#pwdConfirm_error_msg").text('비밀번호가 일치합니다.');
	$("#pwdConfirm_check").val('yes');		//pwd validation ok!! 
	return true;
}

//user name validation
function fn_name_check(){
	$("#user_name_check").val('no');
	var name = $.trim($("#user_name").val());
	if (name == "") {						
		$("#name_error_msg").css("color", "red");
		$("#name_error_msg").text("이름을 입력하세요.");
		$('#user_name').focus();
		return false;
	}
	$("#name_error_msg").css("color", "blue");
	$("#name_error_msg").text('적합한 이름입니다.');
	$("#user_name_check").val('yes');
	return true;
}

//email validation
function fn_email_check(){
	$("#email_check").val('no');
	var email =  $.trim($("#email").val());
	$("#reemail").val('no');						//email validation init
	if (email == ''){
		$("#email_error_msg").css("color", "red");
		$("#email_error_msg").text("이메일을 입력하세요.");
		return false;
	}
	if (!email_check(email)) {	//check email type regexp
		$("#email_error_msg").text("잘못된 형식의 이메일 주소입니다.예)dream@naver.com");
		$("#email_error_msg").css("color", "red");
		$('#email').focus();
		return false;
	}
	$("#email_error_msg").css("color", "blue");
	$("#email_error_msg").text("적합한 이메일 주소입니다.");		
	$("#email_check").val('yes');							//email validation ok!!
	return true;	
}

//phone number validation
function fn_phone_check(){
	$("#phone_check").val('no');
	var phone = $.trim($("#phone").val());
	$("#rephone").val('no');							//phone validation init
	if (phone == '')
		return false;
	if (!isCelluar(phone)) {
		$("#phone_error_msg").css("color", "red");
		$("#phone_error_msg").text("잘못된 형식의 전화번호입니다. 예)010-2345-6789");
		$('#phone').focus();
		return false;
	}
	$("#phone_error_msg").css("color", "blue");
	$("#phone_error_msg").text("적합한 전화번호입니다.");
	$("#phone_check").val('yes');							//phone validation ok!!
	return true;
}

//address validation(zip_num, address1, address2)
function fn_address_check(){
	$("#address_check").val('no');
	var zip_num = $.trim($("#zip_num").val());
	var address1 = $.trim($("#address1").val());
	var address2 = $.trim($("#address2").val());
	
	if (zip_num == "" || address1 == "" || address2 == "") {
		$("#address_error_msg").css("color", "red");
		$("#address_error_msg").text("주소를 확인하세요.");
		$('#address2').focus();
		return false;
	}
	$("#address_check").val('yes');
	return true;
}

//get input value size entered when join
function getTextLength(str) {
	var len = 0;
	for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
			len++;
		}
		len++;
	}
	return len;
}

//id regexp validation
function id_check(id) {
	var regex = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사 RegExp
	return (id != '' && id != 'undefined' && regex.test(id));
}

// password regexp validation
function pwd_check(pwd) {
	var regex = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사(숫자 문자 포함 4~12자리) RegExp
	return (pwd != '' && pwd != 'undefined' && regex.test(pwd));
}

// email regexp validation
function email_check(email) {
	var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return (email != '' && email != 'undefined' && regex.test(email));
}

// phone regexp validation
function isCelluar(asValue) {
	var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

// return post number to the parent screen
function returnZipNum(zip_num,sido,gugun,dong) {
	opener.document.getElementById("zip_num").value = zip_num;
	opener.document.getElementById("address1").value = sido+" "+gugun+" "+dong;
	opener.document.getElementById("address2").value = dong;
	opener.document.getElementById("address_check").value = 'yes';
   	self.close();
}

/**
 * 회원가입 > 약관동의 화면에서 [Next] 버튼 클릭시 호출
 * **/
/*
function go_next() {
	if (document.joinForm.okon1[0].checked == true) {
		document.formm.action = "ShoppingServlet?command=join_form";
		document.formm.submit();
	} else if (document.formm.okon1[1].checked == true) {
		alert('회원가입 이용 약관에 동의해주세요.');
	}
*/

