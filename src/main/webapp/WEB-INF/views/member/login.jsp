<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- 우리가 추가한 style -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
<title>멀티플레이::로그인</title>

<style>
body{ background-color: #fff7ed; }

        a{
        text-decoration: none;
        color: black;   /* #000000, #000, rgb(0,0,0) */
        }
        a:visited{
        text-decoration: none;
        color: black;
        }
        ul{margin: 0px; padding: 0px;}
        li{list-style: none;}
        .login{
            position: absolute;
            width: 480px;
            height: 600px;
            top: 50%;
            left: 50%;
            margin-top: -300px;
            margin-left: -270px;
           	background-color: white;
           	box-shadow: 3px 3px 3px lightgrey;
        }
        .login img{
            padding-left: 33px;
            padding-top: 55px;
            width: 60px;
            height: 55px;
            padding-bottom: 15px;
            
        }
        .log1{
            padding-left: 33px;
            font-size: 26px;
            font-weight: 900;
            padding-bottom: 20px;
        }
        .box0{
            padding-left: 33px;
            width: 220px;
            height: 40px;
            color: gray;
            font-size: 16px;
            font-weight: 800;
            /* background-color: rgb(105, 79, 79); */
            float: left;
        }
        .log2{
            padding-right: 100px;
            float: left;
        }
        .log3{
            padding-left: 33px;
            width: 500px;
            /* background-color: rgb(128, 97, 97); */
            font-size: 15px;
            font-weight: 800;
            padding-top: 20px;
        }
        .log4{
            padding-left: 33px;
            width: 500px;
            /* background-color: rgb(128, 97, 97); */
            font-size: 15px;
            font-weight: 800;
        }
        .box1{
            padding-left: 33px;
            color: rgb(212, 212, 212);
            font-weight: 400;
            padding-top: 10px;
            margin-bottom: 10px;
        }
        .box1 input{
            width: 400px;
            height: 25px;
        }
        .box2{
            padding-left: 33px;
            color: aliceblue;
            font-weight: 400;
            padding-top: 10px;
            margin-bottom: 10px;
        }
        .box2 input{
            width: 400px;
            height: 25px;
        }
        .box3{
            padding-left: 33px;
            margin-top: 70px;
            /* background-color: rgb(165, 123, 123); */
            height: 100px;
            width: 500px;
        }
        .box3 img{
            width: 408px;
            height: 40px;
        }
        .box5{
            padding-left: 33px;
            font-size: 13px;
            float: left;
        }
        .box6{
            height: 20px;
            font-size: 15px;
            padding-right: 43px;
            float: right;
        }
        .box4{
            margin-top: 20px;
            font-size: 0.75rem;
            color: aliceblue;
        }
        .box4>a{
            color: aliceblue;
        }
        #loginSubmit{
        width: 407px;
        height: 40px;
        background-color: rgb(251, 188, 4);
        color: white;
        border: 0px;
        font-weight: 800;
        font-size: 15px;
        padding: 2px;
        border-radius: 4px;
        margin-top: 10px;
        }
        #loginSubmit:hover{
        background-color: black;
        color:white;
        transition: .1s ease-in;
        }
        
    </style>
    
    
<body>
	<div class="login">
		<form action="${path}/member/login" method="post">
	        <a href="${path}"><img src="${path}/resources/images/ours/logo_02.png"></a><br>
	        <ul>
	            <li><div class="log1">로그인<br></div></li>
	            <div class="box0"><li>아이디가 없으신가요?</li></div>
	            <li><div class="log4"><a href="${path}/member/signup">회원가입</a></div></li><br>
	            <li><div class="log3">아이디</div></li>
	        </ul>
	        <div class="box1">
	        <label for ="user_id"></label><input type="text" name="userId" id="user_id" class="input_text"  placeholder="아이디를 입력해주세요" required>
	        </div>
	        <li><div class="log3">비밀번호 <br></div></li>
	        <div class="box2">
	        <label for="pwd"></label><input type="password" name="userPwd" id ="pwd" class = "input_text" placeholder="비밀번호를 입력해주세요" required>
	        </div>
	        <div class="box5">
	            <input type="checkbox" name="xxx" value="yyy" check><b> 아이디 저장</b> 
	        </div>
	        <div class="box6">
	            <a href="${path}/member/idpwfind"><b>아이디/비밀번호를 잊으셨나요?</b></a>
	        </div>
	        <div class="box3">
	        <input type="submit" id="loginSubmit" value="로그인"/>
	        </div>
		</form>
	</div>
</body>

