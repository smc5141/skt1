<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/skt1.css">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function allChk(bool){
		var chks=document.getElementsByName("chk");
		for(var i=0; i< chks.length; i++){
			chks[i].checked=bool;
		}
	}
	
	$(function(){
		$("form").submit(function() {
			var bool = true;
			var count = $(this).find("input[name=chk]:checked").length;//체크된 input태그의 갯수
			if (count == 0) {
				alert("최소하나이상 체크!!")
				bool = false;
			}
			return bool;
		});
	})
	
</script>
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
<jsp:useBean id="util" class="skt1.utils.Util" />
<section class="sec2" >
<h2 style="text-align: center;">일정목록조회</h2>
<form action="CalController.do" method="post">
<input type="hidden" name="command" value="muldel">
<table border="1">
	<col width="50px">
	<col width="50px">
	<col width="200px">
	<col width="300px">
	<col width="100px">
	<tr>
		<th><input type="checkbox" name="all" onclick="allChk(this.checked)"/></th>
		<th>번호</th>
		<th>일정</th>
		<th>KDA</th>
		<th>작성일</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="5">---작성된 일정이 없습니다----</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td><input type="checkbox" name="chk" value="${dto.seq}" /> </td>
					<td>${dto.seq}</td>
					<td>
					<jsp:setProperty value="${dto.mdate}" property="toDates" name="util"/>
					<jsp:getProperty property="toDates" name="util"/>
					</td>
					<td><a href="CalController.do?command=caldetail&seq=${dto.seq}">${dto.title}</a></td>
					<td><f:formatDate value="${dto.regDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
		<td colspan="5">
			<input type="submit" value="삭제"/>
			<input type="button" value="일정보기" onclick="location.href='CalController.do?command=calendar'"/>
		</td>
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