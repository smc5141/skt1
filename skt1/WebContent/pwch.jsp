<%@page import="skt1.dtos.LoginDto"%>
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
<%
	LoginDto ldto=(LoginDto)request.getAttribute("ldto");
%>
<script type="text/javascript">
window.onload=function(){
	var form=document.getElementsByTagName("form")[0];//[form]
	//form태그에서 submit이벤트가 발생하면 함수를 실행해라
	form.onsubmit=function(){//패스워드가 정확해게 입력됐는지와 모든 입력값을 넣었는지 확인
		var inputs=document.querySelectorAll("section input");//[input,input....]
		if(inputs[3].value!=inputs[4].value){
			alert("패스워드가 일치하지 않습니다!!");
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

</script>
</head>
<body>
<div id="wrap"  >
	<section class="sec2" >
	<form action="LoginController.do" method="post" style="width:1000px; height:1000px; margin: 0 auto;">
		<h2 style="text-align: center;">비밀번호 변경</h2>
	<input type="hidden" name="command" value="pwcheck"/>		
	<div class="form-group" id="divId">
                <label for="inputId" class="control-label">아이디</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" name="id" data-rule-required="true" value="<%=ldto.getId()%>" readonly="readonly" maxlength="30">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPassword" class="control-label">현재 비밀번호</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="password" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPassword" class="control-label">새로운 비밀번호</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="passwordch" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
            <div class="form-group" >
                <label for="inputPassword" class="control-label">비밀번호 확인</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" name="passwordch" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
               <div class="form-group" >
                <div class="col-lg-10">
                    <input type="submit" value="비밀번호 변경" class="form-control" >
                </div>
            </div>
            </form>
	</section>
</div>
</body>
</html>