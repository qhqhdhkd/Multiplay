package com.multi.mvc.review.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.review.model.vo.Review;

@Mapper
public interface ReviewMapper {
		List<Review> selectReviewList(Map<String, String> map);
		int insertReview(Review review);
		int updateReview(Review review);
		int deleteReview(int reviewNo);
		int selectReactionCount(int reviewNo);
		int updateReactionCount(int reviewNo);
		int deupdateReactionCount(int reviewNo);
		int reactionCountNum(int reviewNo);
}
