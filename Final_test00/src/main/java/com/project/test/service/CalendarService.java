package com.project.test.service;

import java.util.List;

import com.project.test.domain.Calendar;
import com.project.test.domain.CalendarLoad;

public interface CalendarService {

	List<CalendarLoad> getCalendarList(String group_no);

	Calendar getCalendarDetail(String calendar_no);

	int CalendarAdd(Calendar calendar);

	int CalendarDelete(int calendar_no);

	int CalendarModify(Calendar calendar);

	int CalendarModifyDate(String startdate, int calendar_no);

}
