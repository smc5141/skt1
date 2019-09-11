<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/skt1.css">
<title></title>

</head>
<body>
<div id="wrap"  >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo"></a></h1>
			<ul class="gnb">
				<li><a href="CalController.do?command=calendar">일정</a></li>
				<li><a href="AnsController.do?command=boardlistpage&pnum=1">자유게시판</a></li>
				<li><a href="LoginController.do?command=insert">회원가입</a></li>
				<li><a href="LoginController.do?command=login">로그인</a></li>
				<li><a href="">마이페이지</a></li>
			</ul>
		</header>
	<section class='sec1'>
			<h2><img src='img/sk4.jpg' alt='MEMBER 회원안내'></h2>
			<nav class='lnb' style="text-align: center;">
				<ul >
					<li><a href='#' onclick="location.href='LoginController.do?command=login'" style="color:#fff; font-size:40px;">로그인</a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
	</section>
<section class="sec2" >
<div id="container">
<h2  style="text-align: center;">일정수정하기</h2>
<form action="CalController.do" method="post">
<input type="hidden" name="command" value="calupdate" />
<input type="hidden" name="seq" value="${dto.seq}" />
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>일정</th>
		<td>
			<select name="year">
			 	<c:set var="yearParam" value="${fn:substring(dto.mdate,0,4)}" />
			 	<c:forEach step="1" var="i" begin="${yearParam-5}" end="${yearParam+5}">
			 		<option value="${i}" ${yearParam==i?"selected":""}>${i}</option>
			 	</c:forEach>
			</select>년
			<select name="month">
				<c:set var="monthParam" value="${fn:substring(dto.mdate,4,6)}" />
			 	<c:forEach step="1" var="i" begin="1" end="12">
			 		<option value="${i}" ${monthParam==i?"selected":""}>${i}</option>
			 	</c:forEach>
			</select>월
			<select name="date">
				<c:set var="dateParam" value="${fn:substring(dto.mdate,6,8)}" />
			 	<c:forEach step="1" var="i" begin="1" end="31">
			 		<option value="${i}" ${dateParam==i?"selected":""}>${i}</option>
			 	</c:forEach>
			</select>일
			<select name="hour">
				<c:set var="hourParam" value="${fn:substring(dto.mdate,8,10)}" />
			 	<c:forEach step="1" var="i" begin="0" end="23">
			 		<option value="${i}" ${hourParam==i?"selected":""}>${i}</option>
			 	</c:forEach>
			</select>시
			<select name="min">
				<c:set var="minParam" value="${fn:substring(dto.mdate,10,12)}" />
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
		<td><input type="text" name="title" value="${dto.title}" readonly="readonly"> </td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="10" cols="60" name="content">${dto.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정" />
			<input type="button" value="달력" onclick="calendar()" />
		</td>
	</tr>
</table>
</form>
</div>
</section>
<div style="margin: 0 auto; text-align: right;">
	<br/>
	<address >서울특별시 영등포구 양평동3가 15-1 월드메르디앙비즈센터 4층 401 402호 연락처 : 02-6340-2233<br/>COPYRIGHT &copy;
	iCox. All Rights Reserved </address>
	</div>
</div>
</body>
</html>