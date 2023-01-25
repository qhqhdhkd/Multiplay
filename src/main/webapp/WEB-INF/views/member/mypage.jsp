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
								<a id="editNav" class="nav-link selectBox" href="${path}/member/mypage"><i class="fa-solid fa-user"></i>회원정보</a>
							</li>
							<!-- Nav item -->
							<li class="nav-item">
								<a id="stampNav" class="nav-link" href="${path}/member/mystamp"><i class="fa-solid fa-ticket"></i>스탬프</a>
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
				<%-- Card : 회원정보수정 시작 --%>
				<div id="mypageEdit" class="card target">
					<!-- Card header -->
					<div class="card-header">
						<h3 class="mb-0">회원 정보 수정</h3>
						<p class="mb-0">
							Add your social profile links in below social accounts.
						</p>
					</div>
					<!-- Card body -->
					<form action="${path}/member/update" method="post">
						<div class="card-body">
							<div class="row mb-5">
									<!-- 아이디 확인 -->
								<div class="col-lg-3 col-md-4 col-12">
									<h4>아이디</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
									<input type="text" class="form-control mb-1" name="userId" value="${loginMember.userId}" readonly />
								</div>
							</div>
								<!-- 비밀번호 변경 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>비밀번호</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
										<a href="${path}/member/mypwChange" class="btn btn-primary pwbutton">비밀번호 변경</a>
								</div>
							</div>
								<!-- 이름 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>이름</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
									<input type="text" class="form-control mb-1" name="userName" value="${loginMember.userName}" readonly />
								</div>
							</div>
								<!-- 생년월일 확인 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>생년월일</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
									<input type="text" class="form-control mb-1" name="userBirth" value="${loginMember.userBirth}" readonly />
								</div>
							</div>
								<!-- 전화번호 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>전화번호</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
									<input type="text" class="form-control mb-1" name="userPhone" value="${loginMember.userPhone}" />
									<small class="text-muted">
									</small>
								</div>
							</div>
								<!-- 이메일 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>이메일</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
									<input type="text" class="form-control mb-1" name="userEmail" value="${loginMember.userEmail}" />
								</div>
							</div>
								<!-- 주소 -->
							<div class="row mb-5">
								<div class="col-lg-3 col-md-4 col-12">
									<h4>주소</h4>
								</div>
								<div class="col-lg-9 col-md-8 col-12">
									<input type="text" class="form-control mb-1" name="userAddress" value="${loginMember.userAddress}" />
								</div>
							</div>
								<!-- Button -->
							<div class="row">
								<div class="offset-lg-3 col-lg-6 col-12">
									<button type="submit" class="btn btn-primary mybutton">수정하기</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<%-- 회원정보수정 끝 --%>
			</div>
		</div>
		<%-- 콘텐츠 부 끝 --%>
	</div>
</section> <%-- 맨 끝 --%>

<script src="${path}/resources/js/mypage.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>