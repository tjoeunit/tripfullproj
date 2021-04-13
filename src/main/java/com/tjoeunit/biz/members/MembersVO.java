package com.tjoeunit.biz.members;

import java.sql.Date;

public class MembersVO {
	private int members_no;
	private String members_id;
	private String members_pw;
	private String members_name;
	private String members_tel;
	private Date members_birth;
	private String members_email;
	private Date members_regdate;
	private Date members_outdate;
	private String members_gender;
	private int members_zipcode;
	private String members_address;
	private String members_address_detail;
		
	public int getMembers_no() {
		return members_no;
	}
	public void setMembers_no(int members_no) {
		this.members_no = members_no;
	}
	public String getMembers_id() {
		return members_id;
	}
	public void setMembers_id(String members_id) {
		this.members_id = members_id;
	}
	public String getMembers_pw() {
		return members_pw;
	}
	public void setMembers_pw(String members_pw) {
		this.members_pw = members_pw;
	}
	public String getMembers_name() {
		return members_name;
	}
	public void setMembers_name(String members_name) {
		this.members_name = members_name;
	}
	public String getMembers_tel() {
		return members_tel;
	}
	public void setMembers_tel(String members_tel) {
		this.members_tel = members_tel;
	}
	public Date getMembers_birth() {
		return members_birth;
	}
	public void setMembers_birth(Date members_birth) {
		this.members_birth = members_birth;
	}
	public String getMembers_email() {
		return members_email;
	}
	public void setMembers_email(String members_email) {
		this.members_email = members_email;
	}
	public Date getMembers_regdate() {
		return members_regdate;
	}
	public void setMembers_regdate(Date members_regdate) {
		this.members_regdate = members_regdate;
	}
	public Date getMembers_outdate() {
		return members_outdate;
	}
	public void setMembers_outdate(Date members_outdate) {
		this.members_outdate = members_outdate;
	}
	public String getMembers_gender() {
		return members_gender;
	}
	public void setMembers_gender(String members_gender) {
		this.members_gender = members_gender;
	}
	public int getMembers_zipcode() {
		return members_zipcode;
	}
	public void setMembers_zipcode(int members_zipcode) {
		this.members_zipcode = members_zipcode;
	}
	public String getMembers_address() {
		return members_address;
	}
	public void setMembers_address(String members_address) {
		this.members_address = members_address;
	}
	public String getMembers_address_detail() {
		return members_address_detail;
	}
	public void setMembers_address_detail(String members_address_detail) {
		this.members_address_detail = members_address_detail;
	}
	
	@Override
	public String toString() {
		return "MembersVO [members_no=" + members_no + ", members_id=" + members_id + ", members_pw=" + members_pw
				+ ", members_name=" + members_name + ", members_tel=" + members_tel + ", members_birth=" + members_birth
				+ ", members_email=" + members_email + ", members_regdate=" + members_regdate + ", members_outdate="
				+ members_outdate + ", members_gender=" + members_gender + ", members_zipcode=" + members_zipcode
				+ ", members_address=" + members_address + ", members_address_detail=" + members_address_detail + "]";
	}
		
}
