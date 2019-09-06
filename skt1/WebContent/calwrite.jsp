<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title></title>
</head>
<%
	//EL


	//추가할 일정의 날짜를 받는다.
	int year=Integer.parseInt(request.getParameter("year"));
	int month=Integer.parseInt(request.getParameter("month"));
	int date=Integer.parseInt(request.getParameter("date"));
	int lastDay=Integer.parseInt(request.getParameter("lastday"));
	
	//현재시간을 구한다.
	Calendar cal=Calendar.getInstance();
	int hour=cal.get(Calendar.HOUR_OF_DAY);
	int min=cal.get(Calendar.MINUTE);
	
	pageContext.setAttribute("hour", hour);
	pageContext.setAttribute("min", min);
	%>
<body>
<h1>일정추가하기</h1>
<form action="CalController.do" method="post">
	<input type="hidden" name="command" value="insertcal" />
	<input type="hidden" name="seq" value="${dto.seq}" />
	<table border="1">
		<tr>
			<th></th>
			<td><input type="text" name="id" value="hk" readonly="readonly"></td>
		</tr>
		<tr>
			<th>일정</th>
			<td>
				<select name="year">
			 	<c:forEach step="1" var="i" begin="${param.year-5}" end="${param.year+5}">
			 		<option value="${i}" ${param.year==i?"selected":""}>${i}</option>
			 	</c:forEach>
				</select>년
				<select name="month">
					<c:forEach step="1" var="i" begin="1" end="12">
						<option value="${i}" ${param.month==i?"selected":""}>${i}</option>
					</c:forEach>
				</select>월
				<select name="date">

					<c:forEach step="1" var="i" begin="1" end="31">
						<option value="${i}" ${param.date==i?"selected":""}>${i}</option>
					</c:forEach>
				</select>일
					<select name="hour">
					<c:forEach step="1" var="i" begin="0" end="23">
						<option value="${i}" ${hourParam==i?"selected":""}>${i}</option>
					</c:forEach>
				</select>시
					<select name="min">
					<c:set var="minParam" value="${pageScope.min}" />
					<c:forEach step="1" var="i" begin="0" end="59">
						<option value="${i}" ${minParam==i?"selected":""}>${i}</option>
					</c:forEach>
				</select>분
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="일정추가" />
				<input type="button" value="달력"
					onclick="location.href='CalController.do?command=calendar'"/>
		</tr>
	</table>
	
</form>
</body>
</html>