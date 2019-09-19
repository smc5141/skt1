<%@page import="skt1.dtos.LoginDto"%>
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
<link rel="stylesheet" href="css/skt1.css">
<title></title>
</head>
<%
	LoginDto ldto=(LoginDto)session.getAttribute("ldto");

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
<div id="wrap"  >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo"></a></h1>
			<ul class="gnb">
				<li><a href="CalController.do?command=calendar">경기일정</a></li>
				<li><a href="AnsController.do?command=boardlistpage&pnum=1">자유게시판</a></li>
				<li><a href="LoginController.do?command=insert">회원가입</a></li>
				<li><a href="LoginController.do?command=login">로그인</a></li>
				<li><a href="LoginController.do?command=info">마이페이지</a></li>
			</ul>
		</header>
	<section class='sec1'>
			<h2><img src='img/sk4.jpg' alt='MEMBER 회원안내'></h2>
			<nav class='lnb' style="text-align: center;">
				<ul >
					<li><a href='#' onclick="location.href='LoginController.do?command=login'" style="color:#fff; font-size:40px;">일정보기</a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
	</section>
	<section class="sec2" >
<form action="CalController.do" method="post" style="width:1000px; height:1500px; margin: 0 auto;">
<h2 style="text-align: center;">일정추가</h2>
	<input type="hidden" name="command" value="insertcal" />
	<input type="hidden" name="seq" value="${dto.seq}" />
	<input type="hidden" name="id" value="<%=ldto.getId()%>">
	<table border="1" style="height:250px; ">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" value="<%=ldto.getId()%>" readonly="readonly"></td>
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
			<th>상대팀</th>
			<td>
			<select name="teamname">
				<option value="kt">케이티</option>
				<option value="afreeca">아프리카</option>
				<option value="jinair">진에어</option>
				<option value="damwon">담원</option>
				<option value="kingzone">킹존</option>
			</select>
			</td>
		</tr>
				<tr>
			<th>경기결과</th>
			<td>
			<select name="ourscore">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
			</select>
			<select name="otherscore">
				<option value="0">0</option>
				<option value="1">1</option>
				<option value="2">2</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" placeholder="대회명 작성" required="required" />
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="content">*일정: 롤파크 (서울 종로구 종로33)
*장소: 오후 5시 ~ (2경기)
*결과: (승) SKT 2 vs 0 KT (패)</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="일정추가" />
				<input type="button" value="일정보기"
					onclick="location.href='CalController.do?command=calendar'"/>
		</tr>
	</table>
</form>
</section>
<div style="margin: 0 auto; text-align: right;">
	<br/>
	<address >서울특별시 영등포구 양평동3가 15-1 월드메르디앙비즈센터 4층 401 402호 연락처 : 02-6340-2233<br/>COPYRIGHT &copy;
	iCox. All Rights Reserved </address>
	</div>
</div>
</body>
</html>