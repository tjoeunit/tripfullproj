package com.tjoeunit.biz.lantrip;

public class test {

	public static void main(String[] args) {
	
		String lan_url = "https://youtu.be/5tW7R3R8410";
		lan_url = "https://www.youtube.com/embed"+lan_url.substring(16);
		System.out.println(lan_url);
	}

}
