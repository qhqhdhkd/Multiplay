package com.multi.mvc.culture.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.mvc.culture.model.mapper.CultureMapper;
import com.multi.mvc.culture.model.vo.Culture;

@Service
public class CultureService {
	
	@Autowired
	private CultureMapper mapper;
	
	public List<Culture> getCultureList(Map<String, String> param){
		return mapper.selectCulture(param);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Culture getCultureByCno(int cno) {
		return mapper.selectCultureByCno(cno);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Culture getCultureByTitle(String title) {
		return mapper.selectCultureByTitle(title);
	}
	
}
