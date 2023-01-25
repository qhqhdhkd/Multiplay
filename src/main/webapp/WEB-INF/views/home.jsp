<%@page import="com.multi.mvc.board.model.service.BoardService"%>
<%@page import="com.multi.mvc.board.model.mapper.BoardMapper"%>
<%@page import="com.multi.mvc.common.util.PageInfo"%>
<%@page import="com.multi.mvc.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멀티플레이" name="title" />
</jsp:include>

<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/home.hot.css">

<%-- 배너 시작 --%>
<section class="home-banner">
	<div class="home-banner-outer">
		<div class="home-banner-inner-list">
			<div class="home-banner-inner">
				<img class="home-bannerImg"
					src="${path}/resources/images/ours/home_banner01.jpeg">
			</div>
			<div class="home-banner-inner">
				<img class="home-bannerImg"
					src="${path}/resources/images/ours/home_banner02.jpeg">
			</div>
			<div class="home-banner-inner">
				<img class="home-bannerImg"
					src="${path}/resources/images/ours/home_banner03.jpeg">
			</div>
		</div>
	</div>
	<div class="button-list">
		<button class="button-left">
			<i class="fa-solid fa-angle-left fa-3x"></i>
		</button>
		<button class="button-right">
			<i class="fa-solid fa-angle-right fa-3x"></i>
		</button>
	</div>
</section>
<%-- 배너 끝 --%>

