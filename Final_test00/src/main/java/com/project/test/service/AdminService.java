package com.project.test.service;

import java.util.List;

import com.project.test.domain.AdminChartAreaDate;
import com.project.test.domain.AdminChartAreaUsers;
import com.project.test.domain.AdminChartCategory;
import com.project.test.domain.Member;

public interface AdminService {

	int gettotaluser();

	int gettotalschedule();

	String getbestgroup();

	int gettotalgroup();

	List<AdminChartAreaDate> getChartareaDate();

	List<AdminChartAreaUsers> getChartareausers();

	List<AdminChartCategory> getPieChart();

	int getSearchListCount(int index, String search_word);

	List<Member> getSearchList(int index, String search_word, int page, int limit);

	int getGroupSearchListCount(int index, String search_word);

	List<Member> getGroupSearchList(int index, String search_word, int page, int limit);

}
