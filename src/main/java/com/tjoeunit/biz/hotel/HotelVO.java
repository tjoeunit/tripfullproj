package com.tjoeunit.biz.hotel;

import org.springframework.web.multipart.MultipartFile;

public class HotelVO {
	private int hotel_no;
	private String hotel_title;
	private String hotel_content;
	private String hotel_img;
	private String hotel_thumb;
	private String hotel_category;
	private int hotel_price;
	private String hotel_area;
	private String searchCondition;
	private String searchKeyword;
	private MultipartFile uploadFile;
	
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



	public MultipartFile getUploadFile() {
		return uploadFile;
	}



	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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



	public String getHotel_img() {
		return hotel_img;
	}



	public void setHotel_img(String hotel_img) {
		this.hotel_img = hotel_img;
	}



	public String getHotel_thumb() {
		return hotel_thumb;
	}



	public void setHotel_thumb(String hotel_thumb) {
		this.hotel_thumb = hotel_thumb;
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



	@Override
	public String toString() {
		return "HotelVO [hotel_no=" + hotel_no 
								+ ", hotel_title=" + hotel_title 
								+ ", hotel_content=" + hotel_content
								+ ", hotel_price=" + hotel_price 
								+ ", hotel_area=" + hotel_area + "]";
	}
		
}
