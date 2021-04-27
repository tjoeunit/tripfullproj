package com.tjoeunit.biz.payment;

import java.sql.Date;

public class PaymentVO {
	
	private int payment_no;
	private int members_no;
	private int flight_no;
	private int hotel_no;
	private int activity_no;
	private int lantrip_no;
	private String payment_bookdate;
	private String payment_quantity;
	private String payment_price;
	private Date payment_date;
	
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public int getMembers_no() {
		return members_no;
	}
	public void setMembers_no(int members_no) {
		this.members_no = members_no;
	}
	public int getFlight_no() {
		return flight_no;
	}
	public void setFlight_no(int flight_no) {
		this.flight_no = flight_no;
	}
	public int getHotel_no() {
		return hotel_no;
	}
	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}
	public int getActivity_no() {
		return activity_no;
	}
	public void setActivity_no(int activity_no) {
		this.activity_no = activity_no;
	}
	public int getLantrip_no() {
		return lantrip_no;
	}
	public void setLantrip_no(int lantrip_no) {
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
	
	@Override
	public String toString() {
		return "PaymentVO [payment_no=" + payment_no + ", members_no=" + members_no + ", flight_no=" + flight_no
				+ ", hotel_no=" + hotel_no + ", activity_no=" + activity_no + ", lantrip_no=" + lantrip_no
				+ ", payment_bookdate=" + payment_bookdate + ", payment_quantity=" + payment_quantity
				+ ", payment_price=" + payment_price + ", payment_date=" + payment_date + "]";
	}
	
}
