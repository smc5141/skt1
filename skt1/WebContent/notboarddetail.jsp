<%@page import="skt1.dtos.LoginDto"%>
<%@page import="skt1.dtos.NotDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/skt1.css">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
	/*  selector표현식의 대표적인 표현식3가지: id,> class,> tagName
		class="a"  ---> .a   (같은이름을 중복해서 선언할 수 있다.)
		id="b"     ---> #b   (같은 이름 중복을 선언할 수 없다.)
	*/
	#replyForm{display: none;}
	#container{
		height: 400px;
		width: 800px;
		border: 1px solid red;
		overflow: auto;
	}

</style>
<script type="text/javascript">
	
</script>
</head>

<%
 	NotDto dto1=(NotDto)request.getAttribute("dto");

	LoginDto ldto=(LoginDto)session.getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("login.jsp");
	}
%>
<div id="wrap"  >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo"></a></h1>
			<ul class="gnb">
				<li><a href="">일정</a></li>
				<li><a href="CalController.do?command=calendar">일정</a></li>
				<li><a href="NotController.do?command=boardlistpage&pnum=1">공지게시판</a></li>
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
					<li><a href='#' onclick="location.href='LoginController.do?command=login'" style="color:#fff; font-size:30px;">게시글 추가하기</a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
	</section>
<section class="sec2" >
<div id="container">

<table border="1">
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
		<td>${dto.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" readonly="readonly">${dto.content}</textarea> </td>
	</tr>
	<tr>
		<td colspan="2">
			<% 
			if(ldto.getRole().equals("ADMIN")){
			%>
			<button onclick="replyForm()">답글</button>
			<%
			}
			%>
			<% if(ldto!=null){
			 if(ldto.getId().equals(dto1.getId())){%>	
				 		 
			<button onclick="updateForm(${dto.seq})">수정</button>
			<button onclick="delBoard(${dto.seq})">삭제</button>
			<% } %>
			<% } %>
			<button onclick="location.href='NotController.do?command=boardlistpage&pnum=1'">글목록</button>
		</td>
	</tr>
</table>
<div id="replyForm">
<h1>답글달기</h1>
<form action="NotController.do" method="post" >
<input type="hidden" name="command" value="replyboard"/>
<input type="hidden" name="seq" value="${dto.seq}"/>
<input type="hidden" name="id" value="<%=ldto.getId()%>">
<table border="1">
	<tr>
		<th>아이디</th>
		<td><%=ldto.getId()%></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" class="inputval"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" name="content" class="inputval"></textarea> </td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="답글등록"/>
			<input type="button" value="목록" 
			          onclick="location.herf='NotController.do?command=boardlistpage&pnum=1'"/>
		</td>
	</tr>
</table>
</form>

</div>
</div>
</section>
</div>
	
<script type="text/javascript">
	function replyForm(){
// 		$("#replyForm").css("display","block");
// 		$("#replyForm").toggle();
		$("#replyForm").show();
		var replyPosition=$("#replyForm").offset().top;//div태그의 상단 위치를 구함
		$("#container").animate({
			"scrollTop":replyPosition
		},1000);
		//animate({css속성값정의},지연시간,easing)
	}
	function updateForm(seq){
		location.href="NotController.do?command=updateForm&seq="+seq;
	}
	function delBoard(seq){
		location.href="NotController.do?command=muldel&chk="+seq;
	}
</script>
</body>

</html>









