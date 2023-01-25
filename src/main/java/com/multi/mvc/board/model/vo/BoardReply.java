package com.multi.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardReply {
	private int replyNo;
	private int boardNo;
	private int userNo;
	private String userId;
	private String content;	
	private Date createDate;
	private Date modifyDate;
}