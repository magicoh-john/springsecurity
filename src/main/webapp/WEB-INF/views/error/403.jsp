<%@ include file="/WEB-INF/views/shared/header.jsp" %>


	<article>
		<div class="container">
			<p>데이터를 처리 하는 과정에서 문제가 발생하였습니다.</p>
			<p>관리자에게 문의하여 주십시오.</p>
		</div>
	</article>

<script>
	window.onload=function() {
		alert("데이터를 처리 하는 과정에서 문제가 발생하였습니다. \n홈페이지로 이동하겠습니다.");
		setTimeout(function() {
			location.href= "${pageContext.request.contextPath}"; // 페이지 이동
		}, 100);
	} 
</script>

</head>
<body>
</body>
</html>