package com.tjoeunit.biz.qna;

import java.util.Date;

public class QnaReplyVO {
	private int		qreply_no;
	private String	members_id;
	private int		qna_no;
	private String	qreply_text;
	private Date	qreply_date;
	
	public int getQreply_no() {
		return qreply_no;
	}
	public void setQreply_no(int qreply_no) {
		this.qreply_no = qreply_no;
	}
	public String getMembers_id() {
		return members_id;
	}
	public void setMembers_id(String members_id) {
		this.members_id = members_id;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQreply_text() {
		return qreply_text;
	}
	public void setQreply_text(String qreply_text) {
		this.qreply_text = qreply_text;
	}
	public Date getQreply_date() {
		return qreply_date;
	}
	public void setQreply_date(Date qreply_date) {
		this.qreply_date = qreply_date;
	}
	
}
