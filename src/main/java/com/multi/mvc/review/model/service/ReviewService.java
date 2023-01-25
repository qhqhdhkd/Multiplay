package com.multi.mvc.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.review.model.mapper.ReviewMapper;
import com.multi.mvc.review.model.vo.Review;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Transactional(rollbackFor = Exception.class)
	public int saveReview(Review review) {
		int result = 0;
		if(review.getReviewNo() == 0) { 
			result = mapper.insertReview(review); // 리뷰 작성
		} else {
			result = mapper.updateReview(review); // 리뷰 수정
		}
		return result;
	}
	
	// 리뷰 작성
	@Transactional(rollbackFor = Exception.class)
	public int insertReview(Review review) {
		return mapper.insertReview(review);
	}
	
	// 리뷰 가져오기
	public List<Review> getReviewList(Map<String, String> param) {
		return mapper.selectReviewList(param);
	}
	
	// 리뷰 리액션 카운트
	public int getReactionCount(int reviewNo) {
		return mapper.selectReactionCount(reviewNo);
	}
	
	// 리뷰 리액션 업데이트
	@Transactional(rollbackFor = Exception.class)
	public int updateReaction(int reviewNo) {
		return mapper.updateReactionCount(reviewNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int deupdateReactionCount(int reviewNo) {
		return mapper.deupdateReactionCount(reviewNo);
	}
	
	// 리뷰 삭제하기
	@Transactional(rollbackFor = Exception.class)
	public int deleteReview(int reviewNo) {
		return mapper.deleteReview(reviewNo);
	}
	
	// 리액션 개수 가져오기
	public int reactionCountNum(int reviewNo) {
		return mapper.reactionCountNum(reviewNo);
	}
	
}
