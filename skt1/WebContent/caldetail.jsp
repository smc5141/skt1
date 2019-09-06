<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title></title>
</head>
<body>
<jsp:useBean id="util" class="skt1.utils.Util"/>
<h1>일정상세보기</h1>
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>일정</th>
		<td>
		<jsp:setProperty value="${dto.mdate}" property="toDates" name="util"/>
		<jsp:getProperty property="toDates" name="util"/>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="10" cols="60" readonly="readonly">${dto.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="updateForm(${dto.seq})" />
			<input type="button" value="삭제" onclick="delBoard(${dto.seq})" />
			<input type="button" value="달력" onclick="calList()" />
		</td>
	</tr>
</table>
<script type="text/javascript">
	function updateForm(seq){
		location.href="CalController.do?command=calupdateform&seq="+seq;
	}
function delBoard(seq){
	location.href="CalController.do?command=muldel&chk="+seq;
	}

function calendar(){
	location.href="CalController.do?command=calendar";
}

function calList(){
	location.href="CalController.do?command=callist&year=${fn:substring(dto.mdate,0,4)}&month=${fn:substring(dto.mdate,4,6)}&date=${fn:substring(dto.mdate,6,8)}";
}


</script>
</body>
</html>