package com.booking.member.vo;

import com.booking.common.vo.ListCommonVO;

public class MemberVO extends ListCommonVO{
   private int m_no;               //회원번호
   private String m_id;            //아이디
   private String m_pwd;            //비밀번호
   private String m_nick;            //닉네임
   private String m_name;            //이름
   private String m_birth;          //생년월일
   private String m_sex;            //성별
   private String m_phone;          //핸드폰번호
   private String m_email;          //이메일
   private String m_comment;        //메모
   private String m_rank;           //등급
   private String m_point;          //포인트
   private String m_update;        //가입일
   private String m_editdate;      //정보수정일
   private String m_home_address;   //주소
   private String m_post_address;    //배송지
      
   private int i_no;            //이미지 파일 번호
   
   public int getI_no() {
   return i_no;
   }
   public void setI_no(int i_no) {
      this.i_no = i_no;
   }

   
   
   public int getM_no() {
      return m_no;
   }
   public void setM_no(int m_no) {
      this.m_no = m_no;
   }
   public String getM_id() {
      return m_id;
   }
   public void setM_id(String m_id) {
      this.m_id = m_id;
   }
   public String getM_pwd() {
      return m_pwd;
   }
   public void setM_pwd(String m_pwd) {
      this.m_pwd = m_pwd;
   }
   public String getM_nick() {
      return m_nick;
   }
   public void setM_nick(String m_nick) {
      this.m_nick = m_nick;
   }
   public String getM_name() {
      return m_name;
   }
   public void setM_name(String m_name) {
      this.m_name = m_name;
   }
   public String getM_birth() {
      return m_birth;
   }
   public void setM_birth(String m_birth) {
      this.m_birth = m_birth;
   }
   public String getM_sex() {
      return m_sex;
   }
   public void setM_sex(String m_sex) {
      this.m_sex = m_sex;
   }
   public String getM_phone() {
      return m_phone;
   }
   public void setM_phone(String m_phone) {
      this.m_phone = m_phone;
   }
   public String getM_email() {
      return m_email;
   }
   public void setM_email(String m_email) {
      this.m_email = m_email;
   }
   public String getM_comment() {
      return m_comment;
   }
   public void setM_comment(String m_comment) {
      this.m_comment = m_comment;
   }
   public String getM_rank() {
      return m_rank;
   }
   public void setM_rank(String m_rank) {
      this.m_rank = m_rank;
   }
   public String getM_point() {
      return m_point;
   }
   public void setM_point(String m_point) {
      this.m_point = m_point;
   }
   public String getM_update() {
      return m_update;
   }
   public void setM_update(String m_update) {
      this.m_update = m_update;
   }
   public String getM_editdate() {
      return m_editdate;
   }
   public void setM_editdate(String m_editdate) {
      this.m_editdate = m_editdate;
   }
   public String getM_home_address() {
      return m_home_address;
   }
   public void setM_home_address(String m_home_address) {
      this.m_home_address = m_home_address;
   }
   public String getM_post_address() {
      return m_post_address;
   }
   public void setM_post_address(String m_post_address) {
      this.m_post_address = m_post_address;
   }
   
   

   

   
   
}