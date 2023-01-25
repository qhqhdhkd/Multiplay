package com.multi.mvc.show.model.vo;

import java.util.List;

import com.multi.mvc.board.model.vo.BoardReply;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Show {
	private int show_cno;
	private int show_seq;
	private String show_title;
	private String show_startdate;
	private String show_enddate;
	private String show_place;
	private String show_realmname;
	private String show_area;
	private String show_thumbnail;
	private Double show_gpsx;
	private Double show_gpsy;
	private List<BoardReply> replies;
	private String searchTitle; // 전시 입력
	private String searchDate; // 전시 날짜
	private String searchLocation; // 지역
}
