package com.cultural.model.vo;

import java.util.Date;

public class CulturalDetail {
	private int seq                      ;
	private String title                    ;
	private Date startDate                ;
	private Date endDate                  ;
	private String place                    ;
	private String realmName                ;
	private String area                     ;
	private String subTitle                 ;
	private String price                    ;
	private String contents1                ;
	private String contents2                ;
	private String url                      ;
	private String phone                    ;
	private String imgUrl                   ;
	private double gpsX                     ;
	private double gpsY                     ;
	private String placeUrl                 ;
	private String placeAddr                ;
	private int placeSeq                 ;
	
	
	
	public CulturalDetail() {
		super();
	}


	public CulturalDetail(int seq, String title, Date startDate, Date endDate, String place, String realmName,
			String area, String subTitle, String price, String contents1, String contents2, String url, String phone,
			String imgUrl, double gpsX, double gpsY, String placeUrl, String placeAddr, int placeSeq) {
		super();
		this.seq = seq;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.place = place;
		this.realmName = realmName;
		this.area = area;
		this.subTitle = subTitle;
		this.price = price;
		this.contents1 = contents1;
		this.contents2 = contents2;
		this.url = url;
		this.phone = phone;
		this.imgUrl = imgUrl;
		this.gpsX = gpsX;
		this.gpsY = gpsY;
		this.placeUrl = placeUrl;
		this.placeAddr = placeAddr;
		this.placeSeq = placeSeq;
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getRealmName() {
		return realmName;
	}
	public void setRealmName(String realmName) {
		this.realmName = realmName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContents1() {
		return contents1;
	}
	public void setContents1(String contents1) {
		this.contents1 = contents1;
	}
	public String getContents2() {
		return contents2;
	}
	public void setContents2(String contents2) {
		this.contents2 = contents2;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public double getGpsX() {
		return gpsX;
	}
	public void setGpsX(double gpsX) {
		this.gpsX = gpsX;
	}
	public double getGpsY() {
		return gpsY;
	}
	public void setGpsY(double gpsY) {
		this.gpsY = gpsY;
	}
	public String getPlaceUrl() {
		return placeUrl;
	}
	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}
	public String getPlaceAddr() {
		return placeAddr;
	}
	public void setPlaceAddr(String placeAddr) {
		this.placeAddr = placeAddr;
	}
	public int getPlaceSeq() {
		return placeSeq;
	}
	public void setPlaceSeq(int placeSeq) {
		this.placeSeq = placeSeq;
	}
	
	@Override
	public String toString() {
		return "CulturalDetail [seq=" + seq + ", title=" + title + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", place=" + place + ", realmName=" + realmName + ", area=" + area + ", subTitle=" + subTitle
				+ ", price=" + price + ", contents1=" + contents1 + ", contents2=" + contents2 + ", url=" + url
				+ ", phone=" + phone + ", imgUrl=" + imgUrl + ", gpsX=" + gpsX + ", gpsY=" + gpsY + ", placeUrl="
				+ placeUrl + ", placeAddr=" + placeAddr + ", placeSeq=" + placeSeq + "]";
	}
	
	
	                                 
	
	
	
}
