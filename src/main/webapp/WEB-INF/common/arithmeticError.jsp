<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기본 에러 화면</title>
</head>
<body bgcolor="#ffffff" text="#000000">
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center">
			<br><br><br><br><br>
			Message : ${exception.message }
			<br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>