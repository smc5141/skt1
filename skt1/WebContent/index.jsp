<%@page import="skt1.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title></title>
<script type="text/javascript">
	$(function(){
		$('.carousel').carousel({
			  interval: 1500
			})
	})
	
	
</script>

<style type="text/css">
 #wrap{
		width:80%;
		height:80%; 
		  margin:0 auto;
 }

	a{
		text-decoration: none;
		color: #666;
	}
	img{
		border:0;
	}
	li{
		list-style: none;
	}
	body{
		
	}
	header{
		width: 100%;
		height: 150px;
		background-color: black;
		position: relative;
	}
	h1{

		width: 250px;
		height: 150px;
		margin-left: 30px;
	}
	h1 img{ width:90%; heigt:100%;}
	.gnb{
		width: 800px;
		height: 100px;
		position: absolute;
		top: 25px;
		right: 400px;
	}
	.gnb li{
		float: left;
		width: 20%;
		text-align: center;
		line-height: 100px;
	}
	.gnb li a{
		display: block;
		width: 100%;
		height: 100%;
		color: #fff;
		font-size: 18px;
		font-family: Montserrat, sans-serif;
	}
	.gnb li a:hover{
		text-decoration: underline;
	}
.container {
    padding: 80px 120px;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  .carousel-inner img {
    -webkit-filter: grayscale(90%);
    filter: grayscale(90%); /* make all photos black and white */ 
    width: 100%; /* Set width to 100% */
    margin: auto;
  }
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }  
  .row{
  width:1300px;
  margin:0 auto;
  }
</style>
</head>
<body>
	<div id="wrap" >
		<header>
			<h1><img src="img/skt1.jpeg" alt="skt1logo"><!--로고이미지 넣는곳--></h1>
			<ul class="gnb">
				<li><a href="">경기일정</a></li>
				<li><a href="AnsController.do?command=boardlistpage&pnum=1">자유게시판</a></li>
				<li><a href="LoginController.do?command=insert">회원가입</a></li>
				<li><a href="LoginController.do?command=login">로그인</a></li>
				<li><a href="">마이페이지</a></li>
			</ul>
		</header>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/sk1.jpg" alt="New York" width="1200" height="700">
        <div class="carousel-caption">
          <h3>선수 사진</h3>
          <p>역시 화질 개구리다</p>
        </div>      
      </div>

      <div class="item">
        <img src="img/sk2.jpg" alt="Chicago" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Sk t1 그림버전</h3>
          <p>화질 개구리다</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="img/sk3.jpg" alt="Los Angeles" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Sk t1 Faker</h3>
          <p>페이커!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<div class="container text-center">
  <h3>만든사람</h3>
  <p><em>기능이 별로없다</em></p>
  <p>we are the champion</p>
  <br>
  <div class="row" >
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>t</p>
        <p></p>
        <p></p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Name</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p></p>
        <p></p>
        <p></p>
      </div>
    </div>
  </div>
</div>
	</div>
</body>
</html>