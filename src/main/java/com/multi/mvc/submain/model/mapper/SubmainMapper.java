package com.multi.mvc.submain.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.submain.model.vo.RankingList;
// 주석 지우지마세욥!!!!
@Mapper
public interface SubmainMapper {
	List<RankingList> selectRankingList(Map<String, Object> map);
	List<RankingList> selectMusicalRanking(Map<String, Object> map);
	List<RankingList> selectPlayRanking(Map<String, Object> map);
	List<RankingList> selectConcertRanking(Map<String, Object> map);
	List<RankingList> selectClassicRanking(Map<String, Object> map);
	List<RankingList> selectDisplayRanking(Map<String, Object> map);
	
	List<RankingList> selectRankingTopFive(Map<String, Object> map);
	List<RankingList> selectMusicalTopFive(Map<String, Object> map);
	List<RankingList> selectPlayTopFive(Map<String, Object> map);
	List<RankingList> selectConcertTopFive(Map<String, Object> map);
	List<RankingList> selectClassicTopFive(Map<String, Object> map);
	List<RankingList> selectDisplayTopFive(Map<String, Object> map);

	
}
