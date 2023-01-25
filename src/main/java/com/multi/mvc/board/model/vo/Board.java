package com.multi.mvc.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int bno;
	private String boardType;
	private int writerNo;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private String originalFileName;
	private String renamedFileName;
	private int readCount;
	private String status;
	private List<BoardReply> replies;
	private Date createDate;
	private Date modifyDate;
	private int replyCount;
}