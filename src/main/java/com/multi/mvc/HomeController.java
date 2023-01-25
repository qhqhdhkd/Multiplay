package com.multi.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.multi.mvc.board.model.service.BoardService;
import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.culture.model.service.CultureService;
import com.multi.mvc.culture.model.vo.Culture;
import com.multi.mvc.submain.model.service.SubmainService;
import com.multi.mvc.submain.model.vo.RankingList;
import com.multi.mvc.user.model.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CultureService cService;
	
	@Autowired
	private SubmainService sService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
//		Member loginMember = memberService.login("admin", "1212");
//		session.setAttribute("loginMember", loginMember);
		// test();
		
		// 메인페이지 인기작품
		Map<String, String> culture = new HashMap<String, String>();
		List<Culture> culList = cService.getCultureList(culture);
		model.addAttribute("culList", culList);
	
		
		// 메인페이지 공지사항
		Map<String, String> map = new HashMap<String, String>();
		int count = bservice.getBoardCount(map);
		PageInfo pageInfo = new PageInfo(1, 6, count, 6);
		List<Board> list = bservice.getBoardList(pageInfo, map);
		model.addAttribute("list", list);
		
		// TOP5 가져오기
		Map<String, Object> rankingMap = new HashMap<>();
		List<RankingList> musicalRankingList = sService.getMusicalTopFive(rankingMap); 
		List<RankingList> playRankingList = sService.getPlayTopFive(rankingMap);
		List<RankingList> concertRankingList = sService.getConcertTopFive(rankingMap);
		List<RankingList> classicRankingList = sService.getClassicTopFive(rankingMap);
		List<RankingList> displayRankingList = sService.getDisplayTopFive(rankingMap);
		
		model.addAttribute("musicalRankingList", musicalRankingList);
		model.addAttribute("playRankingList", playRankingList);
		model.addAttribute("concertRankingList", concertRankingList);
		model.addAttribute("classicRankingList", classicRankingList);
		model.addAttribute("displayRankingList", displayRankingList);
		
		return "home";
	}
	
	public void test() {
		Map<String, String> map = new HashMap<>();
		PageInfo info = new PageInfo(1, 10, bservice.getBoardCount(map), 10);
		logger.info("board List : " + bservice.getBoardList(info, map));
	}
	
}
