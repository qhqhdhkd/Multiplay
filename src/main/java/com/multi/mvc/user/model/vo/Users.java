package com.multi.mvc.user.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {
	private int 	userNo;
	private String 	userId;
	private String 	userPw;
	private String 	userName;
	private String 	userBirth;
	private String 	userPhone;
	private String 	userEmail;
	private String 	userAddress;
	private int 	userStamp;
	private String status;
	private Date enrollDate;
	private Date modifyDate;
}
