<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>

<article>
    <div id="join">
        <h3 class="text-center text-white pt-5"></h3>
        <div class="container">
            <div id="join-row" class="row justify-content-center align-items-center">
                <div id="join-column" class="col-md-6">
                    <div id="join-box" class="col-md-12">
                        <form id="joinForm" class="form" name="form"
                        	action="${pageContext.request.contextPath}/joinAction" 
                        	method="POST">
                            <h3 class="text-center text-info">Join</h3>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 							<!-- id -->
                            <div class="form-group">
                                <label for="username" class="text-info">Id:</label><br>
                                <span>
                                	<input type="text" name="user_id" id="user_id" class="form-control" required="required">
                                	<input type="hidden" name="reid" id="id_check" value="no">
                                </span>
                                <span class="error_next_box"> </span>
                                <div class="check_font" id="id_error_msg"></div>
                            </div>
                            <!-- password -->
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <span>
                                	<input type="password" name="user_pwd" id="user_pwd" class="form-control" required="required">
                                	<input type="hidden" id="pwd_check" value="no">
                                </span>
                                <div class="check_font" id="pwd_error_msg"></div>
                            </div>
                            <!-- password confirm -->
                            <div class="form-group">
                                <label for="passwordConfirm" class="text-info">Password Confirm:</label><br>
                                <span>
                                	<input type="password" name="password" id="pwdConfirm" class="form-control" required="required">
                                	<input type="hidden" id="pwdConfirm_check" value="no">
                                </span>
                                <span class="error_pwdConfirm"></span>
								<div class="check_font" id="pwdConfirm_error_msg"></div>
                            </div>
                            
                 			<!-- Name -->
                            <div class="form-group">
                                <label for="name" class="text-info">Name:</label><br>
                                <span>
                                	<input type="text" name="user_name" id="user_name" class="form-control" required="required">
                                	<input type="hidden" id="user_name_check" value="no">
                                </span>
                               	<span class="error_next_box"></span>
								<div class="check_font" id="name_error_msg"></div>
                            </div>
                 			<!-- Email -->
                            <div class="form-group">
                                <label for="name" class="text-info">Email(ex. abc@naver.com):</label><br>
                                <span>
                                	<input type="email" name="email" id="email" class="form-control">
                                	<input type="hidden" id="email_check" value="no">
                                </span>
								<span class="error_next_box"></span>
								<div class="check_font" id="email_error_msg"></div>
                            </div>
                 			<!-- phone -->
                            <div class="form-group">
                                <label for="name" class="text-info">Phone(ex. 010-1234-5678):</label><br>
                                <span>
                                	<input type="tel" name="phone" id="phone" class="form-control">
	                               	<input type="hidden" id="phone_check" value="no"> 
                                </span>
								<span class="error_next_box"></span>
								<div class="check_font" id="phone_error_msg"></div>
                            </div>
                 			<!-- zip code -->
                            <div class="form-group">
                                <label for="name" class="text-info">Zip_code:</label><br>
                                <div id="bir_wrap">
                                	<div id="bir_yy">
		                                <span>
		                                	<input type="text" name="zip_num" id="zip_num" class="form-control" size="10" maxlength="6">
		                                </span>
									</div>
									<div id="bir_mm">
										<span > 
											<input type="button" id="btnZipNum" value="주소찾기" class="btn btn-default">
										</span>
									</div>
								</div>
                				<span class="error_next_box"></span>
                           </div>
                 			<!-- Address -->
                            <div class="form-group">
                                <div id="bir_wrap">
                                	<div id="bir_yy">
		                                <span>
		                                	<input type="text" name="address1" id="address1" class="form-control" size="500" maxlength="30">
		                                </span>
									</div>
						                 <span>
		                                	<input type="text" name="address2" id="address2" class="form-control" size="50" maxlength="30">
		                                </span>
									</div>
									<input type="hidden" id="address_check" value="no">
	                				<span class="error_next_box"></span>
	                				<div class="check_font" id="address_error_msg"></div>
                           </div>
                           
							<div class="form-group">
					            <div>
					                <input type="submit" id="btnJoin" name="btnJoin" class="btn btn-block btn-success btn-flat" value="submit">
					                <button type="button" id="btnInit" name="btnInit" class="btn btn-block btn-success btn-flat"><span class="hide-on-mobile">Init Component value</span>&nbsp;<i class="fa fa-save"></i></button>
					            </div>
					            <span id="joinError" style="color:red"></span>
							</div>
                   		</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
</html>