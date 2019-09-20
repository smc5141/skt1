<%@page import="skt1.dtos.NotDto"%>
<%@page import="skt1.dtos.LoginDto"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="skt1.dtos.AnsDto"%>
<%@page import="java.util.List"%>
<%@page import="skt1.daos.AnsDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/skt1.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title></title>

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
</style>
</head>
<%
	List<LoginDto>list=(List<LoginDto>)request.getAttribute("list");

int i=1;
%>
<body>
<div id="wrap"  >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo"></a></h1>
			<ul class="gnb">
				<li><a href="CalController.do?command=calendar">일정</a></li>
				<li><a href="AnsController.do?command=boardlistpage&pnum=1">자유게시판</a></li>
				<li><a href="LoginController.do?command=insert">회원가입</a></li>
				<li><a href="LoginController.do?command=login">로그인</a></li>
				<li><a href="">마이페이지</a></li>
				<li><a href="LoginController.do?command=logout">로그아웃</a></li>
			</ul>
		</header>
			<section class='sec1'>
			<h2><img src='img/sk4.jpg' alt='MEMBER 회원안내'></h2>
			<nav class='lnb' style="text-align: center;">
				<ul >
					<li><a href='#'  style="color:#fff; font-size:40px;"></a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
	</section>
	
<jsp:useBean id="util" class="skt1.utils.Util"  />
<section class="" >

<table class="list-table" >
	<col width="50px" />
	<col width="70px" />
	<col width="300px" />
	<col width="300px" />
	<col width="150px" />
	<col width="100px" />	
	<thead>
	<tr>
		
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>		
		<th>이메일</th>
		<th>승인</th>
		
	</tr>
	</thead>
<%
		for(LoginDto dto:list){
			
			%>
			<tr>
				<td><%=i%></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getAddress()%></td>
				<td><%=dto.getEmail()%></td>
				<td>
					<button onclick="location.href='LoginController.do?command=adminsignup&id=<%=dto.getId()%>'">승인</button>
				</td>
			</tr>
			<%  
	i++;	}
	%>
</table>

</section>
</div>



</body>
</html>










