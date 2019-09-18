<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/skt1.css">
<title></title>
	<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>
<body>
<jsp:useBean id="util" class="skt1.utils.Util"/>
<div id="wrap"  >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo"></a></h1>
			<ul class="gnb">
				<li><a href="CalController.do?command=calendar">일정</a></li>
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
					<li><a href='#' onclick="location.href='LoginController.do?command=login'" style="color:#fff; font-size:40px;">로그인</a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
	</section>
	<section class="sec2" >
<h2 style="text-align: center;">일정상세보기</h2>
<table border="1" style="text-align: center;" >
	<tr>
		<th>상대팀</th>
		<td>${dto.teamname}</td>
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
			<pre>${dto.content}</pre>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="updateForm(${dto.seq})" />
			<input type="button" value="삭제" onclick="delBoard(${dto.seq})" />
			<input type="button" value="일정보기" onclick="calList()" />
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
<div style="margin: 0 auto; text-align: right;">
	<br/>
	<address >서울특별시 영등포구 양평동3가 15-1 월드메르디앙비즈센터 4층 401 402호 연락처 : 02-6340-2233<br/>COPYRIGHT &copy;
	iCox. All Rights Reserved </address>
	</div>
</div>
</body>
</html>