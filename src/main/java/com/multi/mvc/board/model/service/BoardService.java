package com.multi.mvc.board.model.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.multi.mvc.board.model.mapper.BoardMapper;
import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.BoardReply;
import com.multi.mvc.common.util.PageInfo;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Transactional(rollbackFor = Exception.class)
	public int saveBoard(Board board) {
		int result = 0;
		if(board.getBno() == 0) {
			result = mapper.insertBoard(board);
		}else {
			result = mapper.updateBoard(board);
		}
		return result;
	}
	
	@Transactional(rollbackFor  = Exception.class)
	public int saveReply(BoardReply reply) {
		int result = 0;
		if(reply.getBoardNo() == 0) {
			result = mapper.insertReply(reply);
		}else {
			result = mapper.updateReply(reply);
		}
		return result;
	}

	
	@Transactional(rollbackFor = Exception.class)
	public int insertReply(BoardReply reply) {
		return mapper.insertReply(reply);
	}
	
	
	public String saveFile(MultipartFile upFile, String savePath) {
		File folder = new File(savePath);
		
		if(folder.exists() == false) {
			folder.mkdir();
		}
		System.out.println("savePath : " + savePath);
		
		String originalFileName = upFile.getOriginalFilename();
		String reNameFileName = 
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"));
		reNameFileName += originalFileName.substring(originalFileName.lastIndexOf("."));
		String reNamePath = savePath + "/" + reNameFileName;
		
		try {
			upFile.transferTo(new File(reNamePath));
		} catch (Exception e) {
			return null;
		}
		return reNameFileName;
	}
	
	public int getBoardCount(Map<String, String> param) {
		param.put("boardType", "공지사항");
		return mapper.selectBoardCount(param);
	}
	
	public List<Board> getBoardList(PageInfo pageInfo, Map<String, String> param){
		param.put("boardType", "공지사항");
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectBoardList(param);
	}

	
	
	
	public int getBoardCount2(Map<String, String> param) {
		param.put("boardType", "문의사항");
		return mapper.selectBoardCount(param);
	}
	
	public List<Board> getBoardList2(PageInfo pageInfo, Map<String, String> param){
		param.put("boardType", "문의사항");
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectBoardList(param);
	}

	
	
	
	public int getBoardCount3(Map<String, String> param) {
		param.put("boardType", "자유게시판");
		return mapper.selectBoardCount(param);
	}
	
	public List<Board> getBoardList3(PageInfo pageInfo, Map<String, String> param){
		param.put("boardType", "자유게시판");
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectBoardList(param);
	}

	
	
	
	@Transactional(rollbackFor = Exception.class)
	public Board findByNo(int boardNo) {
		Board board = mapper.selectBoardByNo(boardNo); 
		board.setReadCount(board.getReadCount() + 1);  
		mapper.updateReadCount(board);
		return board; 
	}
	
	public void deleteFile(String filePath) {
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteBoard(int no, String rootPath) {
		Board board = mapper.selectBoardByNo(no);
		deleteFile(rootPath + "\\" + board.getRenamedFileName());
		return mapper.deleteBoard(no);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteReply(int no) {
		return mapper.deleteReply(no);
	}
	
}




