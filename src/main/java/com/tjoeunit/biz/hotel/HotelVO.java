package com.tjoeunit.biz.hotel;

import org.springframework.web.multipart.MultipartFile;

public class HotelVO {
	private int hotel_no;
	private String hotel_title;
	private String hotel_content;
	private String hotel_category;
	private int hotel_price;
	private String hotel_area;
	private String searchCondition;
	private String searchKeyword;
	private MultipartFile hotel_thumb;  
	private MultipartFile hotel_img;
	private String hotel_thumb_path;
	private String hotel_img_path;
	// 이미지는 디비에 저장하지 않고 서버에 먼저 올린다음 
	// 그 위치 경로를 스트링으로 경로를 넣어주는것이다.


	public String getHotel_thumb_path() {
		return hotel_thumb_path;
	}


	public String getHotel_img_path() {
		return hotel_img_path;
	}


	public void setHotel_img_path(String hotel_img_path) {
		this.hotel_img_path = hotel_img_path;
	}


	public void setHotel_thumb_path(String hotel_thumb_path) {
		this.hotel_thumb_path = hotel_thumb_path;
	}


	@Override
	public String toString() {
		return "HotelVO [hotel_no=" + hotel_no 
								+ ", hotel_title=" + hotel_title 
								+ ", hotel_content=" + hotel_content
								+ ", hotel_price=" + hotel_price 
								+ ", hotel_area=" + hotel_area + "]";
	}


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


	public String getSearchCondition() {
		return searchCondition;
	}


	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public MultipartFile getHotel_thumb() {
		return hotel_thumb;
	}


	public void setHotel_thumb(MultipartFile hotel_thumb) {
		this.hotel_thumb = hotel_thumb;
	}


	public MultipartFile getHotel_img() {
		return hotel_img;
	}


	public void setHotel_img(MultipartFile hotel_img) {
		this.hotel_img = hotel_img;
	}


		
}
