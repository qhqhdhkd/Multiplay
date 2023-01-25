package com.multi.mvc.culture.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.culture.model.vo.Culture;

@Mapper
public interface CultureMapper {
	List<Culture> selectCulture(Map<String, String> map);
	Culture selectCultureByCno(int cno);
	Culture selectCultureByTitle(String title);
}
