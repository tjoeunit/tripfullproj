package com.tjoeunit.biz.story;

import java.util.Date;

public class StoryVO {
	private int story_no;
	private int members_no;
	private String story_title;
	private String story_content;
	private String story_writer;
	private int story_cnt;
	private Date story_date;
	
	public int getStory_no() {
		return story_no;
	}
	public void setStory_no(int story_no) {
		this.story_no = story_no;
	}
	public int getMembers_no() {
		return members_no;
	}
	public void setMembers_no(int members_no) {
		this.members_no = members_no;
	}
	public String getStory_title() {
		return story_title;
	}
	public void setStory_title(String story_title) {
		this.story_title = story_title;
	}
	public String getStory_content() {
		return story_content;
	}
	public void setStory_content(String story_content) {
		this.story_content = story_content;
	}
	public String getStory_writer() {
		return story_writer;
	}
	public void setStory_writer(String story_writer) {
		this.story_writer = story_writer;
	}
	public int getStory_cnt() {
		return story_cnt;
	}
	public void setStory_cnt(int story_cnt) {
		this.story_cnt = story_cnt;
	}
	public Date getStory_date() {
		return story_date;
	}
	public void setStory_date(Date story_date) {
		this.story_date = story_date;
	}
	
	@Override
	public String toString() {
		return "StoryVO [story_no=" + story_no + ", members_no=" + members_no + ", story_title=" + story_title
				+ ", story_content=" + story_content + ", story_writer=" + story_writer + ", story_cnt=" + story_cnt
				+ ", story_date=" + story_date + "]";
	}
	
	
	
	
}