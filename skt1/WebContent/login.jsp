<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/skt3.css">
<title></title>
<style type="text/css">
.pwbutton{
position: relative;
left:608px;
}
</style>
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
	<section class="sec2" >
	<form action="LoginController.do" method="post" name="gogo" style="width:1000px; height:1000px; margin: 0 auto;">
		<h2 style="text-align: center;">로그인</h2>
		<button class="pwbutton" onclick="window.open('search.jsp', 'mapWin', 'left=100,top=0,width=390,height=334'); return false">아이디/비밀번호 찾기</button>
	<input type="hidden" name="command" value="userlogin"/>		
	<div class="form-group" id="divId">
                <label for="inputId" class="control-label">아이디</label>
                <div class="col-lg-10">
                    <input type="text"  class="form-control" name="id" data-rule-required="true" placeholder="아이디" maxlength="30">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPassword" class="control-label">비밀번호</label>
                <div class="col-lg-10">
                    <input type="password"  class="form-control" name="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
               <div class="form-group" >
                <div class="col-lg-10">
                    <input type="submit" value="로그인" class="form-control" >
                </div>
            </div>
            </form>
	</section>
</div>
</body>
</html>