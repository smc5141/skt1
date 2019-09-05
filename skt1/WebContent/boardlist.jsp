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
		$("form").submit(function(){
			var bool=true;
			var count=$(this).find("input[name=chk]:checked").length;//체크된 input태그의 개수
			if(count==0){
				alert("최소하나이상 체크해야된다~~");
				bool=false;
			}
			return bool;
		});
		

		
		

</script>
<style type="text/css">
	img{width: 12px; height: 12px;}
	

	
</style>
</head>
<%
// 	Object obj=request.getAttribute("list");
	List<AnsDto> list =(List<AnsDto>)request.getAttribute("list"); 
	
	Map<String,Integer>map=(Map<String,Integer>)request.getAttribute("pmap");
	
	LoginDto ldto=(LoginDto)request.getAttribute("ldto");
%>
<body>

<jsp:useBean id="util" class="skt1.utils.Util"  />
<h1>게시판글목록</h1>
<form action="AnsController.do" method="post">
<input type="hidden" name="command" value="muldel" />
<table border="1">
	<col width="50px" />
	<col width="50px" />
	<col width="100px" />
	<col width="300px" />
	<col width="100px" />
	<col width="50px" />
	<col width="50px" />
	<col width="50px" />
	<col width="50px" />
	<col width="50px" />
	<tr>
		<th><input type="checkbox" name="all" onclick="allSel(this)"/></th>
		<th>번호</th>
		<th>작성자</th>
		<th>제 목</th>
		<th>작성일</th>		
		<th>조회수</th>
		
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr>
				<td colspan="6">----작성된 글이 없습니다.----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><input type="checkbox" name="chk" value="${dto.seq}"/></td>
					<td>${dto.seq}</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.delflag=='Y'}">
							<td>-----삭제된 글입니다.-----</td>
						</c:when>
						<c:otherwise>
							<td>
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
			<a href="AnsController.do?command=boardlistpage&pnum=<%=map.get("prePageNum")%>">◀</a>
			<%
// 				int pcount=(Integer)request.getAttribute("pcount");
				for(int i=map.get("startPage");i<=map.get("endPage");i++){
					%>
					<a href="AnsController.do?command=boardlistpage&pnum=<%=i%>" style="text-decoration: none;"><%=i%></a>				
					<%
				}	
				
			%>
			<a href="AnsController.do?command=boardlistpage&pnum=<%=map.get("nextPageNum")%>">▶</a>
		</td>
	</tr>
	<tr>
		<td colspan="6">
			<input type="button" value="글추가" 
			       onclick="location.href='AnsController.do?command=insertForm&id=<%=ldto.getId()%>'"/>
			<input type="submit" value="글삭제"/>       
		</td>
	</tr>
</table>
</form>

</body>
</html>









