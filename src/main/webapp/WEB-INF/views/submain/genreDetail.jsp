<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="멀티플레이::${culture.title}" name="title" />
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/genreDetail.css">

<style type="text/css">
    a { color:#000000;text-decoration:none; }
    .scriptCalendar { text-align:center; }
    .scriptCalendar > thead > tr { line-height: 40px; }
    .scriptCalendar > thead > tr > td { width:40px;height:40px; }
    .scriptCalendar > thead > tr:first-child { border-bottom: 2px solid black; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#F7F7F7; }
    .scriptCalendar > tbody > tr > td { width:40px;height:40px; }
</style>

<section id="content">
		<div class="col">
			<h3 class="mt-3 mb-3 ls-lg">${culture.realmname}</h3>
			<h2>${culture.title}</h2>
			<p>
				<span class="genDT-when d-inline-block pe-sm-3 m-md-0">
					<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${culture.startdate}" />
						~
					<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${culture.enddate}" />
				</span>
				<span class="genDT-where d-inline-block px-sm-3 m-md-0">${culture.place}</span>
			</p>
			<hr>
		</div>
		<div class="row">
			<%-- 포스터 --%>
			<div class="genDT-poster col-md-5 align-items-sm-center">
				<img alt="" src="<c:out value="${culture.thumbnail}"/>" style="width: 300px;">
			</div>
			
			<%-- 설명 시작 --%>
			<div class="genDT-caption col-md-7">
				<table>
					<tr height="40px">
						<th width="100px">등급</th>
						<td>만 10세이상 관람가</td>
					</tr>
					<tr height="40px">
						<th>관람시간</th>
						<td>110분</td>
					</tr>
					<tr height="40px">
						<th>출연</th>
						<td>김주호, 박민성, 테이, 백인태, 김준영, 정재환, 조훈, 임세준, 이은율, 이지연, 유소리, 김시훈, 박이든, 양찬영, 조재철, 크리스 영</td>
					</tr>
					<tr height="40px">
						<th>가격</th>
						<td>
							<div class="genDT-caption-price ps-md-3 py-lg-2">
								R석 <span style="color: rgb(251, 188, 4); font-weight: 600">66,000</span>원 <br>
								S석 <span style="color: rgb(251, 188, 4); font-weight: 600">44,000</span>원
							</div>
						</td>
					</tr>
					<tr height="40px">
						<th>혜택</th>
						<td>사용가능쿠폰(<span style="color: rgb(251, 188, 4); font-weight: 600">1</span>)</td>
					</tr>
				</table>
				<hr>
				<div>
					<p class="genDT-caption-title">공연시간 안내</p>
					<p class="genDT-caption-content">평일 오후 8시 / 수요일 4시, 8시(12월 21일 제외) / 토요일 3시, 7시 / 일, 공휴일 2시, 6시 (월 쉼)</p>
				</div>
				<div>
					<p class="genDT-caption-title">배송정보</p>
					<p class="genDT-caption-content">현장 수령만 가능</p>
				</div>
			</div>
		<%-- 설명 끝 --%>
		
		<!--날짜시간선택, 예매가능좌석 박스-->
		<div class="rn-04 mt-xl-3" id="divTimeTable">
			<div class="rn-04-left"><!--날짜시간선택-->
				<p class="rn-04-left-tit">날짜/시간선택</p>
				<div class="rn-04-left-wrap row">
					<table class="scriptCalendar col-md-6">
					    <thead>
					        <tr>
					            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td>
					            <td colspan="5">
					                <span id="calYear">YYYY</span>년
					                <span id="calMonth">MM</span>월
					            </td>
					            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td>
					        </tr>
					        <tr>
					            <td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
					        </tr>
					    </thead>
					    <tbody></tbody>
					</table>

                    <!--회차정보-->
					<div class="rn-04-left-calist scroll-color mCustomScrollbar _mCS_2 mCS_no_scrollbar" id="PerfPlayTime" style="height: 233px;">
						<a href="#" id="" idtime="1203594" title="오후 4시 00분" onclick="jsf_pdi_ChangePlayTime('calendar','1203594','오후4시00분');">
							<span>1회</span> 오후 4시 00분
						</a>
						<a href="#" idtime="1203583" title="오후 8시 00분" onclick="jsf_pdi_ChangePlayTime('calendar','1203583','오후8시00분');">
							<span>2회</span> 오후 8시 00분
						</a>
					</div>
				</div>
			</div>
            <!--예매가능좌석-->
			<div class="rn-04-right">
				<p class="rn-04-right-tit">예매 가능 좌석</p>
				<div class="rn-04-right-list scroll-color mCustomScrollbar _mCS_4 mCS_no_scrollbar" style="height: 169px;">
					<div id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: none;">
						<div id="mCSB_4_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
							<dl id="SeatRemain">
								<dt>R석</dt><dd><span>(잔여:34석)</span></dd>
								<dt>S석</dt><dd><span>(잔여:22석)</span></dd>
							</dl>
						</div>
						<div id="mCSB_4_scrollbar_vertical" class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;">
							<div class="mCSB_draggerContainer">
								<div id="mCSB_4_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px; height: 0px;">
									<div class="mCSB_dragger_bar" style="line-height: 30px;">
									</div>
								</div>
								<div class="mCSB_draggerRail">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--rn-04-->		
		
		<div class="genDT-bookBtn">
			<a href="${path}/submain/pay">예매하기</a>
		</div>
		
		<%-- 탭메뉴 시작 --%>
		<div class="genDT-tap">
			<%-- 라디오 버튼 --%>
			<input id="genDT-tab1" type="radio" name="tab" ${reviewWrite != '1' ?  'checked':''} />
			<input id="genDT-tab2" type="radio" name="tab" />
			<input id="genDT-tab3" type="radio" name="tab" ${reviewWrite == '1' ?  'checked':''} />
			<%-- 라벨 : 화면에 표시되는 탭 제목 --%>
			<label for="genDT-tab1">상세정보</label>
			<label for="genDT-tab2">예매/취소 안내</label>
			<label for="genDT-tab3">후기</label>
			<hr style="margin-top: -1px;">
			<%-- 탭1 시작 --%>
			<div class="genDT-tap-area genDT-tab1-content">
				<c:if test="${culture.contents1 == null}">
					<h2>장소</h2>
					<p>${culture.placeAddr}</p>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3259.221552293925!2d128.57508681491277!3d35.225854462419086!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356f321adac299ed%3A0x7c834560419e0cd5!2zM8K3MTXslYTtirjshLzthLA!5e0!3m2!1sko!2skr!4v1672295351913!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</c:if>
				<p style="text-align: center;">
					<img src="${culture.contents1}" class="txc-image" style="clear:none;float:none;">
				</p>

				<h2>공지사항</h2>
				<p>※ 티켓 예매 시 공연 안내사항에 동의한 것으로 간주하며, 본 내용은 상황에 따라 추가•변경될 수 있습니다.
				공연 관람에 지장이나 불이익을 받지 않도록 관람 전 반드시 공연 안내사항을 재확인 바랍니다.</p>
				
				<h2>[티켓 예매 일정]</h2>
				<p>- 2022년 11월 9일 (수) 오후 8시 ~(매수제한: 회차당 1인 4매)</p>
				<p>※ 티켓 분실, 파손 등 어떠한 경우에도 재발권 및 입장이 불간으하오니, 티켓보관에 유의해주시기 바랍니다.</p>
				
			</div>
			<%-- 탭2 시작 --%>
			<div class="genDT-tap-area genDT-tab2-content">
				<%-- 예매 시작 --%>
				<div class="genDT-tap2-part row">
					<div class="col-md-3 diplay-ib">
						<h2>예매</h2>
					</div>
					<div class="col-md-9 diplay-ib">
						<p>예매는 PC, 모바일, 고객센터 를 통해 신용카드, 가상계좌(무통장 입금), YES머니, YES상품권, 예치금 등으로 예매하실 수 있습니다.
						(단, 상품마다 사용 가능한 결제 수단이 다르게 적용될 수 있으니 상품 상세페이지 안내 사항을 확인해주세요.)
						무통장입금 결제 선택 시 입금 마감시간은 예매일 익일 밤 11시 29분까지입니다. 입금 마감시간 내 미입금 된 경우 예매가 자동 취소됩니다.
						(단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시 확인해주시기 바랍니다.)
						예매수수료는 다음과 같습니다.</p>
						<table class="genDT-tap3-tbl col-12">
							<tr>
								<th class="col-4">장르</th>
								<th class="col-4">PC / 모바일</th>
								<th class="col-4">전화예매</th>
							</tr>
							<tr>
								<td>콘서트, 뮤지컬, 클래식, 국악, 무용</td>
								<td>장당 1,000원</td>
								<td rowspan="3">장당 2,000원</td>
							</tr>
							<tr>
								<td>연극, 전시</td>
								<td>장당 500원</td>
							</tr>
							<tr>
								<td>체험, 행사</td>
								<td>장당 300원</td>
							</tr>
						</table>
						<br><hr>
					</div>
				</div>
				<%-- 예매 끝 --%>
				<%-- 티켓수령방법 시작 --%>
				<div class="genDT-tap2-part row">
					<div class="col-md-3 diplay-ib">
						<h2>티켓수령방법</h2>
					</div>
					<div class="col-md-9 diplay-ib">
						<h3>현장수령</h3>
						<p>티켓은 예매자 본인 수령이 기본 원칙입니다.<br>
						공연 당일 예매확인서와 에매자의 신분증을 지참하신 후 공연장 매표소에서 티켓을 수령하시면 됩니다.</p>
						<h3>배송</h3>
						<p>배송을 선택하신 경우 에매완료(결제익일) 기준 5~7일 이내에 예매 시 입력하신 주소로 배송됩니다. (영업일 기준)<br>
						일괄배송의 경우 각 상품의 지정된 배송일부터 순차적으로 배송이 시작됩니다. 영업일 기준 5~7일 정도가 소요되며, 주소지에 따라 추가될 수 있습니다.<br>
						배송 시작일은 상세정보 및 예매공지사항에서 확인하실 수 있습니다.<br>
						티켓 배송은 일반 택배가 아닌 인편 배송으로 진행됩니다. 인편 배송의 경우 경비실이나 우편함 등에 보관이 불가하며 부재 시 반송되니<br>
						반드시 티켓을 직접 받을 수 있는 주소를 기입 바랍니다.<br>
						티켓 수령과 관련된 정책은 상품별로 상이하니 자세한 내용은 각 상품 상세정보에서 확인 부탁드립니다.</p>
						<br><hr>
					</div>
				</div>
				<%-- 티켓수령방법 끝 --%>
				<%-- 취소마감시간 시작 --%>
				<div class="genDT-tap2-part row">
					<div class="col-md-3 diplay-ib">
						<h2>취소마감시간</h2>
					</div>
					<div class="col-md-9 diplay-ib">
						<table class="genDT-tap3-tbl col-12">
							<tr>
								<th class="col-4">공연 관람일</th>
								<th class="col-4">취소 마감일</th>
							</tr>
							<tr>
								<td>화요일 ~ 토요일</td>
								<td>관람일 전일 평일 오후 5시</td>
							</tr>
							<tr>
								<td>일요일 ~ 월요일</td>
								<td>토요일 오전 11시</td>
							</tr>
							<tr>
								<td>공휴일 및 공휴일 익일</td>
								<td>
									공휴일 전일이 평일인 경우 - 오후 5시<br>
									공휴일 전일이 토요일, 일요일인 경우 - 토요일 오전 11시<br>
									<span style="color: red;">공휴일에는 에매 취소 불가</span>
								</td>
							</tr>
						</table>
						<p>관람일 당일 예매하신 건은 취소, 변경, 환불 불가합니다. <br>
						배송이 시작된 티켓의 경우 티켓이 예스24 공연 고객센터로 취소마감시간 이전까지 반송되어야 취소 가능합니다. (취소수수료는 도착일 기준으로 부과됩니다.)<br>
						결제수단을 복수로 선택한 경우 인터넷으로 부분취소가 불가하오니, 고객센터로 문의해주시기 바랍니다.</p>
						<br>
						<p style="color: red;">※ 일부 공연에 한해, 취소 마감 정책이 달라질 수 있습니다.<br>
						각 상품 상세페이지에 안내되어 있는 취소 정책이 우선 적용되오니, 반드시 예매 전 확인해주시기 바랍니다.</p>
						<br><hr>
					</div>
				</div>
				<%-- 취소마감시간 끝 --%>
				<%-- 취소수수료 시작 --%>
				<div class="genDT-tap2-part row">
					<div class="col-md-3 diplay-ib">
						<h2>취소수수료</h2>
					</div>
					<div class="col-md-9 diplay-ib">
						<table class="genDT-tap3-tbl col-12">
							<tr>
								<th class="col-4">취소일</th>
								<th class="col-4">취소수수료</th>
							</tr>
							<tr>
								<td>예매 후 7일 이내</td>
								<td>없음</td>
							</tr>
							<tr>
								<td>예매 후 8일 ~ 관람일 10일 전까지</td>
								<td>뮤지컬, 콘서트, 클래식 : 장당 4,000원 / 연극, 전시 : 장당 2,000원(단, 티켓 금액의 10% 이내)</td>
							</tr>
							<tr>
								<td>관람일 9일 전 ~ 관람일 7일 전까지</td>
								<td>티켓 금액의 10%</td>
							</tr>
							<tr>
								<td>관람일 6일 전 ~ 관람일 3일 전까지</td>
								<td>티켓 금액의 20%</td>
							</tr>
							<tr>
								<td>관람일 2일 전 ~ 취소마감일시까지</td>
								<td>티켓 금액의 30%</td>
							</tr>
						</table>
						<p>예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소 수수료가 부과됩니다.<br>
						관람일 당일 취소 간으한 상품의 경우 관람일 당일 취소 시 티켓금액의 90%가 부과됩니다.</p>
						<p style="color: red;">상품의 특성에 따라 취소수수료 정책이 달라질 수 있습니다. (각 상품 예매 시 취소수수료 확인)</p>
						<br><hr>
					</div>
				</div>
				<%-- 취소수수료 끝 --%>
				<%-- 환불 시작 --%>
				<div class="genDT-tap2-part row">
					<div class="col-md-3 diplay-ib">
						<h2>환불</h2>
					</div>
					<div class="col-md-9 diplay-ib">
						<p>예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.<br>
						배송 및 반송처리 된 티켓의 배송비는 환불되지 않습니다.</p>
						<table class="genDT-tap3-tbl col-12">
							<tr>
								<th class="col-5">결제수단</th>
								<th class="col-7">환불안내</th>
							</tr>
							<tr>
								<td>신용카드</td>
								<td style="text-align: left">	
									일반적으로 취소완료 되고 4~5일(토, 공휴일 제외) 후 카드 승인 취소가 확인됩니다.<br>
									취소시점에 따라 취소수수료와 예매수수료, 배송 받으신 경우 배송비를 제외한 금액만큼 환불 처리 됩니다.<br> 
									(부분 취소 시에는 잔여 티켓 금액 + 수수료 등을 제외하고 환불 처리 됩니다.)<br>
									각 카드사의 취소 정책에 따라 승인취소 및 환급일에 차이가 있을 수 있습니다.<br>
									자세한 사항은 카드사로 문의 바랍니다.
								</td>
							</tr>
							<tr>
								<td>무통장입금</td>
								<td style="text-align: left">	
									<p>예매 취소 시 반드시 환불 받으실 계좌번호와 은행명을 입력하세요.<br>
									취소수수료,예매수수료와 배송 받으신 경우 배송비를 제외한 후 환불 처리됩니다.<br>
									취소 후 환불 처리는 영업일 기준 3~5일 정도 소요됩니다.<br>
									환불진행상태는 MY공연>예매확인/취소 상세내역에서 확인할 수 있습니다.</p>
									<br>
									<p style="color: red;">* 배송 받은 티켓의 취소를 위해 고객센터로 발송하실 때, 환불 받으실 계좌 정보를 기입하여 보내주시면 보다 빠른 환불 처리가 가능합니다.</p>

								</td>
							</tr>
							<tr>
								<td>MULTYPLAY머니, 예치금, MULTYPLAY상품권, 공연예매권</td>
								<td style="text-align: left">	
									예매 취소 시 바로 복원됩니다.<br>
									(단, 사용기간이 만료된 경우 복원되지 않으니 취소 전 확인해주시기 바랍니다.)
								</td>
							</tr>
						</table>
					</div>
				</div>
				<%-- 환불 끝 --%>
				
				
			</div>
			<%-- 탭3 시작 --%>
			<div class="genDT-tap-area genDT-tab3-content">
				<!-- 후기 작성 Form -->
				<div id="review-container">
			    	<div class="review-editor" align="center">
			    		<form action="${path}/ReviewWrite" method="post">
			    			<input type="hidden" name="cno" value="${culture.cno}" />
			    			<input type="hidden" name="userId" value="${loginMember.userId}" />
							<textarea name="reviewContent" id="reviewContent" cols="130" rows="3"></textarea>
							<button type="submit" id="btn-insert">등록</button>	  	
			    		</form>
			    	</div>
			   	</div>
			   	
			   	<!-- 후기 출력 -->  <!-- 수정할 부분 -->
				<table id="tbl-comment">
				  <c:if test="${empty reviewList}">
					  <tr>
					    <td class="comment-count" colspan="2" style="border-color: none;">후기 0 개</td>
					  </tr>
				  </c:if>
				  <c:if test="${!empty reviewList}">
				  	<tr>
				    	<td class="comment-count" colspan="2" style="border-color: none;">후기 ${reviewSize} 개</td>
				 	</tr>
				  	<c:forEach var="reviewList" items="${reviewList}">
				      <tr class="comments"  ${(loginMember.userId == reviewList.userId || loginMember.userId == admin) ? 'id="comment"':''}>
				        <td align="center" width="180px">
				        	<span class="heart" id="heart${reviewList.reviewNo}" value="false" onclick="onClickHeart('heart${reviewList.reviewNo}', ${reviewList.reviewNo});">♥</span>
				        	<span id="reactionCount${reviewList.reviewNo}" ><c:out value="${reviewList.reactionCount}"/></span>
				        </td>
				        <td class="comment">
				          <input type="hidden" name="reviewNo" value="${reviewList.reviewNo}"/>
				          <sub class="comment-writer">${reviewList.userId}</sub>
				          <sub class="comment-date"><fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${reviewList.createDate}"/></sub><br>
				          <c:out value="${reviewList.reviewContent}"/>
				        </td>
				        <td class="comment comment-btn">
				        	<c:set var="admin" value="admin"></c:set>
				        	<c:if test="${ !empty loginMember && (loginMember.userId == reviewList.userId || loginMember.userId == admin)}">
				        		<div class="reply-btns">
				        			<form action="${path}/ReviewDel?reviewNo=${reviewList.reviewNo}&cno=${culture.cno}" method="post">
						         		<button type="submit" class="btn-delete" id="btn-delete" >삭제</button>
				        			</form>
						         </div>
						     </c:if>
				        </td>
				      </tr>
			      	</c:forEach>
			      </c:if>
			      <c:if test="${empty reviewList}">
			      	<tr>
						<td colspan="3" style="text-align: center;">등록된 후기가 없습니다.</td>
					</tr>
			      </c:if>
			    </table>
			</div>
		</div>
		<%-- 탭메뉴 끝 --%>
		
		<!--  위로가기 버튼 -->
		<div id="goingTop" onclick="window.scrollTo(0,0);"> ↑</div>
		
	</div>
</section>

<script src="${path}/resources/js/genreDetail.js"></script>

<script>
    // 초기화 문구
    $(function(){
        // 하트 class 초기화
        heartItems = document.getElementsByClassName('heart');
        for(i = 0; i < heartItems.length; i++){
            heartValue = JSON.parse(heartItems[i].getAttribute('value'));

            if(heartValue == true){
                heartItems[i].innerHTML = '♥';
            }else{
                heartItems[i].innerHTML = '♡';
            }
        }
    });

    function onClickHeart(id, no){
        heartValue = JSON.parse($('#'+id).attr('value'));
        heartValue = !heartValue;
        var form = {
				reviewNo : no,
		}
        
        // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
     if(heartValue == true){
        $.ajax({
			url : '${path}/ReactionCount',
			method : 'POST',
			data : form,
			dataType : 'json',
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			success: function(result){
				$("#reactionCount" + no).html(result); // 후기 테이블 숫자만 새로고침하는 문장
				alert('공감추가 : ' + result);
			},
			error: function(){
				alert('공감+추가+실패');
			}
		})
     } else{
    	 $.ajax({
   			url : '${path}/ReactionDecount',
   			method : 'POST',
   			data : form,
   			dataType : 'json',
   			contentType : "application/x-www-form-urlencoded; charset=utf-8",
   			success: function(result){
   				$("#reactionCount" + no).html(result); // 후기 테이블 숫자만 새로고침하는 문장
   				alert('공감삭제 : ' + result);
   			},
   			error: function(){
   				alert('공감-삭제-실패');
   			}
   		})
     }

        $('#'+id).attr('value', ''+heartValue);
        if(heartValue == true){
            $('#'+id).text('♥');
        }else{
            $('#'+id).text('♡');
        }
    }

	


</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>