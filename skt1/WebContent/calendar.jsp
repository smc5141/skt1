<%@page import="skt1.dtos.LoginDto"%>
<%@page import="skt1.dtos.CalDto"%>
<%@page import="skt1.utils.Util"%>
<%@page import="skt1.daos.CalDao"%>
<%@page import="java.util.List"%>

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/skt1.css">
<title></title>
<style type="text/css">
	table{
		border-collapse: collapse;
	}
	th{background-color: orange; color: white;}
	td{height:150px; vertical-align: top; position: relative;}
	a{text-decoration: none;}
	.clist{
		font-size: 5px;
		background-color: orange;
		margin-top: 1px;
	}
	#container{
		margin: 0px auto;
		width:560px;
	}
	
	td>div{
		position: absolute;
		top : -20px;
		left : 10px; 
		background-color: orange;
		width : 30px;
		height: 30px;
		border-radius:30px 30px 30px 0px; 
		text-align: center;
		line-height: 30px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		var aCount;
		$(".countview").hover(function(){
			aCount=$(this);
			aCount.next("div").remove();
			var year=$(".y").text().trim(); //trim() 문자열의 앞뒤 공백을 제거
			var month=$(".m").text().trim();
			var date=aCount.text().trim();
			var yyyyMMdd=year+isTwo(month)+isTwo(date);	//"20190802"
			$.ajax({
				url:"CalController.do",
				data:{"command":"calcount","yyyyMMdd":yyyyMMdd},
				method:"post",
				datatpye:"text",
				async:false,
				success:function(count){ //통신성공해서 받게 되는 값 count
			//		alert(count);
					aCount.after("<div>"+count+"</div>");
				
				},
					error:function(){
						alert("서버통신실패!!");
					}
			});
		},function(){
			aCount.next("div").remove();
			
		});
	});

	function isTwo(s){
		return s.length<2?"0"+s:s;
	}
	
</script>
</head>
<%
	LoginDto ldto=(LoginDto)session.getAttribute("ldto");
	//달력의 날짜를 바꾸기 위해서 전달된 year와 month 값을 받는다.
	String pYear=request.getParameter("year");
	String pMonth=request.getParameter("month");


	Calendar cal=Calendar.getInstance(); //Calendar객체는 new를 사용하지 않는다.
	int year=cal.get(Calendar.YEAR); //현재 년도를 구함
	int month=cal.get(Calendar.MONTH)+1; //현재 월을 구함(0월~11월)
	
	if(pYear!=null){
		year=Integer.parseInt(pYear);
	}
	if(pMonth!=null){
		month=Integer.parseInt(pMonth);
	}
	
	//달중에 12월을 넘어갔을 경우 month는 1월, 년도는 다음년도로 값을 변경
	if(month>12){
		month=1;
		year++;
	}
	
	//달중에 1월전으로 갔을 경우 month는 12월, 년도는 전년도로 값을 변경
	
	if(month<1){
		month=12;
		year--;
	}
	
	//현재 월이 1일에 대한 요일 구하기
	cal.set(year, month-1, 1);  //월은 -1
	int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK); //1(일)~7(토)
	int lastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//한달에 대한 일정목록 가져오기(separation 패턴)
	CalDao dao=new CalDao();
	String yyyyMM=year+Util.isTwo(month+"");
	List<CalDto>list=dao.getCalViewList(yyyyMM);
//	List<CalDto>list=(List<CalDto>)request.getAttribute("list");
	
	
%>
<body>
<div id="wrap"  >
		<header>
			<h1><a href="index.jsp"><img src="img/skt1.jpeg" alt="skt1logo"></a></h1>
			<ul class="gnb">
				<li><a href="CalController.do?command=calendar">경기일정</a></li>
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
					<li><a href='#' onclick="location.href='LoginController.do?command=login'" style="color:#fff; font-size:40px;">로그인</a></li>
				</ul>
			</nav>
		
		<div class='lnb_sns' style="text-align: center;" >
			<div class='sns_title' style="color: #fff;" >SKT1 유트브</div>
			<a href='https://www.youtube.com/user/SKTTeam1st' target="_blank" ><img src="img/youtube.png" alt="youtube"></a>
		</div>
	</section>
<%
//	out.print("1일의 요일값"+dayOfWeek); 
%>
<section class="sec2" >
<div id="container">
<h2 style="text-align: center;">일정보기</h2>
<table border="1">
	<caption>
		<a href="calendar.jsp?year=<%=year-1%>&month=<%=month%>">◁</a>
		<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
		<span class="y"><%=year%></span>년
		<span class="m"><%=month%></span>월
		<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
		<a href="calendar.jsp?year=<%=year+1%>&month=<%=month%>">▷</a>
	</caption>
	<col width="80px"/>
	<col width="80px"/>
	<col width="80px"/>
	<col width="80px"/>
	<col width="80px"/>
	<col width="80px"/>
	<col width="80px"/>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
	<tr>
		<% //공백 출력하기
			for(int i=0;i<(dayOfWeek-1);i++){
				out.print("<td>&nbsp;</td>");
			}
		//일수 출력하기
			for(int i=1;i<=lastDay;i++){
				%>
				<td>
					<a class="countview" href="CalController.do?command=callist&year=<%=year%>&month=<%=month%>&date=<%=i%>" style="color:<%=Util.fontColor(dayOfWeek,i)%>;"><%=i%></a>
					<a href="CalController.do?command=insertcalform
					&year=<%=year%>&month=<%=month%>&date=<%=i%>&lastday=<%=lastDay%>">
						<img src="img/pen.png" alt="일정추가" />
					</a>
					<%=Util.getCalView(list, i) %>
					
				</td>
				<%
				//dayofweek-1=공백수
				if((dayOfWeek-1+i)%7==0){
					out.print("</tr><tr>");
				}
			}
			//달력의 나머지 공백수 출력하기
			//7-((dayofweek-1+lastDay)%7)
			
			int nbsp=(7-((dayOfWeek-1+lastDay)%7))%7;
			for(int i=0;i<nbsp;i++){
				out.print("<td>&nbsp;</td>");
			}
		%>

	</tr>
</table>

</div>
</section>
<div style="margin: 0 auto; text-align: right;">
	<br/>
	<address >서울특별시 영등포구 양평동3가 15-1 월드메르디앙비즈센터 4층 401 402호 연락처 : 02-6340-2233<br/>COPYRIGHT &copy;
	iCox. All Rights Reserved </address>
	</div>
</div>

</body>
</html>