package com.booking.common;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DecimalFormat;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import com.booking.common.crpt.SHA256;






public class Util {

	 // 본인인증을 위한 랜덤 키 값 생성 메서드
	  public String randomkey(String email) {

	    Random rnd = new Random();
	    StringBuffer buf = new StringBuffer();

	    for (int i = 0; i < 20; i++) {
	      if (rnd.nextBoolean()) {
	        buf.append((char) ((rnd.nextInt(26)) + 97));
	      } else {
	        buf.append((rnd.nextInt(10)));
	      }
	    }
	    buf.append(email);
	    return buf + "";
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
	  public String sha256(String pass) {

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
	  
	  

	  
	  
	  
	  public Cookie makeCookie(HttpServletResponse response,String id ) throws Exception {
		  
		    
			 
		  Cookie cookie = new Cookie("id", id);
		 
		  cookie.setMaxAge(7*24*60*60);
		 
		  response.addCookie(cookie);
	
		  return cookie;
	  }
		  
}
