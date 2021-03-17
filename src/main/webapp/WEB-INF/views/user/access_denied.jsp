<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/shared/header.jsp" %>

<article>
   
   <h1><sec:authentication property="principal.username"/>님 권한이 없어 접근이 불가능합니다. </h1>
   	name : <sec:authentication property="name"/><br>
    username : <sec:authentication property="principal.username"/><br>
    principal : ${pageContext.request.userPrincipal}<br>
	<hr>
   
</article>



<%@ include file="/WEB-INF/views/shared/footer.jsp" %>