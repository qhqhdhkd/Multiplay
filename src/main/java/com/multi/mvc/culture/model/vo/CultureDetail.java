package com.multi.mvc.culture.model.vo;

import java.util.Date;

public class CultureDetail {
	private    int		 SEQ			; //				, -- 공연/전시 번호
    private    String	 title 			; //				, -- 공연 /전시 제목
    private    Date		 startDate		; //				,-- 시작 날짜
    private    Date	     endDate 		; //				, -- 종료 날짜
    private    String	 place 			; //						, -- 공연 장소
    private    String    realmName		; //								, -- 분류
    private    String    AREA 			; //			, -- 공연 지역
    private    String    subTitle 		; //					, -- 공연 부제
    private    String    price 			; //						, -- 요금안내
    private    String    contents1 		; //					, -- 컨텐츠 섪명1
    private    String    contents2 		; //				, -- 컨텐츠 설명2
    private    String    url 			; //					, -- 공연 URL
    private    String    phone 			; //					, -- 문의 전화번호
    private    String    imgUrl 		; //				, -- 이미지 URL 
    private    Double	 gpsX 			; //	,	-- 경도	
    private    Double	 gpsY			; //			,	-- 위도
    private    String	 placeUrl 		; //					, -- 공연/전시 장소 URL
    private    String	 placeAddr		; //				, -- 공연/전시 장소의 주소
    private    int		 placeSeq 		; //					, -- 장소 고유번호

}
