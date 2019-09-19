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
<script type="text/javascript">


	function allSel(ele){
// 		document.getElementsByTagName("input")[0].attr();
		//js객체를 jq로 변환할때는  $(jsObj) 로 작성해주면 해결 
// 		$(ele).attr("title","체크박스");
		$("input[name=chk]").prop("checked",$(ele).prop("checked"));
	}
		
	$(function(){
		//document.getElementsByTagName("form")
		//이벤트메서드: change(), click(), mouseover()..... 
		//필터링메서드: eq(), find(), children(),
		//트리탐색메서드: next(), prev().....
		$("#aaa").submit(function(){
			var bool=true;
			var count=$(this).find("input[name=chk]:checked").length;//체크된 input태그의 개수
			if(count==0){
				alert("최소하나이상 체크해야된다~~");
				bool=false;
			}
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
</style>
</head>
<%
// 	Object obj=request.getAttribute("list");

	NotDto dto2=(NotDto)request.getAttribute("dto");

	AnsDto dto1=(AnsDto)request.getAttribute("dto");
	List<NotDto> list1 =(List<NotDto>)request.getAttribute("list");

	List<AnsDto> list =(List<AnsDto>)request.getAttribute("list"); 
	
	Map<String,Integer>map=(Map<String,Integer>)request.getAttribute("pmap");
	
	LoginDto ldto=(LoginDto)session.getAttribute("ldto");
	if(ldto==null){
		pageContext.forward("login.jsp");
	}
%>
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
					<li><a href='#' onclick="location.href='LoginController.do?command=login'" style="color:#fff; font-size:40px;">게시판글목록</a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
	</section>
	
<jsp:useBean id="util" class="skt1.utils.Util"  />
<section class="" >
	<br/><br/><br/>
	<div id="nd">
			<form action="AnsController.do" method="post">
			<input type="hidden" name="command" value="boardlistpage" />
			<select name="opt">
				<option value="id">작성자</option>
				<option value="title">제목</option>				
				<option value="content">내용</option>
			</select>
			<input type="text" size="20" name="condition"/>&nbsp;
			<input type="submit" value="검색"/>
			</form>
	</div>
<form action="AnsController.do" method="post" id="aaa">
<input type="hidden" name="command" value="muldel" />


<table class="list-table" >
	<col width="50px" />
	<col width="70px" />
	<col width="300px" />
	<col width="300px" />
	<col width="150px" />
	<col width="100px" />	
	<thead>
	<tr>
		<% 
		if(ldto.getRole().equals("ADMIN")){
		%>
		<th><input type="checkbox" name="all" onclick="allSel(this)"/></th>
		<%
		}
		%>
		<th>번호</th>
		<th>작성자</th>
		<th>제 목</th>
		<th>작성일</th>		
		<th>조회수</th>
		
	</tr>
	</thead>
	<c:choose>
		<c:when test="${empty list1}">
			<tr id="list1">
				<td colspan="5">----작성된 글이 없습니다.----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list1}" var="dto">
				<tr id="list1">
					<% 
					if(ldto.getRole().equals("ADMIN")){
					%>
					<td><input type="checkbox" name="chk" value="${dto.seq}"/></td>
					<%
					}
					%>
					<td>공지</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.delflag=='Y'}">
							<td>-----삭제된 글입니다.-----</td>
						</c:when>
						<c:otherwise>
							<td id="util">
								<jsp:setProperty property="arrowNbsp" name="util" value="${dto.depth}"/>
								<jsp:getProperty property="arrowNbsp" name="util"/>
							   <a href="NotController.do?command=boarddetail&seq=${dto.seq}" style="color: red" >${dto.title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy년MM월dd일"/> </td>					
					<td>${dto.readcount}</td>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="6">----작성된 글이 없습니다.----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<% 
					if(ldto.getRole().equals("ADMIN")){
					%>
					<td><input type="checkbox" name="chk" value="${dto.seq}"/></td>
					<%
					}
					%>
					<td>${dto.seq}</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.delflag=='Y'}">
							<td>-----삭제된 글입니다.-----</td>
						</c:when>
						<c:otherwise>
							<td id="util">
								<jsp:setProperty property="arrowNbsp" name="util" value="${dto.depth}"/>
								<jsp:getProperty property="arrowNbsp" name="util"/>
							   <a href="AnsController.do?command=boarddetail&seq=${dto.seq}">${dto.title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy년MM월dd일"/> </td>					
					<td>${dto.readcount}</td>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
		<td colspan="6" style="text-align: center;">
			<a href="AnsController.do?command=boardlistpage&pnum=<%=map.get("prePageNum")%>${statusPage==null?'':statusPage}">◀</a>
			<%
// 				int pcount=(Integer)request.getAttribute("pcount");
				for(int i=map.get("startPage");i<=map.get("endPage");i++){
					%>
					<a href="AnsController.do?command=boardlistpage&pnum=<%=i%>${statusPage==null?'':statusPage}" style="text-decoration: none;"><%=i%></a>				
					<%
				}	
				
			%>
			<a href="AnsController.do?command=boardlistpage&pnum=<%=map.get("nextPageNum")%>${statusPage==null?'':statusPage}">▶</a>
		</td>
	</tr>
	
	<tr>
		<td colspan="6" >
			<input type="button" value="글추가" 
			       onclick="location.href='AnsController.do?command=insertForm&id=<%=ldto.getId()%>'"/>
			<% 
// 			if(ldto.getRole()!=null){
				if(ldto.getRole().equals("ADMIN")){
				%>     
					<input type="submit" value="글삭제"/> 
				<%
					}
// 				 } 
			%>
			     
		</td>
	</tr>
	  
	     
</table>

</form>
</section>
</div>



</body>
</html>










