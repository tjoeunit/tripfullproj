package com.tjoeunit.biz.activity;

public class test {

	public static void main(String[] args) {
		
		String lanVideo = "https://www.youtube.com/watch?v=VE2nlThIjPs";
		String sublanvideo = lanVideo.substring(0, 24)+"embeded/"+lanVideo.substring(24);
		System.out.println(sublanvideo);

	}

}
