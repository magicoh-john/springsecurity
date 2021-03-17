<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Spring MyBatis Board</title>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/home">Spring Simple Invoice</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/qna_list">고객센터</a></li>
				<li><a href="${pageContext.request.contextPath}/product/category_insertform">카테고리 등록</a></li>
				<li><a href="${pageContext.request.contextPath}/product/category_list">카테고리 조회</a></li>
				<li><a href="${pageContext.request.contextPath}/product/product_insertform">제품 등록</a></li>
				<li><a href="${pageContext.request.contextPath}/product/product_list_datatable">제품 조회(DataTable)</a></li>
				<li><a href="${pageContext.request.contextPath}/sales/invoice_insertform">인보이스 등록</a></li>
				<li><a href="${pageContext.request.contextPath}/sales/invoice_list">인보이스 조회</a></li>
			</ul>
			
			<sec:authorize access="isAnonymous()">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/join">회원가입</a></li>
					<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
				</ul>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
	   			<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/user/member_update?user_id=<sec:authentication property="principal.username"/>">(<sec:authentication property="principal.username"/>)님 정보변경</a></li>
					<li><a href="#" onclick="document.getElementById('logoutForm').submit();">로그아웃</a>
						<form id="logoutForm" 
							action="<c:url value='/logout?${_csrf.parameterName}=${_csrf.token}' />"  
							method="POST">
						</form>
					</li>
				</ul>
			</sec:authorize>
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>Simple Invoice System</h1>
				<p> 이 웹 사이트는 Spring Framework(Legacy) & MyBatis jQuery Bootstrap 으로 만든</p>
				<p> JSP 웹 인보이스 관리 프로그램입니다. 최소한의 간단한 로직만 구현했습니다.</p>
				<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>	
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/img1.jpg">
				</div>
				<div class="item">
					<img src="images/img2.jpg">
				</div>
				<div class="item">
					<img src="images/img3.jpg">
				</div>
				<div class="item">
					<img src="images/img4.jpg">
				</div>				
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>	
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>	
			</a>			
		</div>
	</div>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	
</body>
</html>