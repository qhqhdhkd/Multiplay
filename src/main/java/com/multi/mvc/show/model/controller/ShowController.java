package com.multi.mvc.show.model.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.mvc.show.model.service.ShowService;
import com.multi.mvc.show.model.vo.Show;

@Controller
public class ShowController {
	
	
	@Autowired
	ShowService service;
	
	
	@GetMapping("/submain/showMain")
	public String showPage() {
		return "submain/showMain";
	}
	
//	/subMain/showMainDetail
	
	@RequestMapping({"/submain/showMainDetail"})
	public String searchShow(Model model, String searchValue, String[] genre, String[] local, String startday, String endday) {
		
		Map<String, Object> map = new HashMap<>();
		if(searchValue != null) {
			map.put("searchValue", searchValue);
		}else if(searchValue==null) {
			model.addAttribute("msg", "제목을 적어주세요.");
			model.addAttribute("location", "/");
			return "common/msg"; 
		}
		if(local != null && local.length > 0) {
			map.put("local", local);
		}else {
			local = new String[] {};
		}
		if(genre != null && genre.length > 0) {
			map.put("genre", genre);
		}else {
			genre = new String[] {};
		}
		if(startday != null) {
			map.put("startday", startday);
		}else {
			model.addAttribute("msg", "시작일을 선택해주세요.");
			model.addAttribute("location", "/");
			return "common/msg"; 
		}
		if(endday != null) {
			map.put("endday", endday);
		}else {
			model.addAttribute("msg", "마감일을 선택해주세요.");
			model.addAttribute("location", "/");
			return "common/msg"; 
		}
		
		List<Show> list = service.findShow(map);

		model.addAttribute("list", list); //model==showMainDetail
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("genre", Arrays.asList(genre));
		model.addAttribute("local", Arrays.asList(local));
		model.addAttribute("startday", startday);
		model.addAttribute("endday", endday);
		
		return "submain/showMainDetail"; 
	}
	
	@GetMapping("/submain/displayMain")
	public String displayPage() {
		return "submain/displayMain";
	}

	@RequestMapping("/submain/displayMainDetail")
	public String searchDisplay(Model model, String searchValue, String startday, String endday) {
		
		Map<String, Object> map = new HashMap<>();
		if(searchValue != null) {
			map.put("searchValue", searchValue);
		}else {
			model.addAttribute("msg", "제목을 적어주세요.");
			model.addAttribute("location", "/");
			return "common/msg"; 
		}
		
		if(startday != null) {
			map.put("startday", startday);
		}else {
			model.addAttribute("msg", "시작일을 선택해주세요.");
			model.addAttribute("location", "/");
			return "common/msg"; 
		}
		if(endday != null) {
			map.put("endday", endday);
		}else {
			model.addAttribute("msg", "마감일을 선택해주세요.");
			model.addAttribute("location", "/");
			return "common/msg"; 
		}
		
		
		List<Show> list = service.findDisplay(map);

		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("startday", startday);
		model.addAttribute("endday", endday);

		return "submain/displayMainDetail";
	}
	
	@GetMapping("/submain/locationMain")
	public String locationPage() {
		return "submain/locationMain";
	}

	@RequestMapping("/submain/locationMainDetail")
	public String searchLocation(Model model, String local,String[] genre) {
		
		Map<String, Object> map = new HashMap<>();
		
		if(local != null) {
			map.put("local", local);
		}
		List<Show> list = service.findLocation(map);

		model.addAttribute("list", list);
		model.addAttribute("local", local);
		return "submain/locationMainDetail";
	}
	
}
