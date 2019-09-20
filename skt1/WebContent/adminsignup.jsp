<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/skt1.css">
<title></title>
<script type="text/javascript">
window.onload=function(){
	var form=document.getElementsByTagName("form")[0];//[form]
	//form태그에서 submit이벤트가 발생하면 함수를 실행해라
	form.onsubmit=function(){//패스워드가 정확해게 입력됐는지와 모든 입력값을 넣었는지 확인
		var inputs=document.querySelectorAll("section input");//[input,input....]
		if(inputs[3].value!=inputs[4].value){
			alert("패스워드를 확인하세요!!");
			inputs[3].value="";
			inputs[4].value="";
			inputs[3].focus();
			return false;//유효하지 않은 값이 존재하면 submit전송기능 취소해야 한다.
		}else{
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
}
function idChk(){
	var id=document.getElementsByName("id")[0].value;
	//open("url","title","창의 속성설정")
	if(id.length>0){
	window.open("LoginController.do?command=idChk&id="+id,"",
			     "width=500px,height=500px");
}else{
	alert("아이디를 입력하고 중복체크하세요");
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
				<li><a href="NotController.do?command=boardlistpage&pnum=1">공지게시판</a></li>
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
		<h2 style="text-align: center;">회원가입을 시작합니다.</h2>
	<input type="hidden" name="command" value="insertadmin"/>
			
	<div class="form-group" id="divId">
	
                <label for="inputId" class="control-label">아이디</label>
                <div class="col-lg-10">    	   
                    <input type="text" class="form-control" name="id" data-rule-required="true" placeholder="10자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
                    <input type="button" value="중복체크" onclick="idChk()"/>
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPassword" class="control-label">비밀번호</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPasswordCheck" class="control-label">비밀번호 확인</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputName" class="control-label">이름</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
                </div>
            </div>
             
            <div class="form-group" >
                <label for="inputNickname" class="control-label">주소</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="address" data-rule-required="true" placeholder="주소" maxlength="15">
                </div>
            </div>
             
            <div class="form-group" >
                <label for="inputEmail" class="control-label">휴대폰번호</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="40">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPhoneNumber" class="control-label">이메일</label>
                <div class="col-lg-10">
                    <input type="email" class="form-control" name="email" data-rule-required="true" placeholder="이메일" maxlength="11">
                </div>
            </div>
             <div class="form-group" >
                <div class="col-lg-10">
                    <input type="submit" value="회원가입" class="form-control" >
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