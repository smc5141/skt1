<%@page import="skt1.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/skt1.css">
<script type="text/javascript">
$(function(){
	$("form").submit(function(){
				var bool=true;
				//[input,input,textarea]
				var inputs=$(this).find("td").children().filter("[name]");
				inputs.each(function(){
					if($(this).val()==""){
						alert($(this).parent().prev().text()+"를 입력하세요");
						$(this).focus();
						bool=false;
						return false;
					}
				});
				return bool;
			});
		})
</script>
<style type="text/css">



	#util img{width: 12px; height: 12px;}
	 a:hover{
   color:blue;
	}

	* {
   	margin: 0 auto;
  	 padding: 0;
  	 font-family: 'Malgun gothic','Sans-Serif','Arial';
	}
	a {
   text-decoration: none;
   color:#333;
	}
	ul li {
   list-style:none;
	}

	.fl {
   float:left;
}
.tc {
   text-align:center;
}	

	#board_area {
   width: 900px;
   position: relative;
}
.list-table {
   margin-top: 40px;
}
.list-table thead th{
   height:40px;
   border-top:2px solid #09C;
   border-bottom:1px solid #CCC;
   font-weight: bold;
   font-size: 17px;
}
.list-table tbody td{
   text-align:center;
   padding:10px 0;
   border-bottom:1px solid #CCC; height:20px;
   font-size: 14px 
}
#nd{
text-align:center;
 position: relative;
}
#list1{color: red;}	

   .sec2{
      width: 64%;
      height: 1000px;
      float: left;
   }

</style>
<%
	LoginDto ldto=(LoginDto)session.getAttribute("ldto");
%>
</head>
<body>
<div id="wrap" >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo" style="max-width:100%;height:auto;"></a></h1>
			<ul class="gnb" >
				<li><a href="CalController.do?command=calendar">일정</a></li>
				<li><a href="NotController.do?command=boardlistpage&pnum=1">공지게시판</a></li>
				<li><a href="AnsController.do?command=boardlistpage&pnum=1">자유게시판</a></li>
				<li><a href="#" target="_blank" onclick="window.open('checkuser.jsp', 'mapWin', 'left=100,top=0,width=390,height=334'); return false">회원가입</a></li>				
				<li><a href="LoginController.do?command=login">로그인</a></li>
				<li><a href="LoginController.do?command=info">마이페이지</a></li>
				<li><a href="LoginController.do?command=logout">로그아웃</a></li>
			</ul>
		</header>
		<section class='sec1'>
			<h2><img src='img/sk4.jpg' alt='MEMBER 회원안내' style="max-width:100%;height:auto;" ></h2>
			<nav class='lnb' style="text-align: center;">
				<ul >
					<li><a href='#' onclick="location.href='LoginController.do?command=login'" style="color:#fff; font-size:40px;">게시글 수정</a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
		</section>
</div>
	

<form action="AnsController.do" method="post">
<input type="hidden" name="command" value="updateboard"/>
<input type="hidden" name="seq" value="${dto.seq}"/>
<section class="sec2" >	
<table class="list-table">
	<tr>
		<th>번호</th>
		<td>${requestScope.dto.seq}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="${dto.title}"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" name="content">${dto.content}</textarea> </td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<button type="button" onclick="location.href='AnsController.do?command=boardlistpage&pnum=1'">글목록</button>
		</td>
	</tr>
</table>
</section>
</form>

</body>
</html>