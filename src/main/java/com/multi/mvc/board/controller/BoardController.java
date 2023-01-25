package com.multi.mvc.board.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.multi.mvc.board.model.service.BoardService;
import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.BoardReply;
import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.user.model.vo.Users;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board") 
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ResourceLoader resourceLoader; 
	
	@GetMapping("/list")
	public String list(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		log.info("리스트 요청, param : " + param);
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length() > 0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		
		int boardCount = service.getBoardCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, 10);
		List<Board> list = service.getBoardList(pageInfo, searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		return "/board/list";
	}
	

	@GetMapping("/monlist")
	public String monList(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		log.info("리스트 요청, param : " + param);
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length() > 0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		
		int boardCount = service.getBoardCount2(searchMap);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, 10);
		List<Board> list = service.getBoardList2(pageInfo, searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		return "/board/monlist";
	}
	
	
	
	@GetMapping("/freelist")
	public String freeList(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		log.info("리스트 요청, param : " + param);
		Map<String, String> searchMap = new HashMap<String, String>();
		try {
			String searchValue = param.get("searchValue");
			if(searchValue != null && searchValue.length() > 0) {
				String searchType = param.get("searchType");
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(param.get("page"));
		} catch (Exception e) {}
		
		
		int boardCount = service.getBoardCount3(searchMap);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, 10);
		List<Board> list = service.getBoardList3(pageInfo, searchMap);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		return "/board/freelist";
	}

	
	@RequestMapping("/view")
	public String view(Model model, @RequestParam("no") int no) {
		Board board = service.findByNo(no);
		
		if(board == null) {
			return "redirect:error";
		}
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", board.getReplies());
		board.setReplyCount(board.getReplies().size());
		System.out.println(board.getReplies());
		return "/board/view";
	}
	
	@GetMapping("/error")
	public String error() {
		return "/common/error";
	}
	
	//자유게시판
	@GetMapping("/write")
	public String writeView() {
		return "board/write";
	}
	
	// 2022.12.30 추가
	@PostMapping("/write")
	public String writeBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile
			) {
		log.info("게시글 작성 요청");
		board.setWriterNo(loginMember.getUserNo());
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			System.out.println(rootPath);
			String savePath = rootPath +"/upload/board";
			String renameFileName = service.saveFile(upfile, savePath); 
			
			if(renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		log.debug("board : " + board);
		int result = service.saveBoard(board);
		if(result > 0) {
			model.addAttribute("msg", "게시글이 등록 되었습니다.");
			model.addAttribute("location", "/board/freelist");
		}else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/freelist");
		}
		
		return "common/msg";
	}
	// 2022.12.30 추가
	
	
	
	//문의사항

	@GetMapping("/mon")
	public String monView() {
		return "board/mon";
	}
	
	
	@PostMapping("/mon")
	public String monBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile
			) {
		log.info("게시글 작성 요청");
		board.setWriterNo(loginMember.getUserNo());
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			System.out.println(rootPath);
			String savePath = rootPath +"/upload/board";
			String renameFileName = service.saveFile(upfile, savePath); 
			
			if(renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		log.debug("board : " + board);
		int result = service.saveBoard(board);
		if(result > 0) {
			model.addAttribute("msg", "게시글이 등록 되었습니다.");
			model.addAttribute("location", "/board/monlist");
		}else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/monlist");
		}
		
		return "common/msg";
	}
	
	
	
	
	//공지사항 2022.12.30 추가
	@GetMapping("/infoWrite")
	public String infoWriteView() {
		return "board/infoWrite";
	}

	@PostMapping("/infoWrite")
	public String infoWriteBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile
			) {
		log.info("게시글 작성 요청");
		board.setWriterNo(loginMember.getUserNo());
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			System.out.println(rootPath);
			String savePath = rootPath +"/upload/board";
			String renameFileName = service.saveFile(upfile, savePath); 
			
			if(renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		log.debug("board : " + board);
		int result = service.saveBoard(board);
		if(result > 0) {
			model.addAttribute("msg", "게시글이 등록 되었습니다.");
			model.addAttribute("location", "/board/list");
		}else {
			model.addAttribute("msg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("location", "/board/list");
		}
		
		return "common/msg";
	}
	
	
	
	@RequestMapping("/reply")
	public String writeReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			@ModelAttribute BoardReply reply
			) {
		reply.setUserNo(loginMember.getUserNo());
		log.info("리플 작성 요청 Reply : " + reply);
		
		int result = service.insertReply(reply);
		
		if(result > 0) {
			model.addAttribute("msg", "리플이 등록되었습니다.");
		}else {
			model.addAttribute("msg", "등록 실패하였습니다.");
		}
		model.addAttribute("location", "/board/view?no="+reply.getBoardNo());
		return "/common/msg";
	}
	
	
	@RequestMapping("/delete")
	public String deleteBoard(Model model,  HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			int boardNo
			) {
		log.info("게시글 삭제 요청 boardNo : " + boardNo);
		
		String rootPath = session.getServletContext().getRealPath("resources");
		String savePath = rootPath +"/upload/board";
		Board board = service.findByNo(boardNo);
		int result = service.deleteBoard(boardNo, savePath);
		
		if(result > 0) {
			model.addAttribute("msg", "게시글 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
		}

		if(board.getBoardType().equals("문의사항")) {
			model.addAttribute("location", "/board/monlist");
		}else if(board.getBoardType().equals("자유게시판")){
			model.addAttribute("location", "/board/freelist");
		}else if(board.getBoardType().equals("공지사항")) {
			model.addAttribute("location", "/board/list");
		}
		return "/common/msg";
	}
	
	@RequestMapping("/replyDel")
	public String deleteReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			int replyNo, int boardNo
			){
		log.info("리플 삭제 요청 " + loginMember + ", replyNo : " + replyNo + " boardNo : " + boardNo);
		int result = service.deleteReply(replyNo);
		
		if(result > 0) {
			model.addAttribute("msg", "리플 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "리플 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/board/view?no=" + boardNo);
		return "/common/msg";
	}
	
	
	@GetMapping("/update")
	public String updateView(Model model,
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			@RequestParam("no") int no
			) {
		Board board = service.findByNo(no);
		model.addAttribute("board",board);
		return "/board/update";
	}
	

	@PostMapping("/update")
	public String updateBoard(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			@ModelAttribute Board board,
			@RequestParam("reloadFile") MultipartFile reloadFile
			) {
		log.info("게시글 수정 요청");
		log.info("보드:" + board.getUserId());
		log.info("로그인:" + loginMember.getUserId());
		
		board.setWriterNo(loginMember.getUserNo());
		
		if(reloadFile != null && reloadFile.isEmpty() == false) {
			String rootPath = session.getServletContext().getRealPath("resources");
			String savePath = rootPath +"/upload/board";
			
			if(board.getRenamedFileName() != null) {
				service.deleteFile(savePath + "/" +board.getRenamedFileName());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath);
			
			if(renameFileName != null) {
				board.setOriginalFileName(reloadFile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		log.debug("board : " + board);
		int result = service.saveBoard(board);

		if(board.getBoardType().equals("문의사항")) {
			if(result > 0) {
				model.addAttribute("msg", "문의게시글이 수정 되었습니다.");
				model.addAttribute("location", "/board/monlist");
			}else {
				model.addAttribute("msg", "문의 게시글 수정에 실패하였습니다.");
				model.addAttribute("location", "/board/monlist");
			}
		}else if(board.getBoardType().equals("자유게시판")){
			if(result > 0) {
				model.addAttribute("msg", "자유게시판 게시글이 수정 되었습니다.");
				model.addAttribute("location", "/board/freelist");
			}else {
				model.addAttribute("msg", "자유게시판 게시글 수정에 실패하였습니다.");
				model.addAttribute("location", "/board/freelist");
			}
		}else if(board.getBoardType().equals("공지사항")) {
			if(result > 0) {
				model.addAttribute("msg", "공지글이 수정 되었습니다.");
				model.addAttribute("location", "/board/list");
			}else {
				model.addAttribute("msg", "공지글 수정에 실패하였습니다.");
				model.addAttribute("location", "/board/list");
			}
		}
		
		return "common/msg";
	}
	
	
	@RequestMapping("/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestParam("oriname") String oriname,
			@RequestParam("rename") String rename,
			@RequestHeader(name= "user-agent") String userAgent){
		try {
			Resource resource = resourceLoader.getResource("resources/upload/board/" + rename);
			String downName = null;
			
			boolean isMSIE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;

			if (isMSIE) { // 익스플로러 처리하는 방법
				downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");
			} else {    		
				downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1"); // 크롬
			}
			
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + downName + "\"")
					.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(resource.contentLength()))
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())
					.body(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 실패했을 경우
	}

	
}

