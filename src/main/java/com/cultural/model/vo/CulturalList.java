package com.cultural.model.vo;

import java.util.Date;

public class CulturalList {
	private int cno           ;	// PK
	private int seq			  ;
	private String title      ;
	private Date startDate    ;
	private Date endDate      ;
	private String place      ;
	private String realmName  ;
	private String area       ;
	private String thumbnail  ;
	private Double gpsX       ;
	private Double gpsY       ;
	
	

	public CulturalList(int cno, int seq, String title, Date startDate, Date endDate, String place, String realmName,
			String area, String thumbnail, Double gpsX, Double gpsY) {
		super();
		this.cno = cno;
		this.seq = seq;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.place = place;
		this.realmName = realmName;
		this.area = area;
		this.thumbnail = thumbnail;
		this.gpsX = gpsX;
		this.gpsY = gpsY;
	}
	
	

	@Override
	public String toString() {
		return "Cultural [cno=" + cno + ", seq=" + seq + ", title=" + title + ", startDate=" + startDate + ", endDate="
				+ endDate + ", place=" + place + ", realmName=" + realmName + ", area=" + area + ", thumbnail="
				+ thumbnail + ", gpsX=" + gpsX + ", gpsY=" + gpsY + "]";
	}

	

	public int getCno() {
		return cno;
	}



	public void setCno(int cno) {
		this.cno = cno;
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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Double getGpsX() {
		return gpsX;
	}

	public void setGpsX(Double gpsX) {
		this.gpsX = gpsX;
	}

	public Double getGpsY() {
		return gpsY;
	}

	public void setGpsY(Double gpsY) {
		this.gpsY = gpsY;
	}
	                          
	
	
	
	
}   
