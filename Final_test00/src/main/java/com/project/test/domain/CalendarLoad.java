package com.project.test.domain;


//캘린더 처음로딩시 보여주는 용도
public class CalendarLoad {
    private int calendar_no;
    private String title;
    private String start;


	 public int getCalendar_no() { return calendar_no; } public void
	 setCalendar_no(int calendar_no) { this.calendar_no = calendar_no; }
	 
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
}
