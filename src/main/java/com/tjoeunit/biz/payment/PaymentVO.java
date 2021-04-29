package com.tjoeunit.biz.payment;

import java.sql.Date;

public class PaymentVO {
	
	private int payment_no;
	private String members_no;
	private String flight_no;
	private String hotel_no;
	private String activity_no;
	private String lantrip_no;
	private String payment_bookdate;
	private String payment_quantity;
	private String payment_price;
	private Date payment_date;
	private String flight_title;
	private String hotel_title;
	private String activity_title;
	private String lantrip_title;
	private String product_category;
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public String getMembers_no() {
		return members_no;
	}
	public void setMembers_no(String members_no) {
		this.members_no = members_no;
	}
	public String getFlight_no() {
		return flight_no;
	}
	public void setFlight_no(String flight_no) {
		this.flight_no = flight_no;
	}
	public String getHotel_no() {
		return hotel_no;
	}
	public void setHotel_no(String hotel_no) {
		this.hotel_no = hotel_no;
	}
	public String getActivity_no() {
		return activity_no;
	}
	public void setActivity_no(String activity_no) {
		this.activity_no = activity_no;
	}
	public String getLantrip_no() {
		return lantrip_no;
	}
	public void setLantrip_no(String lantrip_no) {
		this.lantrip_no = lantrip_no;
	}
	public String getPayment_bookdate() {
		return payment_bookdate;
	}
	public void setPayment_bookdate(String payment_bookdate) {
		this.payment_bookdate = payment_bookdate;
	}
	public String getPayment_quantity() {
		return payment_quantity;
	}
	public void setPayment_quantity(String payment_quantity) {
		this.payment_quantity = payment_quantity;
	}
	public String getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getFlight_title() {
		return flight_title;
	}
	public void setFlight_title(String flight_title) {
		this.flight_title = flight_title;
	}
	public String getHotel_title() {
		return hotel_title;
	}
	public void setHotel_title(String hotel_title) {
		this.hotel_title = hotel_title;
	}
	public String getActivity_title() {
		return activity_title;
	}
	public void setActivity_title(String activity_title) {
		this.activity_title = activity_title;
	}
	public String getLantrip_title() {
		return lantrip_title;
	}
	public void setLantrip_title(String lantrip_title) {
		this.lantrip_title = lantrip_title;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	@Override
	public String toString() {
		return "PaymentVO [payment_no=" + payment_no + ", members_no=" + members_no + ", flight_no=" + flight_no
				+ ", hotel_no=" + hotel_no + ", activity_no=" + activity_no + ", lantrip_no=" + lantrip_no
				+ ", payment_bookdate=" + payment_bookdate + ", payment_quantity=" + payment_quantity
				+ ", payment_price=" + payment_price + ", payment_date=" + payment_date + ", flight_title="
				+ flight_title + ", hotel_title=" + hotel_title + ", activity_title=" + activity_title
				+ ", lantrip_title=" + lantrip_title + ", product_category=" + product_category + "]";
	}
	
	
	
	
	
}
