package com.githrd.camp24.vo;

import java.util.*;
import java.text.*;

public class PreferenceVO {
	private int mno, ano, pno, mmno;
	private String id, sdate, pname, smenu, msavename;
	private Date mdate;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getMmno() {
		return mmno;
	}
	public void setMmno(int mmno) {
		this.mmno = mmno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getSmenu() {
		return smenu;
	}
	public void setSmenu(String smenu) {
		this.smenu = smenu;
	}
	public String getMsavename() {
		return msavename;
	}
	public void setMsavename(String msavename) {
		this.msavename = msavename;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdate = form.format(mdate);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
		setSdate();
	}
	@Override
	public String toString() {
		return "PreferenceVO [mno=" + mno + ", ano=" + ano + ", pno=" + pno + ", mmno=" + mmno + ", id=" + id
				+ ", sdate=" + sdate + ", pname=" + pname + ", smenu=" + smenu + ", msavename=" + msavename
				+ ", mdate=" + mdate + "]";
	}
}
