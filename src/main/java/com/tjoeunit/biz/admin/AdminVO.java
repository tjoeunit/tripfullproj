package com.tjoeunit.biz.admin;

import java.sql.Date;

public class AdminVO {
	private int members_no;
	private String members_id;
	private String members_pw;
	private String members_name;
		

	
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



	@Override
	public String toString() {
		return "MembersVO [members_no=" + members_no + ", members_id=" + members_id + ", members_pw=" + members_pw
				+ ", members_name=" + members_name + "]";
	}
		
}
