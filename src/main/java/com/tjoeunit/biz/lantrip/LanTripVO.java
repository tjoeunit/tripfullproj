package com.tjoeunit.biz.lantrip;

import org.springframework.web.multipart.MultipartFile;

public class LanTripVO {
	private int		lantrip_no;
	private String	lantrip_title;
	private String	lantrip_content;
	private String	lantrip_thumb;
	private int		lantrip_price;
	private String	lantrip_area;
	private String	lantrip_video;
	private String	lantrip_img1;
	private String	lantrip_img2;
	private String	lantrip_img3;
	private String	lantrip_img4;
	private String	lantrip_img5;
	
	public int getLantrip_no() {
		return lantrip_no;
	}

	public void setLantrip_no(int lantrip_no) {
		this.lantrip_no = lantrip_no;
	}

	public String getLantrip_title() {
		return lantrip_title;
	}

	public void setLantrip_title(String lantrip_title) {
		this.lantrip_title = lantrip_title;
	}

	public String getLantrip_content() {
		return lantrip_content;
	}

	public void setLantrip_content(String lantrip_content) {
		this.lantrip_content = lantrip_content;
	}

	public String getLantrip_thumb() {
		return lantrip_thumb;
	}

	public void setLantrip_thumb(String lantrip_thumb) {
		this.lantrip_thumb = lantrip_thumb;
	}

	public int getLantrip_price() {
		return lantrip_price;
	}

	public void setLantrip_price(int lantrip_price) {
		this.lantrip_price = lantrip_price;
	}

	public String getLantrip_area() {
		return lantrip_area;
	}

	public void setLantrip_area(String lantrip_area) {
		this.lantrip_area = lantrip_area;
	}

	public String getLantrip_video() {
		return lantrip_video;
	}

	public void setLantrip_video(String lantrip_video) {
		this.lantrip_video = lantrip_video;
	}

	public String getLantrip_img1() {
		return lantrip_img1;
	}

	public void setLantrip_img1(String lantrip_img1) {
		this.lantrip_img1 = lantrip_img1;
	}

	public String getLantrip_img2() {
		return lantrip_img2;
	}

	public void setLantrip_img2(String lantrip_img2) {
		this.lantrip_img2 = lantrip_img2;
	}

	public String getLantrip_img3() {
		return lantrip_img3;
	}

	public void setLantrip_img3(String lantrip_img3) {
		this.lantrip_img3 = lantrip_img3;
	}

	public String getLantrip_img4() {
		return lantrip_img4;
	}

	public void setLantrip_img4(String lantrip_img4) {
		this.lantrip_img4 = lantrip_img4;
	}

	public String getLantrip_img5() {
		return lantrip_img5;
	}

	public void setLantrip_img5(String lantrip_img5) {
		this.lantrip_img5 = lantrip_img5;
	}

	// 콜솔에서 확인 가능
	@Override
	public String toString() {
		return "LanTripVO [lantrip_no="+lantrip_no+", lantrip_title="+lantrip_title+", lantrip_content="+lantrip_content
				+", lantrip_thumb="+lantrip_thumb+", lantrip_price="+lantrip_price+", lantrip_area="+lantrip_area+", lantrip_video="+lantrip_video+"]";

	}


}
