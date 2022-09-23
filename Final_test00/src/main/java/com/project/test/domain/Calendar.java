package com.project.test.domain;


import java.sql.Date;

public class Calendar {
	private int calendar_no;
    public int getCalendar_no() {
		return calendar_no;
	}
	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	private String group_no;
    private String title;
    public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	private Date startdate;
    //private String location;
    private String content;
    private String subject;
    //private String calDate; 날짜 변환용(필요여부 확인하기)
	public String getGroup_no() {
		return group_no;
	}
	public void setGroup_no(String group_no) {
		this.group_no = group_no;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	private String location;
	private String xcoord;
	private String ycoord;
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getXcoord() {
		return xcoord;
	}
	public void setXcoord(String xcoord) {
		this.xcoord = xcoord;
	}
	public String getYcoord() {
		return ycoord;
	}
	public void setYcoord(String ycoord) {
		this.ycoord = ycoord;
	}
}
