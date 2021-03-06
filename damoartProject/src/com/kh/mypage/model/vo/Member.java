package com.kh.mypage.model.vo;

import java.sql.Date;

public class Member {

	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String nickName;
	private String email;
	private String phone;
	private String birth;
	private Date enrollDate;
	private String memType;
	private String status;
	
	private String emailId;
	private String emailDomain;
	private String birth1;
	private String birth2;
	private String birth3;
	
	public Member() {}

	

	public Member(String memId, String memPwd, String memName, String nickName, String email, String phone,
			String birth) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
	}



	public Member(String memPwd, String memName, String nickName, String email, String phone,
			String birth) {
		super();
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.memId = memId;
	}
	

	public Member(String memId, String memPwd, String memName, String nickName, String emailId, String phone,
			String emailDomain, String birth1, String birth2, String birth3) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickName = nickName;
		this.phone = phone;
		this.emailId = emailId;
		this.emailDomain = emailDomain;
		this.birth1 = birth1;
		this.birth2 = birth2;
		this.birth3 = birth3;
	}

	

	public Member(int memNo, String memId, String memPwd, String memName, String nickName, String email, String phone,
			String birth, Date enrollDate, String memType, String status) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.enrollDate = enrollDate;
		this.memType = memType;
		this.status = status;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getNickname() {
		return nickName;
	}

	public void setNickname(String nickname) {
		this.nickName = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getMemType() {
		return memType;
	}

	public void setMemType(String memType) {
		this.memType = memType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", nickname=" + nickName + ", email=" + email + ", phone=" + phone + ", birth=" + birth
				+ ", enrollDate=" + enrollDate + ", memType=" + memType + ", status=" + status + "]";
	}
	
	
}
