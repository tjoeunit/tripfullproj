package com.tjoeunit.biz.story;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class StoryVO {
	private int story_no;
	private int members_no;
	private String story_title;
	private String story_content;
	private String story_imgname; //파일명 (변경)
	private String story_imgorigin; //파일명 (기존)
	private String story_imgsize; //파일용량
	private int story_re_ref;
	private int story_re_lev;
	private int story_re_seq;
	private int story_cnt;
	private Date story_date;
	private String storySearchCondition;
	private String storySearchKeyword;
	
	private String storyFileAttachPath;
	private String storyFilename;
	private MultipartFile storyUploadFile;
	private String CKEditorFuncNum;
	
	
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
	public String getStory_imgname() {
		return story_imgname;
	}
	public void setStory_imgname(String story_imgname) {
		this.story_imgname = story_imgname;
	}
	public String getStory_imgorigin() {
		return story_imgorigin;
	}
	public void setStory_imgorigin(String story_imgorigin) {
		this.story_imgorigin = story_imgorigin;
	}
	public String getStory_imgsize() {
		return story_imgsize;
	}
	public void setStory_imgsize(String story_imgsize) {
		this.story_imgsize = story_imgsize;
	}
	public int getStory_re_ref() {
		return story_re_ref;
	}
	public void setStory_re_ref(int story_re_ref) {
		this.story_re_ref = story_re_ref;
	}
	public int getStory_re_lev() {
		return story_re_lev;
	}
	public void setStory_re_lev(int story_re_lev) {
		this.story_re_lev = story_re_lev;
	}
	public int getStory_re_seq() {
		return story_re_seq;
	}
	public void setStory_re_seq(int story_re_seq) {
		this.story_re_seq = story_re_seq;
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
	public String getStorySearchCondition() {
		return storySearchCondition;
	}
	public void setStorySearchCondition(String storySearchCondition) {
		this.storySearchCondition = storySearchCondition;
	}
	public String getStorySearchKeyword() {
		return storySearchKeyword;
	}
	public void setStorySearchKeyword(String storySearchKeyword) {
		this.storySearchKeyword = storySearchKeyword;
	}
	public String getStoryFileAttachPath() {
		return storyFileAttachPath;
	}
	public void setStoryFileAttachPath(String storyFileAttachPath) {
		this.storyFileAttachPath = storyFileAttachPath;
	}
	public String getStoryFilename() {
		return storyFilename;
	}
	public void setStoryFilename(String storyFilename) {
		this.storyFilename = storyFilename;
	}
	public MultipartFile getStoryUploadFile() {
		return storyUploadFile;
	}
	public void setStoryUploadFile(MultipartFile storyUploadFile) {
		this.storyUploadFile = storyUploadFile;
	}
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
	
	
}
