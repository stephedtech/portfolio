<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=“en”>
<head>
<meta charset=“UTF-8” />
<meta http-equiv=“X-UA-Compatible” content=“IE=edge” />
<meta name=“viewport” content=“width=device-width, initial-scale=1.0” />
<title>ShopHeader</title>\
<script type="text/javascript">
$(function(){

	//검색 기능 수행 코드
	$("#search").click(function(){
		var keyword = $("#keyword").val();
		if(keyword == ""){
			alert("검색어를 입력하세요");
			return;
		}
		var select = $("#sel").val();
		console.log(select, keyword);
		location.href="./list?colname="+select+"&keyword="+keyword+"&pageNum=1";
		
	});
});


</script>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-weight: 500;
	font-size: 16px;
	font-family: “SF Pro KR”, “SF Pro Text”, “Yoon Gothic”, “Myriad Set Pro”,
		system-ui, -apple-system, BlinkMacSystemFont, “Segoe UI”,
		“SF Pro Icons”, “Apple Legacy Icons”, “Apple Gothic”, “HY Gulim”,
		“MalgunGothic”, “HY Dotum”, “Lexi Gulim”, “Helvetica Neue”,
		“Helvetica”, “Arial”, sans-serif;
}

header {
	background-color: #f8f8fa;
	height: 140px;
}

.header1 {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 30px 10%;
}

.buttons {
	width: 200px;
	align-items: center;
}

.logo {
	flex: 1;
	margin-left: 30px;
	margin-right: 30px;
	cursor: pointer;
}

.login-logout {
	list-style: none;
}

.login-logout li {
	display: inline-block;
	padding: 0px 20px;
}

.login-logout li a {
	text-decoration: none;
	color: #767676;
	transition: all 0.3s ease 0s;
}

.login-logout li a:hover {
	color: #999999;
	cursor: pointer;
}

.nav-bar {
	text-align: center;
	position: absolute;
	width: 100%;
	height: 80px;
	float: none;
	transform: translate(27%, 0%);
}

.nav-bar ul {
	list-style: none;
	padding: 0;
	position: absolute;
}

.nav-bar ul li {
	float: left;
	margin-top: 20px;
}

.nav-bar ul li a {
	width: 150px;
	color: #767676;
	display: block;
	text-decoration: none;
	text-align: center;
	padding: 10px;
	border-radius: 10px;
}

.nav-bar ul li a:hover {
	background: #f1f1f5;
}

.nav-bar ul li ul {
	display: none;
	background: #f8f8fa;
}

.nav-bar ul li:hover ul {
	display: block;
}

.nav-bar ul li ul li {
	float: none;
}

.nav-bar li:hover {
	cursor: pointer;
}
</style>
<link
	href=“https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css”
	rel=“stylesheet”
	integrity=“sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor”
	crossorigin=“anonymous” />
</head>
<body>
	<header>
		<!-- Button + Logo + Login/Logout -->
		<div class=“header1”>
			<div class=“buttons”>
				<button type=“button” class=“btnbtn-outline-primary”>독특한 세상
				</button>
				<button type=“button” class=“btnbtn-outline-primary”>독특한 숍
				</button>
			</div>

			<div class=“logo”>
				<img src=“#” alt=“#” />
			</div>

			<div class=“login-logout”>
				<ul>
					<li><a href=“#”>로그인</a></li>
					<li><a href=“#”>회원가입</a></li>
					<li><a href=“#”>장바구니</a></li>
				</ul>
			</div>
		</div>
		<!-- Navigation Bar -->
		<div class=“navbar”>
			<div class=“nav-bar” action="./loginProc" method="post">
				<ul>
					<li><a href="toFoodList">사료</a></li>
					<li><a href=“toClothesList”>옷/목줄</a></li>
					<li><a href=“toCageList”>케이지</a></li>
					<li><a href=“toToyList”>장난감</a></li>
				</ul>
			</div>
		</div>
	</header>
</body>
</html>