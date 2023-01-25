<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" type="text/css" href="${path}/resources/css/seat.css">



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>멀티플레이::예매</title>
  <link rel="stylesheet" href="seat.css">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  </head>
<body>
  <div class="select-container">
		<div class="select-wrapper">
			<div class="select-title">인원 / 좌석</div>
			<div class="select-seat-container">
				<div class="select-seat-number-container">
					<div class="select-seat-number-wrapper">
						<div class="select-seat">
							<div class="select-seat-age">일반</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-normal">
									<li id="normal" class="select-number-normal clicked" value="0" >0</li>
									<li id="normal" class="select-number-normal" value="1" >1</li>
									<li id="normal" class="select-number-normal" value="2" >2</li>
									<li id="normal" class="select-number-normal" value="3" >3</li>
									<li id="normal" class="select-number-normal" value="4" >4</li>
									<li id="normal" class="select-number-normal" value="5" >5</li>
								</ul>
							</div>
						</div>
						<div class="select-seat">
							<div class="select-seat-age">청소년</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-teen">
									<li class="select-number-teen clicked" value="0" >0</li>
									<li class="select-number-teen"  value="1" >1</li>
									<li class="select-number-teen"  value="2" >2</li>
									<li class="select-number-teen"  value="3" >3</li>
									<li class="select-number-teen"  value="4" >4</li>
									<li class="select-number-teen"  value="5" >5</li>
								</ul>
							</div>
						</div>
						<div class="select-seat">
							<div class="select-seat-age">우대</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul  select-seat-ul-old">
									<li class="select-number-old clicked" value="0">0</li>
									<li class="select-number-old"  value="1" >1</li>
									<li class="select-number-old"  value="2" >2</li>
									<li class="select-number-old"  value="3" >3</li>
									<li class="select-number-old"  value="4" >4</li>
									<li class="select-number-old"  value="5" >5</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="reserve-number-wrapper">
						<div class="reserve-number-title">선택된 좌석 수</div>
						<input id="display" class="reserve-number" value="0" disabled></input>
					</div>
          <div class="select-seat-information">
            <div class="selected-movie">[뮤지컬] 캣츠</div>
            <div class="select-seat-information-wrapper">
              <span class="place">문화예술회관 &nbsp;&nbsp;|&nbsp;&nbsp;</span>
              <span class="place"> 2관 8층 &nbsp;&nbsp;|&nbsp;&nbsp;</span>
              <span class="place"> 남은좌석 &nbsp;</span>
              <input id="remain-seats" class="remain-seats" value="130" disabled></input>
              <span class="place">&nbsp;/ 130</span>
            </div>
            <div class="choose-theater-date">
              <span class="theater-date">2022-12-31</span>
              <div class="theater-time">오후 12시 30분</div>
            </div>
            <div class="selected-seats-wrapper">
              <span class="selected-seats-title">좌석번호</span> 
              <input style="word-break:break-all"  class="selected-seats" value=" 선택한 좌석이 없습니다." disabled></input>
            </div>
            <div class="ticket-price-wrapper">
              <div class="ticket-price-title">가격</div>
              <input id="ticket-price" class="ticket-price" value="0" disabled></input>원
              <button type="button" class="reserve-button">결제하기</button>
            </div>
          </div>
				</div>
			</div>
			<div class="seat-container">
				<div class="seat-wrapper">
					<div class="screen-view-wrapper">
						<div class="screen-view">STAGE</div>
              <div class="seat-container">
                <div class="row">
                  <div class="info">A</div>
                  <div class="info">B</div>
                  <div class="info">C</div>
                  <div class="info">D</div>
                  <div class="info">E</div>
                  <div class="info">F</div>
                  <div class="info">G</div>
                  <div class="info">H</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 1번">1</div>
                  <div class="seat" value="B열 1번">1</div>
                  <div class="seat" value="C열 1번">1</div>
                  <div class="seat" value="D열 1번">1</div>
                  <div class="seat" value="E열 1번">1</div>
                  <div class="seat" value="F열 1번">1</div>
                  <div class="seat" value="G열 1번">1</div>
                  <div class="seat" value="H열 1번">1</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 2번">2</div>
                  <div class="seat" value="B열 2번">2</div>
                  <div class="seat" value="C열 2번">2</div>
                  <div class="seat" value="D열 2번">2</div>
                  <div class="seat" value="E열 2번">2</div>
                  <div class="seat" value="F열 2번">2</div>
                  <div class="seat" value="G열 2번">2</div>
                  <div class="seat" value="H열 2번">2</div>
                </div>
                <div class="space"></div>
                <div class="row">
                </div>
                <div class="row">
                  <div class="seat" value="A열 3번">3</div>
                  <div class="seat" value="B열 3번">3</div>
                  <div class="seat" value="C열 3번">3</div>
                  <div class="seat" value="D열 3번">3</div>
                  <div class="seat" value="E열 3번">3</div>
                  <div class="seat" value="F열 3번">3</div>
                  <div class="seat" value="G열 3번">3</div>
                  <div class="seat" value="H열 3번">3</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 4번">4</div>
                  <div class="seat" value="B열 4번">4</div>
                  <div class="seat" value="C열 4번">4</div>
                  <div class="seat" value="D열 4번">4</div>
                  <div class="seat" value="E열 4번">4</div>
                  <div class="seat" value="F열 4번">4</div>
                  <div class="seat" value="G열 4번">4</div>
                  <div class="seat" value="H열 4번">4</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 5번">5</div>
                  <div class="seat" value="B열 5번">5</div>
                  <div class="seat" value="C열 5번">5</div>
                  <div class="seat" value="D열 5번">5</div>
                  <div class="seat" value="E열 5번">5</div>
                  <div class="seat" value="F열 5번">5</div>
                  <div class="seat" value="G열 5번">5</div>
                  <div class="seat" value="H열 5번">5</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 6번">6</div>
                  <div class="seat" value="B열 6번">6</div>
                  <div class="seat" value="C열 6번">6</div>
                  <div class="seat" value="D열 6번">6</div>
                  <div class="seat" value="E열 6번">6</div>
                  <div class="seat" value="F열 6번">6</div>
                  <div class="seat" value="G열 6번">6</div>
                  <div class="seat" value="H열 6번">6</div>
                </div>
                <div class="row">
                  <div class="bin"> 7</div>
                  <div class="seat" value="B열 7번">7</div>
                  <div class="seat" value="C열 7번">7</div>
                  <div class="seat" value="D열 7번">7</div>
                  <div class="seat" value="E열 7번">7</div>
                  <div class="seat" value="F열 7번">7</div>
                  <div class="seat" value="G열 7번">7</div>
                  <div class="seat" value="H열 7번">7</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 8번">8</div>
                  <div class="seat" value="B열 8번">8</div>
                  <div class="seat" value="C열 8번">8</div>
                  <div class="seat" value="D열 8번">8</div>
                  <div class="seat" value="E열 8번">8</div>
                  <div class="seat" value="F열 8번">8</div>
                  <div class="seat" value="G열 8번">8</div>
                  <div class="seat" value="H열 8번">8</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 9번">9</div>
                  <div class="seat" value="B열 9번">9</div>
                  <div class="seat" value="C열 9번">9</div>
                  <div class="seat" value="D열 9번">9</div>
                  <div class="seat" value="E열 9번">9</div>
                  <div class="seat" value="F열 9번">9</div>
                  <div class="seat" value="G열 9번">9</div>
                  <div class="seat" value="H열 9번">9</div>
                </div>
                <div class="row">
                  <div class="bin"> 10</div>
                  <div class="seat" value="B열 10번">10</div>
                  <div class="seat" value="C열 10번">10</div>
                  <div class="seat" value="D열 10번">10</div>
                  <div class="seat" value="E열 10번">10</div>
                  <div class="seat" value="F열 10번">10</div>
                  <div class="seat" value="G열 10번">10</div>
                  <div class="seat" value="H열 10번">10</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 11번">11</div>
                  <div class="seat" value="B열 11번">11</div>
                  <div class="seat" value="C열 11번">11</div>
                  <div class="seat" value="D열 11번">11</div>
                  <div class="seat" value="E열 11번">11</div>
                  <div class="seat" value="F열 11번">11</div>
                  <div class="seat" value="G열 11번">11</div>
                  <div class="seat" value="H열 11번">11</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 12번">12</div>
                  <div class="seat" value="B열 12번">12</div>
                  <div class="seat" value="C열 12번">12</div>
                  <div class="seat" value="D열 12번">12</div>
                  <div class="seat" value="E열 12번">12</div>
                  <div class="seat" value="F열 12번">12</div>
                  <div class="seat" value="G열 12번">12</div>
                  <div class="seat" value="H열 12번">12</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 13번">13</div>
                  <div class="seat" value="B열 13번">13</div>
                  <div class="seat" value="C열 13번">13</div>
                  <div class="seat" value="D열 13번">13</div>
                  <div class="seat" value="E열 13번">13</div>
                  <div class="seat" value="F열 13번">13</div>
                  <div class="seat" value="G열 13번">13</div>
                  <div class="seat" value="H열 13번">13</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 14번">14</div>
                  <div class="seat" value="B열 14번">14</div>
                  <div class="seat" value="C열 14번">14</div>
                  <div class="seat" value="D열 14번">14</div>
                  <div class="seat" value="E열 14번">14</div>
                  <div class="seat" value="F열 14번">14</div>
                  <div class="seat" value="G열 14번">14</div>
                  <div class="seat" value="H열 14번">14</div>
                </div>
                <div class="row">
                  <div class="seat" value="A열 15번">15</div>
                  <div class="seat" value="B열 15번">15</div>
                  <div class="seat" value="C열 15번">15</div>
                  <div class="seat" value="D열 15번">15</div>
                  <div class="seat" value="E열 15번">15</div>
                  <div class="seat" value="F열 15번">15</div>
                  <div class="seat" value="G열 15번">15</div>
                  <div class="seat" value="H열 15번">15</div>
                </div>
                <div class="space"></div>
                <div class="row">
                  <div class="bin"  value="A열 16번">16</div>
                  <div class="seat" value="B열 16번">16</div>
                  <div class="seat" value="C열 16번">16</div>
                  <div class="bin"  value="D열 16번">16</div>
                  <div class="seat" value="E열 16번">16</div>
                  <div class="seat" value="F열 16번">16</div>
                  <div class="seat" value="G열 16번">16</div>
                  <div class="seat" value="H열 16번">16</div>
                </div>
                <div class="row">
                  <div class="bin"  value="A열 17번"> 17</div>
                  <div class="seat" value="B열 17번">17</div>
                  <div class="seat" value="C열 17번">17</div>
                  <div class="bin"  value="D열 17번"> 17</div>
                  <div class="seat" value="E열 17번">17</div>
                  <div class="seat" value="F열 17번">17</div>
                  <div class="seat" value="G열 17번">17</div>
                  <div class="seat" value="H열 17번">17</div>
                </div>
              </div>
              <div class="info-container">
                <div class="seat-infoA"></div> <sub class="seat-explain">예매가능 좌석</sub>
                <div class="seat-infoB"></div> <sub class="seat-explain">예매완료 좌석</sub>
              </div>
					</div>
				</div>
			</div>
			<button type="button" class="button-to-main" onClick="location.href='${path}/'">메인으로</button>
		</div>
	</div>
	
  <script src="${path}/resources/js/seat.js"> </script>
</body>
