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
								<a id="stampNav" class="nav-link selectBox" href="${path}/member/mystamp"><i class="fa-solid fa-ticket"></i>스탬프</a>
							</li>
							<!-- Nav item -->
							<li class="nav-item">
								<a id="bookNav" class="nav-link " href="${path}/member/mybooked"><i class="fa-solid fa-list-ul"></i>예매 내역</a>
							</li>
							<!-- Nav item -->
							<li class="nav-item">
								<a id="pwchangeNav" class="nav-link" href="${path}/member/mypwChange"><i class="fa-solid fa-key"></i>비밀번호 변경</a>
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
				<%-- Card : 스탬프 시작 --%>
				<div id="mypageStamp" class="card target">
					<!-- Card header -->
					<div class="card-header">
						<h3 class="mb-0"> <span id="current_date"></span>월의 스탬프</h3>
						<p class="mb-0">
							이번 달 미션을 완료하세요!
						</p>
					</div>
					<!-- Card body -->
					<div class="card-body">
						<ul class="stamp-list">
							<li class="mypage-stamp success"><i class="fa-solid fa-stamp fa-5x"></i>예매 1회</li>
							<li class="mypage-stamp success"><i class="fa-solid fa-stamp fa-5x"></i>예매 2회</li>
							<li class="mypage-stamp success"><i class="fa-solid fa-stamp fa-5x"></i>예매 3회</li>
							<li class="mypage-stamp success"><i class="fa-solid fa-stamp fa-5x"></i>후기 작성</li>
							<li class="mypage-stamp success"><i class="fa-solid fa-stamp fa-5x"></i>후기 작성</li>
							<li id="mystamp-result" class="mypage-stamp success"><i class="fa-regular fa-square-check fa-5x"></i>10%할인쿠폰</li>
						</ul>
						<ul class="stamp-list">
							<li class="mypage-stamp success"><i class="fa-solid fa-stamp fa-5x"></i>예매 4회</li>
							<li class="mypage-stamp"><i class="fa-solid fa-stamp fa-5x"></i>예매 5회</li>
							<li class="mypage-stamp"><i class="fa-solid fa-stamp fa-5x"></i>예매 6회</li>
							<li class="mypage-stamp"><i class="fa-solid fa-stamp fa-5x"></i>후기 작성</li>
							<li class="mypage-stamp"><i class="fa-solid fa-stamp fa-5x"></i>후기 작성</li>
							<li id="mystamp-result" class="mypage-stamp"><i class="fa-regular fa-square-check fa-5x"></i>동반1인 무료</li>
						</ul>
					</div>
				</div>
				<%-- 스탬프 끝 --%>
			</div>
		</div>
		<%-- 콘텐츠 부 끝 --%>
	</div>
</section> <%-- 맨 끝 --%>

<script src="${path}/resources/js/mypage.js"></script>


<script>
	date = new Date();
	month = date.getMonth() + 1;
	document.getElementById("current_date").innerHTML = month;
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>