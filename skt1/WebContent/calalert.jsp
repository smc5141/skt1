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
<script type="text/javascript">
	function list(){
		var yyyyMMdd=document.getElementById("yyyyMMdd").value
		opener.location.href="CalController.do?command=callist&yyyyMMdd="+yyyyMMdd;
		self.close();	
		} 
  
</script>
</head>
<body>
<input type="hidden" id="yyyyMMdd" value="<%=yyyyMMdd%>">
<tr>
	<td>SKT Schedule</td>
	<hr/>
</tr>
<tr>
	<td>날짜</td>
	<td><%=dto.getMdate()%></td>
	<hr/>
</tr>
<tr>
	<td>제목</td>
	<td><%=dto.getTitle()%></td>
	<hr/>
</tr>
<tr>
	<td>내용</td>
	<td><%=dto.getContent()%></td>
	<hr/>
</tr>
<button onclick="list()">목록보기</button>
<button onclick="window.close()">일정보기</button>
</body>
</html>