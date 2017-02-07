package com.booking.common.util;

import javax.servlet.http.Cookie;

public class Util {
	
	/*****************************************
	 * nvl() 문자열을 숫자로 변환하는 메소드
	 * @param text 숫자로 변환할 문자열
	 * @param def 변환이 불가능 할 때 대신 반환할 대체값
	 * @return int 
	 ******************************************/
	
	public static int nvl(String text, int def){
		int ret = def;
		try{
			ret = Integer.parseInt(text);
		}catch(Exception e){
			ret = def;
		}
		return ret;
	}
	
	public static int nvl(String text){
		return nvl(text,0);
	}
	
	public static String getCookieValue(Cookie[] cookies, String cookieName){
		String cookieValue = "null";
		for(Cookie cookie : cookies){
			if(cookie.getName().equals(cookieName)){
				cookieValue = cookie.getValue();
			}
		}
		return cookieValue; 
	}
}
