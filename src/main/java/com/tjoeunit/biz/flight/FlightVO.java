package com.tjoeunit.biz.flight;

public class FlightVO {
	private int flight_no;
	private String flight_title;
	private String flight_content;
	private String flight_thumb;
	private String flight_price;
	private String flight_departure;
	private String flight_arrival;
	private String flight_img1;
	private String flight_img2;
	private String flight_img3;
	private String flight_img4;
	private String flight_img5;
	private String flight_video;
	
	public int getFlight_no() {
		return flight_no;
	}
	public void setFlight_no(int flight_no) {
		this.flight_no = flight_no;
	}
	public String getFlight_title() {
		return flight_title;
	}
	public void setFlight_title(String flight_title) {
		this.flight_title = flight_title;
	}
	public String getFlight_content() {
		return flight_content;
	}
	public void setFlight_content(String flight_content) {
		this.flight_content = flight_content;
	}
	public String getFlight_thumb() {
		return flight_thumb;
	}
	public void setFlight_thumb(String flight_thumb) {
		this.flight_thumb = flight_thumb;
	}
	public String getFlight_price() {
		return flight_price;
	}
	public void setFlight_price(String flight_price) {
		this.flight_price = flight_price;
	}
	public String getFlight_departure() {
		return flight_departure;
	}
	public void setFlight_departure(String flight_departure) {
		this.flight_departure = flight_departure;
	}
	public String getFlight_arrival() {
		return flight_arrival;
	}
	public void setFlight_arrival(String flight_arrival) {
		this.flight_arrival = flight_arrival;
	}
	public String getFlight_img1() {
		return flight_img1;
	}
	public void setFlight_img1(String flight_img1) {
		this.flight_img1 = flight_img1;
	}
	public String getFlight_img2() {
		return flight_img2;
	}
	public void setFlight_img2(String flight_img2) {
		this.flight_img2 = flight_img2;
	}
	public String getFlight_img3() {
		return flight_img3;
	}
	public void setFlight_img3(String flight_img3) {
		this.flight_img3 = flight_img3;
	}
	public String getFlight_img4() {
		return flight_img4;
	}
	public void setFlight_img4(String flight_img4) {
		this.flight_img4 = flight_img4;
	}
	public String getFlight_img5() {
		return flight_img5;
	}
	public void setFlight_img5(String flight_img5) {
		this.flight_img5 = flight_img5;
	}
	public String getFlight_video() {
		return flight_video;
	}
	public void setFlight_video(String flight_video) {
		this.flight_video = flight_video;
	}
	
	@Override
	public String toString() {
		return "FlightVO [flight_no=" + flight_no + ", flight_title=" + flight_title + ", flight_content="
				+ flight_content + ", flight_thumb=" + flight_thumb + ", flight_price=" + flight_price
				+ ", flight_departure=" + flight_departure + ", flight_arrival=" + flight_arrival + ", flight_img1="
				+ flight_img1 + ", flight_img2=" + flight_img2 + ", flight_img3=" + flight_img3 + ", flight_img4="
				+ flight_img4 + ", flight_img5=" + flight_img5 + ", flight_video=" + flight_video + "]";
	}
	
}
