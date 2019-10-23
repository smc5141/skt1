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
//Your web app's Firebase configuration
var firebaseConfig = {
  apiKey: "AIzaSyBwDkg4gN6qhTOE4HskbqCslwesYPaNWd4",
  authDomain: "hankyung-ed28b.firebaseapp.com",
  databaseURL: "https://hankyung-ed28b.firebaseio.com",
  projectId: "hankyung-ed28b",
  storageBucket: "hankyung-ed28b.appspot.com",
  messagingSenderId: "678307705084",
  appId: "1:678307705084:web:b75c099314417013fae779",
  measurementId: "G-4NMV18ZFFL"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();

window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('sign-in-button', {
	  'size': 'invisible',
	  'callback': function(response) {
	    // reCAPTCHA solved, allow signInWithPhoneNumber.
	    onSignInSubmit();
	  }
	});

window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container');
var phoneNumber = getPhoneNumberFromUserInput();
var appVerifier = window.recaptchaVerifier;
firebase.auth().signInWithPhoneNumber(phoneNumber, appVerifier)
    .then(function (confirmationResult) {
      // SMS sent. Prompt user to type the code from the message, then sign the
      // user in with confirmationResult.confirm(code).
      window.confirmationResult = confirmationResult;
    }).catch(function (error) {
      // Error; SMS not sent
      // ...
    });
grecaptcha.reset(window.recaptchaWidgetId);

//Or, if you haven't stored the widget ID:
window.recaptchaVerifier.render().then(function(widgetId) {
grecaptcha.reset(widgetId);
}
</script>
</head>
<body>
 <!-- Insert these scripts at the bottom of the HTML, but before you use any Firebase services -->

  <!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
  <script src="/__/firebase/6.2.0/firebase-app.js"></script>

  <!-- Add Firebase products that you want to use -->
  <script src="/__/firebase/6.2.0/firebase-auth.js"></script>
  <script src="/__/firebase/6.2.0/firebase-firestore.js"></script>
  <!-- Previously loaded Firebase SDKs -->

  <!-- Initialize Firebase -->
  <script src="/__/firebase/init.js"></script>

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
                <label for="inputPassword" class="control-label">핸드폰 번호</label>
                <div class="col-lg-10">
                    <input type="password"  class="form-control"  id="recaptcha-container" name="phone" name="excludeHangul" data-rule-required="true" placeholder="패스워드" maxlength="30">
                </div>
            </div>
               <div class="form-group" >
                <div class="col-lg-10">
                    <input type="submit" value="로그인" class="form-control"  id="sign-in-button">
                </div>
               
            </div>
            </form>
	</section>
</div>
</body>
</html>