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
								<a id="bookNav" class="nav-link selectBox" href="${path}/member/mybooked"><i class="fa-solid fa-list-ul"></i>예매 내역</a>
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
				<%-- Card : 예매내역 시작 --%>
				<div id="mypageBook" class="card target">
					<!-- Card header -->
					<div class="card-header">
						<h3 class="mb-0"> 예매내역</h3>
					</div>
					<%-- 예매내역 1 --%>
					<div class="card-body">
						<div class="border-bottom pt-0 pb-5">
	                        <div class="row mb-4">
	                            <div class="col-lg-6 col-md-8 col-7 mb-2 mb-lg-0">
	                                <span class="d-block">
	                               		<a href="#">
		                                    <span class="h4">미녀와 야수 [창원]</span>
	                               		</a>
	                            </div>
	                        </div>
	                        <!-- Pricing data -->
	                        <div class="row">
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">예매 일자</span>
	                                <h6 class="mb-0">2022-12-09</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">관람 일자</span>
	                                <h6 class="mb-0">2022-12-20</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">인원</span>
	                                <h6 class="mb-0">2</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">가격</span>
	                                <h6 class="mb-0">132,000원</h6>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <%-- 예매내역 2 --%>
						<div class="border-bottom pt-5 pb-5">
	                        <div class="row mb-4">
	                            <div class="col mb-2 mb-lg-0">
	                                <span class="d-block">
	                                  	<a href="#">
	                                   		<span class="h4">뮤지컬 미수</span>
	                                  	</a>
	                                <p class="mb-0 fs-6">
	                                    
	                                </p>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">예매 일자</span>
	                                <h6 class="mb-0">2022-11-21</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">관람 일자</span>
	                                <h6 class="mb-0">2022-12-03</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">인원</span>
	                                <h6 class="mb-0">4</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">가격</span>
	                                <h6 class="mb-0">400,000원</h6>
	                            </div>
	                        </div>
	                    </div>
	                    
						<%-- 예매내역 3 --%>
						<div class="border-bottom pt-5 pb-5">
	                        <div class="row mb-4">
	                            <div class="col mb-2 mb-lg-0">
	                                <span class="d-block">
	                                  	<a href="#">
	                                   		<span class="h4">연극 빛나는 버러지</span>
	                                  	</a>
	                                <p class="mb-0 fs-6">
	                                    
	                                </p>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">예매 일자</span>
	                                <h6 class="mb-0">2022-11-16</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">관람 일자</span>
	                                <h6 class="mb-0">2022-11-30</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">인원</span>
	                                <h6 class="mb-0">2</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">가격</span>
	                                <h6 class="mb-0">200,000원</h6>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <%-- 예매내역 4 --%>
						<div class="border-bottom pt-5 pb-5">
	                        <div class="row mb-4">
	                            <div class="col mb-2 mb-lg-0">
	                                <span class="d-block">
	                                  	<a href="#">
	                                   		<span class="h4">뮤지컬 브로드웨이 42번가</span>
	                                  	</a>
	                                <p class="mb-0 fs-6">
	                                    
	                                </p>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">예매 일자</span>
	                                <h6 class="mb-0">2022-11-07</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">관람 일자</span>
	                                <h6 class="mb-0">2022-11-29</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">인원</span>
	                                <h6 class="mb-0">2</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">가격</span>
	                                <h6 class="mb-0">220,000원</h6>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <%-- 예매내역 5 --%>
						<div class="border-bottom pt-5 pb-5">
	                        <div class="row mb-4">
	                            <div class="col mb-2 mb-lg-0">
	                                <span class="d-block">
	                                  	<a href="#">
	                                   		<span class="h4">뮤지컬 드라큘라</span>
	                                  	</a>
	                                <p class="mb-0 fs-6">
	                                    
	                                </p>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">예매 일자</span>
	                                <h6 class="mb-0">2022-10-15</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">관람 일자</span>
	                                <h6 class="mb-0">2022-10-16</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">인원</span>
	                                <h6 class="mb-0">1</h6>
	                            </div>
	                            <div class="col-lg-3 col-md-3 col-6 mb-2 mb-lg-0">
	                                <span class="fs-6">가격</span>
	                                <h6 class="mb-0">110,000원</h6>
	                            </div>
	                        </div>
	                    </div>
	                    
					</div>
				</div>
				<%-- 예매내역 끝 --%>
			</div>
		</div>
		<%-- 콘텐츠 부 끝 --%>
	</div>
</section> <%-- 맨 끝 --%>

<script src="${path}/resources/js/mypage.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>