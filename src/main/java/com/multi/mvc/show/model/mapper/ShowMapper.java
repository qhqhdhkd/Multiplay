package com.multi.mvc.show.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.show.model.vo.Show;

@Mapper
public interface ShowMapper {
	List<Show> selectShowList(Map<String, Object> map);
	List<Show> selectDisplayList(Map<String, Object> map);
	List<Show> selectLocationList(Map<String, Object> map);
	List<Show> searchShowList(Map<String, Object> map2);
	List<Show> searchShowList2(Map<String, Object> map3);
}
