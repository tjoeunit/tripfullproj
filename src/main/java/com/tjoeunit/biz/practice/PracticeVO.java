package com.tjoeunit.biz.practice;

public class PracticeVO {
	private int practice_no;
	private String practice_title;
	private String practice_content;
	
	public int getPractice_no() {
		return practice_no;
	}
	public void setPractice_no(int practice_no) {
		this.practice_no = practice_no;
	}
	public String getPractice_title() {
		return practice_title;
	}
	public void setPractice_title(String practice_title) {
		this.practice_title = practice_title;
	}
	public String getPractice_content() {
		return practice_content;
	}
	public void setPractice_content(String practice_content) {
		this.practice_content = practice_content;
	}
	
	@Override
	public String toString() {
		return "PracticeVO [practice_no=" + practice_no + ", practice_title=" + practice_title + ", practice_content="
				+ practice_content + "]";
	}
	
}
