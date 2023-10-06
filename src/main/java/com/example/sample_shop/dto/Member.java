package com.example.sample_shop.dto;


public class Member {
	private String memberId;	// 아이디
	private String passwd;		// 비밀번호
	private String passwd2;		// 비밀번호확인
	private String memberName;	// 이름
	private String gender;		// 성별
	private String birthday;	// 생년월일
	private String email;		// 이메일
	private String phone;		// 연락처
	private String address;		// 주소
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	
	public String getPasswd2() {
		return passwd2;
	}

	public void setPasswd2(String passwd2) {
		this.passwd2 = passwd2;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getBirthday() {
		return birthday;
	}
	
	public void setBirthday(String birthday) {
		this.birthday = birthday;
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
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", passwd=" + passwd + ", passwd2=" + passwd2 + ", memberName="
				+ memberName + ", gender=" + gender + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + "]";
	}


	

}
