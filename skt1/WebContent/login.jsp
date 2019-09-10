<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/skt1.css">
<title></title>
<script type="text/javascript">
window.onload=function(){
	var form=document.getElementsByTagName("form")[0];//[form]
	//form태그에서 submit이벤트가 발생하면 함수를 실행해라
	form.onsubmit=function(){//패스워드가 정확해게 입력됐는지와 모든 입력값을 넣었는지 확인
		var inputs=document.querySelectorAll("section input");//[input,input....]
			for (var i = 0; i < inputs.length; i++) {
				if(inputs[i].value==""){
					var tagEleTxt=inputs[i].parentNode.previousElementSibling.textContent;
					//                     .부모태그구함.  앞에오는 형제엘리먼트구함.      내부에 text구함
					alert(tagEleTxt+"를 입력하세요!!");
					inputs[i].focus();
					return false;
				}
			}
		}
	}


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
				<li><a href="LoginController.do?command=info">마이페이지</a></li>	
				<li><a href="LoginController.do?command=logout">로그아웃</a></li>
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
	<input type="hidden" name="command" value="userlogin"/>
			
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
               <div class="form-group" >
                <div class="col-lg-10">
                    <input type="submit" value="로그인" class="form-control" >
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