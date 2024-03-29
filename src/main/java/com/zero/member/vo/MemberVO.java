package com.zero.member.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MemberVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public String toString() {
		return ToStringBuilder. reflectionToString(this);
	}
	
	private String memId;         /*아이디*/
	private String memPass;       /*비밀번호*/
	private String memName;       /*회원이름*/
	private String memRegno1;     /*주민번호1*/
	private String memRegno2;     /*주민번호2*/
	private String memBir;        /*생일*/
	private String memZip;        /*우편번호*/
	private String memAdd1;       /*주소1*/
	private String memAdd2;       /*주소2*/
	private String memHp;         /*전화번호*/
	private String memMail;       /*이메일*/
	private int memMileage;       /*마일리지*/
	private String memDelYN;      /*멤버 삭제 여부*/
	private  String memAdminYn;      /*관리자 여부*/
	
	//rnum 담을 변수 
	
	private int memrnum;
	
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemRegno1() {
		return memRegno1;
	}
	public void setMemRegno1(String memRegno1) {
		this.memRegno1 = memRegno1;
	}
	public String getMemRegno2() {
		return memRegno2;
	}
	public void setMemRegno2(String memRegno2) {
		this.memRegno2 = memRegno2;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public String getMemZip() {
		return memZip;
	}
	public void setMemZip(String memZip) {
		this.memZip = memZip;
	}
	public String getMemAdd1() {
		return memAdd1;
	}
	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}
	public String getMemAdd2() {
		return memAdd2;
	}
	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public int getMemMileage() {
		return memMileage;
	}
	public void setMemMileage(int memMileage) {
		this.memMileage = memMileage;
	}
	public String getMemDelYN() {
		return memDelYN;
	}
	public void setMemDelYN(String memDelYN) {
		this.memDelYN = memDelYN;
	}
	public int getMemrnum() {
		return memrnum;
	}
	public void setMemrnum(int memrnum) {
		this.memrnum = memrnum;
	}
	public String getMemAdminYn() {
		return memAdminYn;
	}
	public void setMemAdminYn(String memAdminYn) {
		this.memAdminYn = memAdminYn;
	}
	
	
	
}
