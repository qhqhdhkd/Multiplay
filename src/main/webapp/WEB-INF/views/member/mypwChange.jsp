<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멀티플레이::마이페이지" name="title" />
</jsp:include>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/mypage.css">

<section id="content">
	<div class="row mt-0 mt-md-4 mb-md-4">
		<%-- 왼쪽 navbar 시작 --%>
		<div class="col-lg-3 col-md-4 col-12">
			<nav class="navbar navbar-expand-md navbar-light shadow-sm mb-4 mb-lg-0 sidenav">
				<div class="collapse navbar-collapse" id="sidenav">
					<div class="navbar-nav flex-column">
             			<!-- List -->
						<ul class="list-unstyled ms-n2 mb-0">
							<!-- Nav item -->
							<li class="nav-item">
								<a id="editNav" class="nav-link" href="${path}/member/mypage"><i class="fa-solid fa-user"></i>회원정보</a>
							</li>
							<!-- Nav item -->
							<li class="nav-item">
								<a id="stampNav" class="nav-link" href="${path}/member/mystamp"><i class="fa-solid fa-ticket"></i>스탬프</a>
							</li>
							<!-- Nav item -->
							<li class="nav-item">
								<a id="bookNav" class="nav-link" href="${path}/member/mybooked"><i class="fa-solid fa-list-ul"></i>예매 내역</a>
							</li>
							<!-- Nav item -->
							<li class="nav-item">
								<a id="pwchangeNav" class="nav-link selectBox" href="${path}/member/mypwChange"><i class="fa-solid fa-key"></i>비밀번호 변경</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<%-- 왼쪽 navbar 끝 --%>
		
		<%-- 콘텐츠 부 시작 --%>
		<div class="col-lg-9 col-md-8 col-12">
			<div class="mypage-card-list">
				<%-- Card : 비밀번호변경 시작 --%>
				<div id="mypagePw" class="card target">
					<!-- Card header -->
					<div class="card-header">
						<h3 class="mb-0"> 비밀번호 변경</h3>
					</div>
					<!-- Card body -->
					<form action="${path}/member/updatePwd" method="post">
						<div class="card-body">
									<!-- 현재 비밀번호 입력 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>현재 비밀번호</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
									<input type="password" class="form-control mb-1" name="userPw" id="curPw" placeholder="현재 비밀번호를 입력하세요." />
								</div>
							</div>
								<!-- 새로운 비밀번호 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>새 비밀번호</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
										<input type="password" class="form-control mb-1" name="userPwd" id="pass1" placeholder="새 비밀번호를 입력하세요." required />
								</div>
							</div>
								<!-- 새로운 비밀번호 다시 입력하기 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>새 비밀번호</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
										<input type="password" class="form-control mb-1" id="pass2" placeholder="한 번 더 입력하세요." />
								</div>
							</div>
								<!-- Button -->
							<div class="row">
								<div class="offset-lg-3 col-lg-6 col-12">
									<input type="submit" class="btn btn-primary mybutton" id="updateSubmit" onclick="return validate();" value="확인" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<%-- 콘텐츠 부 끝 --%>
	</div>
</section> <%-- 맨 끝 --%>

<script>
	$(document).ready(() => {
		
		
		$("#updateSubmit").on("click", (e) => { // 새로운 비밀번호 입력값이 같은지
			let curPw = $("#curPw").val();
			let pass1 = $("#pass1").val();			
			let pass2 = $("#pass2").val();
			
			if(pwEncoder.matches(curPw, user.getUserPw()) == false){
				alert("비밀번호가 틀렸습니다.");
			}
			
			if(pass1.trim() != pass2.trim()) {
				alert("새 비밀번호가 일치하지 않습니다.");
				
				$("#pass1").val("");
				$("#pass2").val("");
				$("#pass1").focus();
				
				return false;
			}		
		});
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>