<%-- content 시작 --%>
<section id="content">
	<div class="home-content">
		<%-- 인기작품 시작 --%>
		<div class="home-hot">
			<div class="col">
				<h2 class="mb-0 ls-lg">인기작품</h2>
				<hr class="home-hr">
			</div>

			<div class="whot-area">
				<ul id="ulWhatshot">
					<c:if test="${culList != null }">
						<c:forEach var="culList" items="${culList}" begin="2" end="2" step="1">
							 <li>
								<div class="big-one">
										<a href="${path}/submain/genreDetail?cno=${culList.cno}">
											<img src="<c:out value="${culList.thumbnail}"/>">
											<div class="big-one-txt">
												<p class="big-tit">${culList.title}</p>
												<p class="big-detail">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.startdate}" />
													 ~
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.enddate}" /> ${culList.place} /
													<span>청소년할인 50%</span>
												</p>
											</div>
										<p class="big-circle">50%</p></a>
								</div>
							</li>
						</c:forEach>
						<c:forEach var="culList" items="${culList}" begin="1" end="1" step="1">
							<li>
								<div class="whot-list">
									<a href="${path}/submain/genreDetail?cno=${culList.cno}">
										<img src="<c:out value="${culList.thumbnail}"/>" alt="" class="lazyload">
										<div class="whot-list-txt">
											<div>
												<p class="whot-tit">${culList.title}</p>
												<p class="whot-detail">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.startdate}" />
													 ~
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.enddate}" /> ${culList.place}
												</p>
												<p class="whot-event">청소년 할인 30%</p>
											</div>
										</div>
										<p class="whot-list-circle">
											<span>30%</span>
										</p>
									</a>
								</div>
							</li>
						</c:forEach>
						<c:forEach var="culList" items="${culList}" begin="4" end="4" step="1">
							<li>
								<div class="whot-list">
									<a href="${path}/submain/genreDetail?cno=${culList.cno}">
										<img src="<c:out value="${culList.thumbnail}"/>" alt="" class="lazyload">
										<div class="whot-list-txt">
											<div>
												<p class="whot-tit">${culList.title}</p>
												<p class="whot-detail">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.startdate}" />
													 ~
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.enddate}" /> ${culList.place}
												</p>
												<p class="whot-event">프리뷰 할인 40%</p>
											</div>
										</div>
										<p class="whot-list-circle">
											<span>40%</span>
										</p>
									</a>
								</div>
							</li>
						</c:forEach>
						<c:forEach var="culList" items="${culList}" begin="5" end="5" step="1">
							<li>
								<div class="whot-list">
									<a href="${path}/submain/genreDetail?cno=${culList.cno}">
										<img src="<c:out value="${culList.thumbnail}"/>" alt="" class="lazyload">
										<div class="whot-list-txt">
											<div>
												<p class="whot-tit">${culList.title}</p>
												<p class="whot-detail">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.startdate}" />
													 ~
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.enddate}" /> ${culList.place}
												</p>
												<p class="whot-event">커플 할인 20%</p>
											</div>
										</div>
										<p class="whot-list-circle">
											<span>20%</span>
										</p>
									</a>
								</div>
							</li>
						</c:forEach>
						<c:forEach var="culList" items="${culList}" begin="10" end="10" step="1">	
							<li>
								<div class="whot-list">
									<a href="${path}/submain/genreDetail?cno=${culList.cno}">
										<img src="<c:out value="${culList.thumbnail}"/>" alt="" class="lazyload">
										<div class="whot-list-txt">
											<div>
												<p class="whot-tit">${culList.title}</p>
												<p class="whot-detail">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.startdate}" />
													 ~
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.enddate}" /> ${culList.place}
												</p>
												<p class="whot-event">조기예매 할인 30%</p>
											</div>
										</div>
										<p class="whot-list-circle">
											<span>30%</span>
										</p>
									</a>
								</div>
							</li>
						</c:forEach>
						<c:forEach var="culList" items="${culList}" begin="11" end="11" step="1">
							<li>
								<div class="whot-list">
									<a href="${path}/submain/genreDetail?cno=${culList.cno}">
										<img src="<c:out value="${culList.thumbnail}"/>" alt="" class="lazyload">
										<div class="whot-list-txt">
											<div>
												<p class="whot-tit">${culList.title}</p>
												<p class="whot-detail">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.startdate}" />
													 ~
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.enddate}" /> ${culList.place}
												</p>
												<p class="whot-event">화이팅 할인 40%</p>
											</div>
										</div>
										<p class="whot-list-circle">
											<span>40%</span>
										</p>
									</a>
								</div>
							</li>
						</c:forEach>
						<c:forEach var="culList" items="${culList}" begin="15" end="15" step="1">
							<li>
								<div class="whot-list">
									<a href="${path}/submain/genreDetail?cno=${culList.cno}">
										<img src="<c:out value="${culList.thumbnail}"/>" alt="" class="lazyload">
										<div class="whot-list-txt">
											<div>
												<p class="whot-tit">${culList.title}</p>
												<p class="whot-detail">
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.startdate}" />
													 ~
													<fmt:formatDate pattern="yyyy-MM-dd" value="${culList.enddate}" /> ${culList.place}
												</p>
												<p class="whot-event">화이팅 할인 40%</p>
											</div>
										</div>
										<p class="whot-list-circle">
											<span>40%</span>
										</p>
									</a>
								</div>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
		<%-- 인기작품 끝 --%>
		
		
		<%-- 탑5 시작 --%>
		<div class="home-top5">
			<h2 class="mb-0 ls-lg home-diplay-ib">TOP 5</h2>
			<%-- 라디오 버튼 --%>
			<input id="home-tab1" type="radio" name="tab" checked="checked"/>
			<input id="home-tab2" type="radio" name="tab" />
			<input id="home-tab3" type="radio" name="tab" />

			<%-- 라벨 : 화면에 표시되는 탭 제목 --%>
			<label for="home-tab1">전체</label>
			<label for="home-tab2">공연</label>
			<label for="home-tab3">전시</label>

			<hr class="home-hr">
			<%-- 탭1 시작 --%>
			<div class="home-top5-area home-tab1-content">
				<c:if test="${musicalRankingList != null }">
				<ul>
						<c:forEach var="musical" items="${musicalRankingList}">
							<li>
								<div class="home-top5-list">
									<a href="${path}/submain/genreDetail?cno=${musical.cultureNo}">
										<img src="<c:out value="${musical.poster}"/>" alt="" class="home-top5-img">
										<div class="top5-list-txt">
											<div>
												<p class="home-top5-title"><c:out value="${musical.prfnm}"/></p>
												<p class="home-top5-detail">
													<fmt:formatDate var="dayFrom"
													value="${musical.prfpdfrom}" pattern="yyyy.MM.dd" /> <c:out
													value="${dayFrom}" />&#32;~&#32; <fmt:formatDate var="dayTo"
													value="${musical.prfpdto}" pattern="yyyy.MM.dd" /> <c:out
													value="${dayTo}" /><br>
													<br><c:out value="${musical.fdtynm}"/>
												</p>
											</div>
										</div>
									</a>
								</div>					
							</li>
						</c:forEach>
				</ul>
				</c:if>
			</div>
			<%-- 탭2 시작 --%>
			<div class="home-top5-area home-tab1-content">
				<c:if test="${concertRankingList != null }">
				<ul>
						<c:forEach var="concert" items="${concertRankingList}">
							<li>
								<div class="home-top5-list">
									<a href="${path}/submain/genreDetail?cno=${concert.cultureNo}">
										<img src="<c:out value="${concert.poster}"/>" alt="" class="home-top5-img">
										<div class="top5-list-txt">
											<div>
												<p class="home-top5-title"><c:out value="${concert.prfnm}"/></p>
												<p class="home-top5-detail">
													<fmt:formatDate var="dayFrom"
													value="${concert.prfpdfrom}" pattern="yyyy.MM.dd" /> <c:out
													value="${dayFrom}" />&#32;~&#32; <fmt:formatDate var="dayTo"
													value="${concert.prfpdto}" pattern="yyyy.MM.dd" /> <c:out
													value="${dayTo}" /><br>
													<br><c:out value="${concert.fdtynm}"/>
												</p>
											</div>
										</div>
									</a>
								</div>					
							</li>
						</c:forEach>
				</ul>
				</c:if>
			</div>
			<%-- 탭3 시작 --%>
			<div class="home-top5-area home-tab3-content">
				<c:if test="${displayRankingList != null }">
				<ul>
						<c:forEach var="display" items="${displayRankingList}">
							<li>
								<div class="home-top5-list">
									<a href="${path}/submain/genreDetail?cno=${display.cultureNo}">
										<img src="<c:out value="${display.poster}"/>" alt="" class="home-top5-img">
										<div class="top5-list-txt">
											<div>
												<p class="home-top5-title"><c:out value="${display.prfnm}"/></p>
												<p class="home-top5-detail">
													<fmt:formatDate var="dayFrom"
													value="${display.prfpdfrom}" pattern="yyyy.MM.dd" /> <c:out
													value="${dayFrom}" />&#32;~&#32; <fmt:formatDate var="dayTo"
													value="${display.prfpdto}" pattern="yyyy.MM.dd" /> <c:out
													value="${dayTo}" /><br>
													<br><c:out value="${display.fdtynm}"/>
												</p>
											</div>
										</div>
									</a>
								</div>					
							</li>
						</c:forEach>
				</ul>
				</c:if>
			</div>
		
		<%-- 탑5 끝 --%>

		<%-- 섹션 4 : 공연후기 + 공지사항 --%>
		<div class="home-sec04 row">
			<%-- 공연후기 : 자유게시판 말머리 [후기]  시작 --%>
			<div class="home-review col-md-7">
					<h2 class="mb-0 ls-lg home-diplay-ib">공연후기</h2>
					<div class="home-review-radio home-diplay-ib">
						<button class="cardBtnL">&lt;</button>
						<label id="cardLabel1" class="home-cardIndex active">●</label>
						<label id="cardLabel2" class="home-cardIndex">●</label>
						<label id="cardLabel3" class="home-cardIndex">●</label>
						<label id="cardLabel4" class="home-cardIndex">●</label>
						<button class="cardBtnR">&gt;</button>
					</div>
					<hr class="home-hr">
					<div class="home-card-list">
						<div class="home-card-item target" id="cardItem1">
							<a href="#">
								<img src="http://tkfile.yes24.com/Upload2/Display/202212/20221213/와타나베.jpg/dims/quality/70/" alt="" class="home-card-item-img">
								<div class="rni-box">
									<p class="rni-txt">연극 &lt;사나이 와타나베&gt; - 사나이 중 사나이, 그 이름 와타나베</p>
								</div>
							</a>
						</div>
						<div class="home-card-item" id="cardItem2">
							<a href="#">
								<img src="http://tkfile.yes24.com/Upload2/Display/202212/20221214/셰익스피어인러브 copy.jpg/dims/quality/70/" alt="" class="home-card-item-img">
								<div class="rni-box">
									<p class="rni-txt">연극 &lt;셰익스피어 인 러브&gt; 한국 초연</p>
								</div>
							</a>
						</div>
						<div class="home-card-item" id="cardItem3">
							<a href="#">
								<img src="http://tkfile.yes24.com/Upload2/Display/202212/20221220/미수 copy.jpg/dims/quality/70/" alt="" class="home-card-item-img">
								<div class="rni-box">
									<p class="rni-txt">뮤지컬 &lt;미수&gt; - 사극으로 만나는 따뜻한 두 우정 이야기</p>
								</div>
							</a>
						</div>
						<div class="home-card-item" id="cardItem4">
							<a href="#">
								<img src="http://tkfile.yes24.com/Upload2/Display/202212/20221213/와타나베.jpg/dims/quality/70/" alt="" class="home-card-item-img">
								<div class="rni-box">
									<p class="rni-txt">연극 &lt;사나이 와타나베&gt; - 사나이 중 사나이, 그 이름 와타나베</p>
								</div>
							</a>
						</div>
					</div>
								
			</div>
			<%-- 공연후기 : 자유게시판 말머리 [후기]  끝 --%>
			
			<%-- 공지사항 시작 --%>
			<div class="home-notice col-md-5">
				<h2 class="mb-0 ls-lg home-diplay-ib">공지사항</h2>
				<a href="${path}/board/list" class="home-notice-more">+ 더보기</a>
				<hr class="home-hr">
				<div class="home-notice-board" id="mncb01" style="display: block;">
					<ul class="home-notice-list">
						<c:forEach var="board" items="${list}">
						<li>
							<a href="${path}/board/view?no=${board.bno}">
								<p style="font-weight:bold">
								${board.boardTitle}</p>
								<span><fmt:formatDate pattern="yyyy-MM-add" value="${board.createDate}" /></span>
							</a>
						</li>
						</c:forEach>
					</ul><!-- home-notice-list -->
				</div>
			</div>
			<%-- 공지사항 끝 --%>
		</div>
	</div>
