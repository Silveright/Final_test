package com.project.test.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.test.domain.AdminChartAreaDate;
import com.project.test.domain.AdminChartAreaUsers;
import com.project.test.domain.AdminChartCategory;
import com.project.test.domain.Member;

@Mapper
public interface AdminMapper {

	int getTotaluser();

	int getTotalschedule();

	String getBestgroup();

	int getTotalgroup();

	List<AdminChartAreaDate> getChartareadate();

	List<AdminChartAreaUsers> getChartareausers();

	List<AdminChartCategory> getPieChart();

	int getSearchListCount(Map<String, String> map);

	List<Member> getSearchList(Map<String, Object> map);

	int getGroupSearchListCount(Map<String, String> map);

	List<Member> getGroupSearchList(Map<String, Object> map);

}
