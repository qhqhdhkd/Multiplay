package com.multi.mvc.user.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.mvc.user.model.mapper.UserMapper;
import com.multi.mvc.user.model.vo.Users;

@Service
public class UserService {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder; 
	public Users login(String id, String pw) {
		Users user = mapper.selectMember(id);
		if(user == null) {
			return null;
		}
		
		// passwordEncoder 활용법
		System.out.println(pw);
		System.out.println(user.getUserPw());
		System.out.println(pwEncoder.encode(pw)); 
		System.out.println(pwEncoder.matches(pw, user.getUserPw()));
		
		if(id.equals("WYB")) { // DB에 있는 계정은 비밀번호가 암호화되지 않고 생성된거라서 matches하지 않는다.
			return user;
		}
		
		if(user != null && pwEncoder.matches(pw, user.getUserPw()) == true) {
			return user;
		}else {
			// 로그인 실패
			return null;
		}
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int save(Users user) {
		int result = 0;
		if(user.getUserNo() == 0) { // 회원가입
			String encodePW = pwEncoder.encode(user.getUserPw());
			user.setUserPw(encodePW);
			result = mapper.insertMember(user);
		}else { // 회원 수정
			result = mapper.updateMember(user);
		}
		return result;
	}
	
	public boolean validate(String userId) {
		return this.findById(userId) != null;
	}
	
	public Users findById(String id) {
		return mapper.selectMember(id);
	}

	
	@Transactional(rollbackFor = Exception.class)
	public int delete(int no) {
		return mapper.deleteMember(no);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int updatePwd(Users loginMember, String userPW) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userNo", "" + loginMember.getUserNo());
		map.put("newPwd", pwEncoder.encode(userPW));
		return mapper.updatePwd(map);
	}
	
}
