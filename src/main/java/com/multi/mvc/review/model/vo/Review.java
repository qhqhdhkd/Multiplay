package com.multi.mvc.review.model.vo;

import java.sql.Date;
import java.util.List;

import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.BoardReply;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private int reviewNo; // -- 리뷰 일련번호
	private int cno; // -- 공연/전시 상세정보 일련번호
	private int reviewWriterNo; // -- 게시물 작성자 (일련번호)
	private String reviewWriterId;
	private String userId; // -- 게시물 작성자
	private int bookNo;
	private String reviewTitle; // -- 게시물 제목 200자 제한
	private String reviewContent; // -- 게시물 내용 1000자 제한
	private int reactionCount; // -- 좋아요 개수
	private String originalImg; // -- 사진파일 이름(원본)
	private String modifyImg; // -- 사진파일 이름(수정본)
	private String status; // -- 상태(y : 게시중인 게시물 / n : 삭제된 게시물)
	private Date createDate; // -- 게시물 작성 날짜
	private Date modifyDate 	; //-- 게시물 수정 날짜
	
	
}
