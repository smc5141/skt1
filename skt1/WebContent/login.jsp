<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/skt1.css">
<title></title>
</head>
<body>
<div id="wrap"  >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo"></a></h1>
			<ul class="gnb">
				<li><a href="">일정</a></li>
				<li><a href="">자유게시판</a></li>
				<li><a href="LoginController.do?command=insert">회원가입</a></li>
				<li><a href="LoginController.do?command=">로그인</a></li>
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
	<form action="LoginController.do" method="post" style="width:1000px; height:1500px; margin: 0 auto;">
		<h2 style="text-align: center;">로그인 화면</h2>
	<input type="hidden" name="command" value="login"/>
			
	<div class="form-group" id="divId">
	
                <label for="inputId" class="control-label">아이디</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="id" data-rule-required="true" placeholder="10자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPassword" class="control-label">비밀번호</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
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