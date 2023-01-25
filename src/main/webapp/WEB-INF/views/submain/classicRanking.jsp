<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멀티플레이::랭킹" name="title" />
</jsp:include>

<c:set var="searchType" value="${param.searchType}"></c:set>
<c:if test="${empty searchType}">
	<c:set var="searchType" value="${'title'}"></c:set>
</c:if>

<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/ranking.css">

<!-- 검색 부 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- 장르별, 지역별 랭킹 선택창 -->
<div class="container">
	<div class="genre-select-1">
		<ul class="genre-middle-select">
			<li class="genre-block"><a class="genre-1" href="#"
				id="ranking-1">장르별 랭킹</a></li>
			<!-- <li class="genre-block"><a class="genre-1" href="#"
				id="ranking-2">지역별 랭킹</a></li> -->
		</ul>
	</div>
	<div class="genre-select-2">
		<ul class=tab-container>
			<li class="genre-tab" data-tab="tab1">
				<button onclick="location.href='${path}/submain/musicalRanking'"
					class="genre-button-1">뮤지컬</button>
			</li>
			<li class="genre-tab" data-tab="tab2">
				<button onclick="location.href='${path}/submain/playRanking'"
					class="genre-button-1">연극</button>
			</li>
			<li class="genre-tab" data-tab="tab3">
				<button onclick="location.href='${path}/submain/concertRanking'"
					class="genre-button-1">콘서트</button>
			</li>
			<li class="genre-tab" data-tab="tab4">
				<button onclick="location.href='${path}/submain/classicRanking'"
					class="genre-button-1 active">클래식/무용</button>
			</li>
			<li class="genre-tab" data-tab="tab5">
				<button onclick="location.href='${path}/submain/displayRanking'"
					class="genre-button-1">전시</button>
			</li>
		</ul>

	</div>
</div>
<!-- 장르별, 지역별 랭킹 선택창 끝 -->

<!-- 장르 선택 끝 -->

<!-- 랭킹, 공연명, 기간/장소, 예매율, 예매하기 부분 -->
<section class="ranking-list">
	<div class="container">
		<div class="content-container">
			<h1 class="select-date">
				<div class="calendar-date" id="current_date"></div>
			</h1>
			<!-- 선택한 날짜의 해당하는 랭킹 출력하기 -->
			<table class="ranking-table">
				<tr>
					<th class="table-header">랭킹</th>
					<th class="table-header" colspan="2">공연명</th>
					<th class="table-header">기간/장소</th>
					<th class="table-header">예매율</th>
					<th class="table-header">예매하기</th>
				</tr>
				<c:if test="${empty rankingList}">
					<tr>
						<td style="text-align: center; font-size: 25px;" colspan="5">조회된
							내용이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty rankingList}">
					<c:forEach var="rankingList" items="${rankingList}">
						<tr>
							<td class="ranking-content"><strong><p
										style="width: 60px;">
										<c:out value="${rankingList.rankNo}" />
									</p></strong></td>
							<td class="ranking-content"><img
								src="<c:out value="${rankingList.poster}"/>"
								style="width: 150px; height: 200px;" /></td>
							<td class="ranking-content" style="width : 300px;"><strong><c:out
										value="${rankingList.prfnm}" /></strong></td>
							<td class="ranking-content"><fmt:formatDate var="dayFrom"
									value="${rankingList.prfpdfrom}" pattern="yyyy.MM.dd" /> <c:out
									value="${dayFrom}" />&#32;~&#32; <fmt:formatDate var="dayTo"
									value="${rankingList.prfpdto}" pattern="yyyy.MM.dd" /> <c:out
									value="${dayTo}" /><br>
								<p class="ranking-place">
									<strong><c:out value="${rankingList.fdtynm}" /></strong>
								</p></td>
							<td class="ranking-content">
								<p style="font-weight: 600; color: #ffaa46; font-size: 20px;">
									<c:out value="${rankingList.bookRate}" />

								</p>
							</td>
							<td class="ranking-content">
								<button type="button" onclick="location.href='${path}/submain/genreDetail?cno=${rankingList.cultureNo}'" class="btn btn-warning">예매하기</button> <br>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</section>

<!--  위로가기 버튼 -->
<div id="goingTop" onclick="window.scrollTo(0,0);">↑</div>

<script>
	date = new Date();
	year = date.getFullYear();
	month = date.getMonth() + 1;
	day = date.getDate();
	document.getElementById("current_date").innerHTML = year + "년 " + month + "월 " + day + "일"; 
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>