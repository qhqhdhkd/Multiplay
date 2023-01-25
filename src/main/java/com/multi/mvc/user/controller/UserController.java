package com.multi.mvc.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.multi.mvc.user.model.service.UserService;
import com.multi.mvc.user.model.vo.Users;

import lombok.extern.slf4j.Slf4j;


@Slf4j // log4j 선언을 대신 선언 해주는 lombok 어노테이션
@SessionAttributes("loginMember") // loginMember를 Model 취급할때 세션으로 처리하도록 도와주는 어노테이션
@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/member/login")
	public String loginPage() {
		log.info("로그인 페이지 요청");
		return "member/login";
	}
	
	@PostMapping("/member/login")
	public String login(Model model, String userId, String userPwd) {
		log.info("id : " + userId + ", pwd : " + userPwd);
		Users loginMember = service.login(userId, userPwd);
		
		if(loginMember != null) { // 성공
			model.addAttribute("loginMember", loginMember); // 세션에 저장되는 코드, @SessionAttributes
			return "redirect:/";
		}else { // 실패
			model.addAttribute("msg", "아이디 패스워드가 잘못되었습니다.");
			model.addAttribute("location", "/");
			return "common/msg";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) { // status : 세션의 상태 확인과 해제가 가능한 클래스
		log.info("status : " + status.isComplete());
		status.setComplete();
		log.info("status : " + status.isComplete());
		return "redirect:/";
	}
	
	@GetMapping("/member/signup")
	public String enrollPage() {
		log.info("가입 페이지 요청");
		return "member/signup";
	}
	
	// 회원가입 
	// ModelAndView 사용법, 가능하면 프로젝트에서는 스타일 통일할것! 현업 일부와 전저정부프레임워크 표준.
	@PostMapping("/member/signup")
	public ModelAndView signup(ModelAndView model, @ModelAttribute Users user) { // @ModelAttribute 생각가능
		log.info("회원가입, member : " + user.toString());

		int result = service.save(user);
		
		if(result > 0) { // 성공
			model.addObject("msg", "회원가입에 성공하였습니다.");
			model.addObject("location", "/");
		}else { // 실패
			model.addObject("msg", "회원가입에 실패하였습니다. 입력정보를 확인하세요.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		return model;
	}
	

	// AJAX 회원아이디 중복 검사부
	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(String id){
		log.info("아이디 중복 확인 : " + id);
		
		boolean result = service.validate(id);
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("validate", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	
	
	@GetMapping("/member/mypage")
	public String mypage(){
		log.info("회원정보 페이지 요청");
		return "member/mypage";
	}

	@PostMapping("/member/update") // (회원정보) 수정하기 버튼 눌렀을 때
	public String update(Model model, 
			@ModelAttribute Users updateMember, // request에서 온 값
			@SessionAttribute(name = "loginMember", required = false) Users loginMember // 세션 값
			) {
		log.info("loginMember : " + loginMember.getUserId());
		log.info("updateMember : " + updateMember.getUserId());
		
		if(loginMember == null || loginMember.getUserId().equals(updateMember.getUserId()) == false) { // 로그인된 멤버와 수정하려는 멤버가 다를때
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("location","/");
			return "common/msg";
		}
		
		updateMember.setUserNo(loginMember.getUserNo());
		int result = service.save(updateMember);
		
		if(result > 0) {
			model.addAttribute("loginMember", service.findById(loginMember.getUserId())); // DB에서 있는 값을 다시 세션에 넣어주는 코드
			model.addAttribute("msg", "회원정보를 수정하였습니다.");
			model.addAttribute("location", "/member/mypage");
		}else {
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.");
			model.addAttribute("location", "/member/mypage");
		}
		return "common/msg";
	}
	
	
	@GetMapping("/member/mystamp")
	public String stamp() {
		log.info("스탬프 페이지 요청");
		return "member/mystamp";
	}
	
	@GetMapping("/member/mybooked")
	public String booked() {
		log.info("예약정보 페이지 요청");
		return "member/mybooked";
	}
	
	@GetMapping("/member/mypwChange")
	public String mypwChangePage() {
		log.info("비밀번호 변경 요청");
		return "member/mypwChange";
	}
	
	@PostMapping("/member/updatePwd")
	public String mypwChange(Model model, @SessionAttribute(name = "loginMember", required = false) Users loginMember,
			String userPwd) {
		int result = service.updatePwd(loginMember, userPwd);

		if (result > 0) {
			model.addAttribute("msg", "비밀번호 수정에 성공하였습니다.");
		} else {
			model.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
		}
		model.addAttribute("script", "self.close()");
		return "/common/msg";
	}
	
	@GetMapping("/member/idpwfind")  // 12/26: 수정할 가능성 있음
	public String idpwfint() {
		return "member/idpwfind";
	}
}




















