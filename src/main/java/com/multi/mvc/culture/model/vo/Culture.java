package com.multi.mvc.culture.model.vo;

import java.util.Date;
import java.util.List;

import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.BoardReply;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Culture {
	private int cno; //
	private int seq; //
	private String title; //
	private Date startdate; //
	private Date enddate; //
	private String place; //
	private String realmname; //
	private String area; //
	private String thumbnail; //
	private String subTitle; // -- 공연 부제
	private String price; // -- 요금안내
	private String contents1; // -- 컨텐츠 섪명1
	private String contents2; // -- 컨텐츠 설명2
	private String url; // -- 공연 URL
	private String phone; // -- 문의 전화번호
	private String imgUrl; // -- 이미지 URL
	private Double gpsX; // -- 경도
	private Double gpsY; // -- 위도
	private String placeUrl; // -- 공연/전시 장소 URL
	private String placeAddr; // -- 공연/전시 장소의 주소
	private int placeSeq; // -- 장소 고유번호
}
