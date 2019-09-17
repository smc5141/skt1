<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="css/skt4.css">
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
	<section class="sec2" >
	<form action="LoginController.do" method="post" style="width:390px; height:334px; margin: 0 auto;">
		<h2 style="text-align: center;">비밀번호 찾기</h2>
	<input type="hidden" name="command" value="searchpw"/>		
	<div class="form-group" id="divId">
                <label for="inputId" class="control-label">아이디</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="id" data-rule-required="true" placeholder="입력시 이메일로 임시비밀번호 전송" maxlength="30">
                </div>
            </div>
               <div class="form-group" >
                <div class="col-lg-10">
                    <input type="submit" value="비밀번호 찾기" class="form-control" >
                </div>
            </div>
            </form>
	</section>
</div>
</body>
</html>