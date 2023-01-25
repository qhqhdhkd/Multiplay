package com.cultural.model.service;

import static com.cultural.common.JDBCTemplate.commit;
import static com.cultural.common.JDBCTemplate.openConnection;
import static com.cultural.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.cultural.model.dao.CulturalDao;
import com.cultural.model.vo.Cultural;
import com.cultural.model.vo.CulturalDetail;
import com.cultural.model.vo.CulturalList;

public class CulturalService {
	private CulturalDao dao = new CulturalDao();
	private Connection conn = null;
	
	public CulturalService() {
		conn = openConnection();
		// TODO Auto-generated constructor stub
	}
	
	public int insert(CulturalList culturalList) {
		int result = dao.insert(conn, culturalList);
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int insertDetail(CulturalDetail culturalDetail) {
		int result = dao.insertDetail(conn, culturalDetail);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int insertCultural(Cultural cultural) {
		int result = dao.insertCultural(conn, cultural);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	
	public List<Integer> selectBySeq() {
		return dao.selectBySeq(conn);
	}
	
	public List<Cultural> selectByJoin() {
		return dao.selectByJoin(conn);
	}
	
	
	
}
