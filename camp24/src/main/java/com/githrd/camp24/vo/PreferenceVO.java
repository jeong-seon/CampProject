package com.githrd.camp24.vo;

import java.util.*;
import java.text.*;

public class PreferenceVO {
	private int mno, ano, cnt, pno, mmno, mupno, pf_mno, pfno;
	private String id, sdate, pname, mname, msname, mkname, mtype, mview, mpet, pftype, pfview, pfpet;
	private Date mdate;
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
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
	public int getMupno() {
		return mupno;
	}
	public void setMupno(int mupno) {
		this.mupno = mupno;
	}
	public int getPf_mno() {
		return pf_mno;
	}
	public void setPf_mno(int pf_mno) {
		this.pf_mno = pf_mno;
	}
	public int getPfno() {
		return pfno;
	}
	public void setPfno(int pfno) {
		this.pfno = pfno;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMsname() {
		return msname;
	}
	public void setMsname(String msname) {
		this.msname = msname;
	}
	public String getMkname() {
		return mkname;
	}
	public void setMkname(String mkname) {
		this.mkname = mkname;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getMview() {
		return mview;
	}
	public void setMview(String mview) {
		this.mview = mview;
	}
	public String getMpet() {
		return mpet;
	}
	public void setMpet(String mpet) {
		this.mpet = mpet;
	}
	public String getPftype() {
		return pftype;
	}
	public void setPftype(String pftype) {
		this.pftype = pftype;
	}
	public String getPfview() {
		return pfview;
	}
	public void setPfview(String pfview) {
		this.pfview = pfview;
	}
	public String getPfpet() {
		return pfpet;
	}
	public void setPfpet(String pfpet) {
		this.pfpet = pfpet;
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
		return "PreferenceVO [mno=" + mno + ", ano=" + ano + ", cnt=" + cnt + ", pno=" + pno + ", mmno=" + mmno
				+ ", mupno=" + mupno + ", pf_mno=" + pf_mno + ", pfno=" + pfno + ", id=" + id + ", sdate=" + sdate
				+ ", pname=" + pname + ", mname=" + mname + ", msname=" + msname + ", mkname=" + mkname + ", mtype="
				+ mtype + ", mprice=" + ", mview=" + mview + ", mpet=" + mpet + ", pftype=" + pftype
				+ ", pfprice=" + ", pfview=" + pfview + ", pfpet=" + pfpet + ", mdate=" + mdate + "]";
	}
}
