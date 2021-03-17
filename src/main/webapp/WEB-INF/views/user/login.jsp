<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>

<article>
    <div id="login">
        <h3 class="text-center text-white pt-5"></h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" name="formm" id="login_form"
                        	action="<c:url value='/login?${_csrf.parameterName}=${_csrf.token}' />" 
                        	method="POST">
                            <h3 class="text-center text-info">Login</h3>
                            
                            <div class="form-group">
                                <label for="username" class="text-info">user_id:</label><br>
                                <span>
									<input type="text" name="user_id" id="id" class="form-control" required="required" autoFocus="autofocus" value="">
                                </span>
                                <span class="error_next_box"> </span>
								<div class="check_font" id="login_id_error"></div>
                            </div>
                            
                            <div class="form-group">
                                <label for="password" class="text-info">user_pwd:</label><br>
                                <span>
	                                <input type="password" name="user_pwd" id="pwd" class="form-control" required="required" value="">
                                </span>
                                <span class="error_next_box"></span>
								<div class="check_font" id="login_pwd_error"></div>
                            </div>

	                   		<c:if test="${error eq 'true'}">
	                   			<font color="red">
									${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}<br>
									<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
								</font>
							</c:if>

                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" id="btnLogin" class="btn btn-info btn-md" value="submit">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="${pageContext.request.contextPath}/join" class="text-info">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</article>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->





<%@ include file="/WEB-INF/views/shared/footer.jsp" %>