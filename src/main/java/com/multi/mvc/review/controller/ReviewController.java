package com.multi.mvc.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.mvc.review.model.service.ReviewService;
import com.multi.mvc.review.model.vo.Review;
import com.multi.mvc.user.model.vo.Users;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@PostMapping("/ReviewWrite") // 등록 버튼 눌렀을 때
	public String reviewWrite(Model model, int cno, HttpSession session, 
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			@ModelAttribute Review review
			) {
		log.info("후기 작성 요청 | cno : " + cno);
		System.out.println(review);
		
		review.setReviewWriterNo(loginMember.getUserNo());
		review.setBookNo(10);
		
		Map<String, String> map = new HashMap<String, String>();
		List<Review> reviewList = new ArrayList<Review>();
		for (Review rev : service.getReviewList(map)) {
			if(rev.getCno() == cno) {
				reviewList.add(rev);
			}
		}
		model.addAttribute("reviewList", reviewList);
		int result = service.saveReview(review);
		if(result > 0) {
			model.addAttribute("msg", "후기가 등록 되었습니다.");
			model.addAttribute("location", "/submain/genreDetail?cno="+cno+"&reviewWrite=1");
		}else {
			model.addAttribute("msg", "후기 작성에 실패하였습니다. 다시 확인하여 주십시오.");
			model.addAttribute("location", "/submain/genreDetail?cno="+cno);
		}
		
		model.addAttribute("review", review);
//		return "redirect:submain/genreDetail?cno="+cno+"&reviewWrite=1";
		return "common/msg";
	}
	
	
	@PostMapping("/ReviewDel")
	public String reviewDel(Model model, HttpSession session,
			@SessionAttribute(name = "loginMember", required = false) Users loginMember,
			int reviewNo, int cno
			) {
		log.info("리뷰 삭제 요청 아이디 : " + loginMember.getUserId() + ", reviewNo : " + reviewNo);
		int result = service.deleteReview(reviewNo);
		
		if(result > 0) {
			model.addAttribute("msg", "리뷰가 삭제되었습니다.");
		}else {
			model.addAttribute("msg", "리뷰 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/submain/genreDetail?cno="+cno+"&reviewWrite=1");
		return "/common/msg";
	}
	
	@ResponseBody
	@PostMapping("/ReactionCount")
	public String reactionCount(@RequestParam("reviewNo") int reviewNo) {
		log.info("===== 리뷰 공감 요청 reviewNo : " + reviewNo + " =====");
		int suc = service.updateReaction(reviewNo);
		
		if(suc > 0) {
			log.info("업데이트 성공");
		} else {
			log.info("실패");
		}
		
		String result = "" + service.reactionCountNum(reviewNo);
		log.info(result);
		return result;
	}

	@ResponseBody
	@PostMapping("/ReactionDecount")
	public String dereactionCount(@RequestParam("reviewNo") int reviewNo) {
		log.info("===== 공감 삭제 요청 reviewNo : " + reviewNo + " =====");
		int suc = service.deupdateReactionCount(reviewNo);
		
		if(suc > 0) {
			log.info("공감 삭제 성공");
		} else {
			log.info("실패");
		}
		
		String result = "" + service.reactionCountNum(reviewNo);
		log.info(result);
		return result;
	}
}
