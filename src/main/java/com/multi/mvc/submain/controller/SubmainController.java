package com.multi.mvc.submain.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.mvc.board.model.service.BoardService;
import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.culture.model.service.CultureService;
import com.multi.mvc.culture.model.vo.Culture;
import com.multi.mvc.review.model.service.ReviewService;
import com.multi.mvc.review.model.vo.Review;
import com.multi.mvc.show.model.service.ShowService;
import com.multi.mvc.show.model.vo.Show;
import com.multi.mvc.submain.model.service.SubmainService;
import com.multi.mvc.submain.model.vo.RankingList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/submain")
@Controller
public class SubmainController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	SubmainService submainService;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	CultureService cService;
	
	@Autowired
	private ReviewService rService;

	@GetMapping("/pay") // 12/25: 수정할 가능성 있음
	public String pay() {
		return "submain/pay";
	}	
	
	@RequestMapping("/genreDetail")
	public String view(Model model, @RequestParam("cno") int cno, @RequestParam Map<String, String> param) {
		Culture culture = cService.getCultureByCno(cno);
		
		if(culture == null) {
			return "redirect:error";
		}
		

		// 리뷰 관련
		Map<String, String> map = new HashMap<String, String>();
		List<Review> reviewList = new ArrayList<Review>();
		for (Review review : rService.getReviewList(map)) {
			if(cno == review.getCno()) {
				reviewList.add(review);
			}
		}
		int reviewSize = reviewList.size();
		model.addAttribute("culture", culture);
		model.addAttribute("reviewWrite", param.getOrDefault("reviewWrite", "0"));
		model.addAttribute("reviewList", reviewList); // cno에 달린 리뷰 리스트
		model.addAttribute("reviewSize", reviewSize); // 리뷰 개수
		return "submain/genreDetail";
	}
	
	@RequestMapping("/search")
	public String search(Model model, String value) {
		
		// 공연 가져오는 코드
		Map<String, Object> map2 = new HashMap<>();
		map2.put("value",value);
		List<Show> ShowList = showService.searchShow(map2);
		//List<Show> DisplayList = showService.findDisplay(map2);
		model.addAttribute("ShowList", ShowList);
		model.addAttribute("value", value);
		
		//전시 가져오는 코드
		Map<String, Object> map3 = new HashMap<>();
		map3.put("value",value);
		List<Show> ShowList2 = showService.searchShow2(map3);
		//List<Show> DisplayList = showService.findDisplay(map3);
		model.addAttribute("ShowList2", ShowList2);
		model.addAttribute("value", value);

		// 자유게시판 가져오는 코드
		Map<String, String> map = new HashMap<>();
		map.put("title", value);
		map.put("content", value);
		int count = boardService.getBoardCount3(map);
		PageInfo pageInfo = new PageInfo(1, 20, count, 20);
		List<Board> boardList = boardService.getBoardList3(pageInfo, map);
		model.addAttribute("boardList", boardList);
		
		// TODO 전시 정보 가져오는 코드 짜야함 
		return "submain/search";
	}
	
	@GetMapping("/musicalRanking") // 
	public String musicalRanking(Model model, String value) {
		Map<String, Object> map = new HashMap<>();
		map.put("value", value);
			
		List<RankingList> rankingList = submainService.getMusicalRankingList(map);
		
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("value", value);
		
		return "submain/musicalRanking";
	}
	
	@GetMapping("/playRanking") // 
	public String playRanking(Model model, String value) {
		Map<String, Object> map = new HashMap<>();
		map.put("value", value);
			
		List<RankingList> rankingList = submainService.getPlayRankingList(map);
		
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("value", value);
		
		return "submain/playRanking";
	}
	
	@GetMapping("/classicRanking") // 
	public String classicRanking(Model model, String value) {
		Map<String, Object> map = new HashMap<>();
		map.put("value", value);
			
		List<RankingList> rankingList = submainService.getClassicRankingList(map);
		
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("value", value);
		
		return "submain/classicRanking";
	}
	
	@GetMapping("/displayRanking") // 
	public String displayRanking(Model model, String value) {
		Map<String, Object> map = new HashMap<>();
		map.put("value", value);
			
		List<RankingList> rankingList = submainService.getDisplayRankingList(map);
		
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("value", value);
		
		return "submain/displayRanking";
	}
	
	@GetMapping("/concertRanking") // 
	public String concertRanking(Model model, String value) {
		Map<String, Object> map = new HashMap<>();
		map.put("value", value);
			
		List<RankingList> rankingList = submainService.getConcertRankingList(map);
		
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("value", value);
		
		return "submain/concertRanking";
	}
	
}
