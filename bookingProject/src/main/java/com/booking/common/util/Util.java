package com.booking.common.util;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DecimalFormat;

import javax.servlet.http.Cookie;

import com.booking.common.crpt.SHA256;

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
	
	  public static String priceNumber(int price){
		  
		  DecimalFormat dc = new DecimalFormat("###,###,###,###");    
	        String ch = dc.format(price);
	    
		  
	        return ch;
	  }
	  
	//ip호출 메서드 
	  public static String ip() {
		    String ip = "";
		    InetAddress Address;
		    try {
		      Address = InetAddress.getLocalHost();
		      ip = Address.getHostAddress();
		    } catch (UnknownHostException e1) {
		      // TODO Auto-generated catch block
		      e1.printStackTrace();
		    }
		    return ip;

		  }
	  
	//입력값 암호화 메서드
	  public static String sha256(String pass) {

		    String shapass = "";
		    String Data = pass;
		    byte chageByte[] = Data.getBytes();
		    byte pszDigest[] = new byte[32];
		    System.out.println("chageByte length :" + chageByte.length);
		    System.out.println("test data : " + Data);
		    SHA256.SHA256_Encrpyt(chageByte, chageByte.length, pszDigest);

		    for (int i = 0; i < 32; i++) {

		      shapass += Integer.toHexString(0xff & pszDigest[i]);

		    }
		    System.out.println(shapass);
		    return shapass;
		  } 
	  
	  
}