</section>
<%-- content 끝 --%>

<%-- preFooter 시작 --%>
<section id="home-preFooter">
	<div class="home-preFooter row align-items-center">
		<div class="home-preFooter-left col-md-6">
			<p class="home-preFooter-tell">1588-1234</p>
			<dl class="ps-20">
				<dt>평일</dt>
				<dd>09:00~18:00</dd>
				<dt>토요일</dt>
				<dd>
					09:00~17:00<span>(일요일 및 공휴일 휴무)</span>
				</dd>
			</dl>
		</div>
		<div class="home-preFooter-right col-md-6">
			<div class="home-icon col-md-3">
				<i class="fa-regular fa-clipboard fa-4x"></i>
				<p>공지사항</p>
			</div>
			<div class="home-icon col-md-3">
				<i class="fa-regular fa-comment fa-4x"></i>
				<p>1:1문의</p>
			</div>
			<div class="home-icon col-md-3">
				<i class="fa-regular fa-envelope fa-4x"></i>
				<p>제휴문의</p>
			</div>
			<div class="home-icon col-md-3">
				<i class="fa-regular fa-pen-to-square fa-4x"></i>
				<p>게시판</p>
			</div>
		</div>
	</div>
	
	<!--  위로가기 버튼 -->
	<div id="goingTop" onclick="window.scrollTo(0,0);"> ↑</div>
</section>

<script src="${path}/resources/js/home.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


