<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="<c:url value='/resources/js/member.js' />" type="text/javascript"></script>
	<title>우편 번호 검색</title>
		<style type="text/css">
			body {
				background-color:#faf8fa;
				margin: 0;
				padding: 0;
				line-height: 1.2em;
				color: #333;
				font-size: 12px; /* 글꼴 크기 */
				font-family: "맑은 고딕";
			}
			
			#popup{   
			   padding: 5 5px;
			}
			
			#popup h1 {
				padding: 5px;
				font-family: "맑은 고딕";
				font-weight: normal;
				font-size: 15pt; 
				font-weight: bold;
				text-align: center;
			}
			
			table#zipcode {
				border: 0px solid  #333;
				border-collapse: collapse; /* border 사이의 간격 없앰 */
				border-top: 0px solid #333;
				border-bottom: 0px solid #333;
				width: 100%; /* 전체 테이블 길이 설정 */
				margin-bottom: 20px;
			}
				
			table#zipcode th{   
			   text-align: center;
			   border-bottom: 1px solid  #c0c0c0;
			   padding: 8px;  
			   color:#gray;   
			}
	
			table#zipcode tr, table#zipcode td{   
			   text-align: center;
			   border-bottom: 1px dotted  #c0c0c0;
			   padding: 2px;  
			   color:#gray;   
			}
	
		
			table#zipcode  a{
			   display:block; 
			    height:20px;
			    text-decoration:none;
			    color:#c0c0c0;
			    padding: 10px;
			}
			table#zipcode a:hover{
			    color: #F90;
			    font-weight: bold;
			}
			
			table#search{   
				border: 0px solid  #333;
				border-collapse: collapse; /* border 사이의 간격 없앰 */
				border-top: 0px solid #333;
				border-bottom: 0px solid #333;
				width: 100%; /* 전체 테이블 길이 설정 */
				margin-bottom: 5px;
			}
			table#search tr td{   
			   text-align: center;
			   border-bottom: 1px dotted  #c0c0c0;
			   padding: 10px;  
			   color:#gray;   
			}
		</style>
</head>
<body>
<div id="popup">
  <h1>우편번호검색</h1>
  <form name=formm
  	action="${pageContext.request.contextPath}/zipNum"
  	method="GET">
  	
  	<input type="hidden" name="_to" value="${_to}" ><!-- will be delete -->
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  	<table id="search">
  		<tr>
  			<td>
		    	동이름 : <input name="dong" type="text">
		         <input type="submit" value="찾기"  class="submit">
         	</td>
         </tr>
    </table>     
  </form>
  <table id="zipcode">
    <tr>
      <th>우편번호</th>
      <th>주소</th>
    </tr>
    <c:forEach items="${addressList}" var="addressVo">
    <tr>
      <td>${addressVo.zip_num} ${addressVo.sido}</td>
        <td>
          <a href="#" onclick="return returnZipNum('${addressVo.zip_num}','${addressVo.sido}', '${addressVo.gugun}','${addressVo.dong}')">
            ${addressVo.sido} ${addressVo.gugun} ${addressVo.dong} 
          </a>
        </td>
    </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>