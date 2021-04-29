package com.tjoeunit.biz.activity;


public class ActivityVO {
	private int		activity_no;
	private String	activity_title;
	private String	activity_content;
	private String	activity_thumb;
	private int		activity_price;
	private String	activity_area;
	private String	activity_video;

	/*
	 * private String activity_video; private String activity_img1; private String
	 * activity_img2; private String activity_img3; private String activity_img4;
	 * private String activity_img5;
	 */

	
	
	
	// 콜솔에서 확인 가능
	@Override
	public String toString() {
		return "ActivityVO [activity_no="+activity_no+", activity_title="+activity_title+", activity_content="+activity_content
				+", activity_thumb="+activity_thumb+", activity_price="+activity_price+", activity_area="+activity_area+"]";

	}

	public int getActivity_no() {
		return activity_no;
	}

	public void setActivity_no(int activity_no) {
		this.activity_no = activity_no;
	}

	public String getActivity_title() {
		return activity_title;
	}

	public void setActivity_title(String activity_title) {
		this.activity_title = activity_title;
	}

	public String getActivity_content() {
		return activity_content;
	}

	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}

	public String getActivity_thumb() {
		return activity_thumb;
	}

	public void setActivity_thumb(String activity_thumb) {
		this.activity_thumb = activity_thumb;
	}

	public int getActivity_price() {
		return activity_price;
	}

	public void setActivity_price(int activity_price) {
		this.activity_price = activity_price;
	}

	public String getActivity_area() {
		return activity_area;
	}

	public void setActivity_area(String activity_area) {
		this.activity_area = activity_area;
	}

	public String getActivity_video() {
		return activity_video;
	}

	public void setActivity_video(String activity_video) {
		this.activity_video = activity_video;
	}


}
