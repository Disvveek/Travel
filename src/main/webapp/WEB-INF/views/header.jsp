<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행어때</title>
</head>
<style>
.header{
	padding-bottom:10px;
}
.body{
	height:80%;
	padding:10px;
	text-align:center;
}
.footer{
	position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
	padding: 10px 0;
	text-align: center;
}
.menuList{
	list-style:none;
	margin:0px;
	padding:0px;
}
.menuList li{
	display: inline !important;
	flot:left;
}
.login{
	padding:10px;
	text-align:right;
	font-size:small;
}
.taps{
	padding:10px;
	text-align:center;
}
.taps .menuList li{
	margin: 10px;
}
.logo{
	position:absolute;
	top:10px;
	left:48.5%;
}
a:link{
	text-decoration:none;
}
a:visited{
	text-decoration:none;
	color:black;
}
</style>
<body>
<div class="header">
	<span class="logo" style="color:red;"><a href="/main/index"><image src="" />LOGO</a></span>
	<div class="login">
		<ul class="menuList">
			<li>로그인</li>
			<li>회원가입</li>
		</ul>
	</div>
	
	<div class="taps">
		<ul class="menuList">
			<li><a href="/travel/main">여행지 찾기</a></li>
			<li><a href="">공지사항</a></li>
			<li><a href="">마이페이지</a></li>
		</ul>
	</div>
</div>