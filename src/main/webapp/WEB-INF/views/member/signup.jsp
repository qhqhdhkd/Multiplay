<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<title>멀티플레이::회원가입</title>

<!-- 우리가 추가한 style -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css">
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

    <style>
        body{
            background-color: #fff7ed;
        }
        a{
        text-decoration: none;
        color: black;
        }
        a:visited{
        text-decoration: none;
        color: black;
        }
        ul{margin: 0px; padding: 0px;}
        li{list-style: none;}
        form{
            position: absolute;
            width: 510px;
            height: 900px;
            top: 50%;
            left: 50%;
            margin-top: -450px;
            margin-left: -270px;
            background-color: white;
           	box-shadow: 3px 3px 3px lightgrey;
        }
        form>a>img{
            width: 60px;
            height: 55px;
            padding-top: 30px;
            padding-bottom: 15px;
            padding-left: 52px;
        }
        .log1{
            font-size: 1.7rem;
            font-weight: 600;
            padding-left: 52px;
        }
        .log2{
            font-size: 0.9rem;
            font-weight: 600;
            padding-left: 52px;
        }
        .log3{
            margin-top: 15px;
            margin-bottom: 10px;
            padding-left: 52px;
            font-weight: 600;
        }
        .box1-1{
            font-weight: 700;
            overflow: hidden;
        }
        .box1-1 li{
            margin-right: 50px;
            float: left;
        }
        .box1-1 a{
            
            float: left;
        }
        .button{
        width: 100px !important;
        height: 30px !important;
        background-color: rgb(251, 188, 4);
        color: white;
        border: 0px;
        font-weight: 800;
        font-size: 15px;
        padding: 2px;
        border-radius: 4px;
        }
        .button:hover{
        background-color: black;
        color:white;
        transition: .1s ease-in;
        }
        .table-button{
            height: 40px !important;
            width: 400px !important;
            margin-top: 20px;
            color: white;
            margin-left: 52px;
        }
        .box1{
            height: 35px;
            width: 480px;
            /* background-color: rgb(141, 96, 96); */
            overflow: hidden;
            padding-left: 52px;
        }
        .box1 input{
            height: 25px;
            width: 250px;
            margin-right: 40px;
            float: left;
        }
        .box2{
            padding-left: 52px;
        }
        .box2 input{
            height: 25px;
            width: 393px;
        }
    </style>

<body>
    <form class="signup-form" action="${path}/member/signup" method="post">
        <a href="${path}"><img src="${path}/resources/images/ours/logo_02.png"></a><br>
        <ul>
            <li><div class="log1">회원가입<br></div></li>
            <div class="box1-1">
                <li><div class="log2">이미 가입하셨나요?</div></li>
                <a href="./login.html">로그인</a>
            </div>
            <li><div class="log3">아이디</div></li>
        </ul>
        <div class="box1">
            <label for ="user_id"></label><input type="text" name="userId" id="newId" class="input_text"  placeholder="아이디를 입력해주세요" required>
            <a href="#"><input type="button" class="button sch_smit" id="checkDuplicate" value="중복검사"/></a>
        </div>
        <li><div class="log3">비밀번호<br></div></li>
        <div class="box2">
            <label for="pwd"></label><input type="password" name="userPw" id ="pass1" class = "input_text" placeholder="특수문자, 대,소문자 포함한 8자 이상 16자이하" required>
        </div>
        <li><div class="log3">비밀번호 확인<br></div></li>
        <div class="box2">
            <label for="pwd"></label><input type="password" id ="pass2" class = "input_text" placeholder="비밀번호를 재입력 해주세요" required>
        </div>
        <li><div class="log3">이름<br></div></li>
        <div class="box2">
            <label for ="name"></label><input type="text"  name="userName" id="name" placeholder="홍길동">
        </div>
        <li><div class="log3">생년월일<br></div></li>
        <div class="box2">
            <input type="date"  name="userBirth" id='currnetDate'>
        </div>
        <li><div class="log3">전화번호<br></div></li>
        <div class="box2">
            <input type="text" name="userPhone" id="phone1" class="p1" placeholder="숫자만 입력하세요">
        </div>
        <li><div class="log3">이메일<br></div></li>
        <div class="box2">
            <label for="email"></label><input type="email" name = "userEmail" id ="email" class = "email" placeholder="이메일을 입력하세요." required>
        </div>
        <li><div class="log3">주소<br></div></li>
        <div class="box2">
            <label for ="address"></label><input type="address" name = "userAddress" id ="address" class = "address" placeholder="주소입력" required>
        </div>
        <input type="submit" id="enrollSubmit"  class="button table-button" value="가입"/>
    </form>

<script type="text/javascript">
	$(function() {
		$("#pass2").blur((event) => {
			let pass1 = $("#pass1").val();			
			let pass2 = $(event.target).val();
			
			if(pass1.trim() != pass2.trim()) {
				alert("비밀번호가 일치하지 않습니다.");
				
				$("#pass1").val("");
				$(event.target).val("");
				$("#pass1").focus();
			}
		});
    	
	    $("#enrollSubmit").on("click", () => {
	    	// TODO 전송하기 전에 각 영역에 유효성 검사로직을 추가하는 부분!
	    	//return false;
	    });
	    
	    // 아이디 중복을 확인하는 AJAX 코드
	    $("#checkDuplicate").on("click", () => {
	    	let id = $("#newId").val();
	    	
	    	if(id.length < 4){
	    		alert("아이디는 최소 4글자입니다.")
	    		return;
	    	}
	    	
	    	$.ajax({
	    		type:"get",
	    		url:"${path}/member/idCheck",
	    		data:{id}, // 속성값이 키값과 같은 이름을 가질때 하나로만 key-value 채운다.
	    		success:
	    			(data)=>{ // validate key값
	    				console.log(data);
	    				if(data.validate === true){
	    					alert("이미 사용중인 아이디입니다.")
	    				} else{
	    					alert("사용 가능합니다.")
	    				}
	    			},
	    		error:
	    			(e)=>{
						console.log(e);	    				
	    			}
	    	});
	    });
	});
</script>
</body>
