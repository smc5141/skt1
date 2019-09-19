<%@page import="skt1.dtos.CalDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title></title>
<%
	CalDto dto=(CalDto)request.getAttribute("dto");
	String yyyyMMdd = (String)request.getAttribute("yyyyMMdd");
%>
<style type="text/css">
.main{
	font-size : 20px;
	font-family: monospace;
	font-weight : bold;
	
}
 h1{
 	font-size : 40px;
 	text-align:center;
 	color : red;
 	font-family: fantasy;
 }

.but{
	text-align : right;
}

</style>

</head>
<body>
<input type="hidden" id="yyyyMMdd" value="<%=yyyyMMdd%>">
<h1 style="text-align:center;">SKT1 Schedule</h1><br/>
<hr/>
<p class="main" style="text-align:center;"><%=dto.getTitle()%></p>
<hr/><br/>
<pre class="main"><%=dto.getContent()%></pre><br/>
<hr/>
<div class="but">
<button onclick="list()">일정목록보기</button>
<button onclick="window.close()">나가기</button>
</div>
</body>
<script type="text/javascript">
	function list(){
		var yyyyMMdd=document.getElementById("yyyyMMdd").value
		opener.location.href="CalController.do?command=callist&yyyyMMdd="+yyyyMMdd;
		self.close();	
		} 
</script>
</html>