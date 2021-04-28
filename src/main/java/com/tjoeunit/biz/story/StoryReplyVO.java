package com.tjoeunit.biz.story;

import java.util.Date;

public class StoryReplyVO {
	
	private int reply_no; //댓글 번호
    private int story_no; //게시물 번호
    private String reply_text; //댓글 내용
    private String members_id; // 로그인된 멤버 id
    private Date reply_date; // 댓글 작성일자(deafult sysdate)
    
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getStory_no() {
		return story_no;
	}
	public void setStory_no(int story_no) {
		this.story_no = story_no;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public String getMembers_id() {
		return members_id;
	}
	public void setMembers_id(String members_id) {
		this.members_id = members_id;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
    
	
}
