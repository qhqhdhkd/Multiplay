package com.multi.mvc.board.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.BoardReply;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(Map<String, String> map);
	int selectBoardCount(Map<String, String> map);
	Board selectBoardByNo(int bno);
	int insertBoard(Board board);
	int insertReply(BoardReply reply);
	int updateReply(BoardReply reply);
	int updateBoard(Board board);
	int updateReadCount(Board board);
	int deleteBoard(int bno);
	int deleteReply(int bno);
	
}
