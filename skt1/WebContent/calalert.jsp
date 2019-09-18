<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	function list(){
		opener.location.href="CalController.do?command=insert"
		self.close();	
	function list(){
			opener.location.href="CalController.do?command=calendar"
			self.close();	
}

</script>
</head>
<body>

<tr>
	<td>SKT Schedule</td>
	<hr/>
</tr>
<tr>
	<td>날짜</td>
	<td></td>
	<hr/>
</tr>
<tr>
	<td>제목</td>
	<td></td>
	<hr/>
</tr>
<tr>
	<td>내용</td>
	<td></td>
	<hr/>
</tr>
<tr>
<button onclick="list()">목록보기</button>
<button onclick="cal()">일정보기</button>
</tr>
</body>
</html>