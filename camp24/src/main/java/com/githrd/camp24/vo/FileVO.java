package com.githrd.camp24.vo;

import java.util.Date;

import java.text.*;

public class FileVO {
	private int bno, fno, mno, rno, tno, cnt, ino, imageno;
	private long len, ilen;
	private String id, oriname, ioriname, isavename, savename, dir, idir, sdate, icode;
	private Date wdate;
	
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy년 MM월 dd일");
		sdate = form.format(wdate);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
		setSdate();
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getImageno() {
		return imageno;
	}
	public void setImageno(int imageno) {
		this.imageno = imageno;
	}
	public long getIlen() {
		return ilen;
	}
	public void setIlen(long ilen) {
		this.ilen = ilen;
	}
	public String getIoriname() {
		return ioriname;
	}
	public void setIoriname(String ioriname) {
		this.ioriname = ioriname;
	}
	public String getIsavename() {
		return isavename;
	}
	public void setIsavename(String isavename) {
		this.isavename = isavename;
	}
	public String getIdir() {
		return idir;
	}
	public void setIdir(String idir) {
		this.idir = idir;
	}
	public String getIcode() {
		return icode;
	}
	public void setIcode(String icode) {
		this.icode = icode;
	}
	@Override
	public String toString() {
		return "FileVO [bno=" + bno + ", fno=" + fno + ", mno=" + mno + ", rno=" + rno + ", cnt=" + cnt + ", ino=" + ino
				+ ", imageno=" + imageno + ", len=" + len + ", ilen=" + ilen + ", id=" + id + ", oriname=" + oriname
				+ ", ioriname=" + ioriname + ", isavename=" + isavename + ", savename=" + savename + ", dir=" + dir
				+ ", idir=" + idir + ", sdate=" + sdate + ", icode=" + icode + ", wdate=" + wdate +  ", tno=" + tno + "]";
	}
	


}