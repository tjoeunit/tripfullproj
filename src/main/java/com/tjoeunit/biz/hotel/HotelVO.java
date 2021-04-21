package com.tjoeunit.biz.hotel;

public class HotelVO {
	private int hotel_no;
	private String hotel_title;
	private String hotel_content;
	private String hotel_thumb;
	private String hotel_category;
	private int hotel_price;
	private String hotel_area;	
	private String hotel_img1;
	private String hotel_img2;  	
	private String hotel_img3;  	
	private String hotel_video;
	
	
	public String getHotel_video() {
		return hotel_video;
	}

	public void setHotel_video(String hotel_video) {
		this.hotel_video = hotel_video;
	}

	public String getHotel_thumb() {
		return hotel_thumb;
	}

	public void setHotel_thumb(String hotel_thumb) {
		this.hotel_thumb = hotel_thumb;
	}

	// 이미지는 디비에 저장하지 않고 서버에 먼저 올린다음 
	// 그 위치 경로를 스트링으로 경로를 넣어주는것이다.
	public int getHotel_no() {
		return hotel_no;
	}

	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}

	public String getHotel_title() {
		return hotel_title;
	}

	public void setHotel_title(String hotel_title) {
		this.hotel_title = hotel_title;
	}

	public String getHotel_content() {
		return hotel_content;
	}

	public void setHotel_content(String hotel_content) {
		this.hotel_content = hotel_content;
	}

	public String getHotel_category() {
		return hotel_category;
	}

	public void setHotel_category(String hotel_category) {
		this.hotel_category = hotel_category;
	}

	public int getHotel_price() {
		return hotel_price;
	}

	public void setHotel_price(int hotel_price) {
		this.hotel_price = hotel_price;
	}

	public String getHotel_area() {
		return hotel_area;
	}

	public void setHotel_area(String hotel_area) {
		this.hotel_area = hotel_area;
	}

	public String getHotel_img1() {
		return hotel_img1;
	}

	public void setHotel_img1(String hotel_img1) {
		this.hotel_img1 = hotel_img1;
	}

	public String getHotel_img2() {
		return hotel_img2;
	}

	public void setHotel_img2(String hotel_img2) {
		this.hotel_img2 = hotel_img2;
	}

	public String getHotel_img3() {
		return hotel_img3;
	}

	public void setHotel_img3(String hotel_img3) {
		this.hotel_img3 = hotel_img3;
	}
	
	@Override
	public String toString() {
		return "HotelVO [hotel_no=" + hotel_no 
								+ ", hotel_title=" + hotel_title 
								+ ", hotel_content=" + hotel_content
								+ ", hotel_price=" + hotel_price 
								+ ", hotel_area=" + hotel_area + "]";
	}
}
