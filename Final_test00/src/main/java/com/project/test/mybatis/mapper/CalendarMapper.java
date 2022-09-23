package com.project.test.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.test.domain.Calendar;
import com.project.test.domain.CalendarLoad;
@Mapper
public interface CalendarMapper {

	List<CalendarLoad> getCalendarList(String group_no);

	Calendar getCalendarDetail(String calendar_no);

	int CalendarAdd(Calendar calendar);

	int CalendarDelete(int calendar_no);

	int CalendarModify(Calendar calendar);

	int CalendarModifyDate(Map<String, Object> map);

}
