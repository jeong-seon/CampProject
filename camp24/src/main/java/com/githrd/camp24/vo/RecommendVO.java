package com.githrd.camp24.vo;

import java.util.Arrays;

public class RecommendVO {
	private int api_no, mapx, mapy ;
	private String addr1, facltnm, firstimageurl, homepage, lctcl, induty, eqpmnlendcl, tel, animalcmgcl;

	public int getApi_no() {
		return api_no;
	}
	public void setApi_no(int api_no) {
		this.api_no = api_no;
	}
	public int getMapx() {
		return mapx;
	}
	public void setMapx(int mapx) {
		this.mapx = mapx;
	}
	public int getMapy() {
		return mapy;
	}
	public void setMapy(int mapy) {
		this.mapy = mapy;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getFacltnm() {
		return facltnm;
	}
	public void setFacltnm(String facltnm) {
		this.facltnm = facltnm;
	}
	public String getFirstimageurl() {
		return firstimageurl;
	}
	public void setFirstimageurl(String firstimageurl) {
		this.firstimageurl = firstimageurl;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getLctcl() {
		return lctcl;
	}
	public void setLctcl(String lctcl) {
		this.lctcl = lctcl;
	}
	public String getInduty() {
		return induty;
	}
	public void setInduty(String induty) {
		this.induty = induty;
	}
	public String getEqpmnlendcl() {
		return eqpmnlendcl;
	}
	public void setEqpmnlendcl(String eqpmnlendcl) {
		this.eqpmnlendcl = eqpmnlendcl;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAnimalcmgcl() {
		return animalcmgcl;
	}
	public void setAnimalcmgcl(String animalcmgcl) {
		this.animalcmgcl = animalcmgcl;
	}
	
	@Override
	public String toString() {
		return "RecommendVO [api_no=" + api_no + ", mapx=" + mapx + ", mapy=" + mapy + ", addr1=" + addr1 + ", facltnm="
				+ facltnm + ", firstimageurl=" + firstimageurl + ", homepage=" + homepage + ", lctcl=" + lctcl
				+ ", induty=" + induty + ", eqpmnlendcl=" + eqpmnlendcl + ", tel=" + tel + ", animalcmgcl="
				+ animalcmgcl + "]";
	}
}	
