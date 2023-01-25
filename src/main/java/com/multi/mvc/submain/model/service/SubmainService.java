package com.multi.mvc.submain.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mvc.submain.model.mapper.SubmainMapper;
import com.multi.mvc.submain.model.vo.RankingList;

@Service
public class SubmainService {

	@Autowired
	SubmainMapper mapper;

	public List<RankingList> getRankingList(Map<String, Object> map) {
		return mapper.selectRankingList(map);
	}
	// TOP 10 출력
	public List<RankingList> getMusicalRankingList(Map<String, Object> map) {
		return mapper.selectMusicalRanking(map);
	}

	public List<RankingList> getPlayRankingList(Map<String, Object> map) {
		return mapper.selectPlayRanking(map);
	}

	public List<RankingList> getConcertRankingList(Map<String, Object> map) {
		return mapper.selectConcertRanking(map);
	}

	public List<RankingList> getClassicRankingList(Map<String, Object> map) {
		return mapper.selectClassicRanking(map);
	}

	public List<RankingList> getDisplayRankingList(Map<String, Object> map) {
		return mapper.selectDisplayRanking(map);
	}
	// TOP 5 출력
	public List<RankingList> getRankingTopFive(Map<String, Object> map) {
		return mapper.selectRankingTopFive(map);
	}
	
	public List<RankingList> getMusicalTopFive(Map<String, Object> map) {
		return mapper.selectMusicalTopFive(map);
	}
	
	public List<RankingList> getPlayTopFive(Map<String, Object> map) {
		return mapper.selectPlayTopFive(map);
	}
	
	public List<RankingList> getConcertTopFive(Map<String, Object> map) {
		return mapper.selectConcertTopFive(map);
	}
	
	public List<RankingList> getClassicTopFive(Map<String, Object> map) {
		return mapper.selectClassicTopFive(map);
	}
	
	public List<RankingList> getDisplayTopFive(Map<String, Object> map) {
		return mapper.selectDisplayTopFive(map);
	}

}
