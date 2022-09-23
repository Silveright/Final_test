package com.project.test.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.test.domain.Member;
@Mapper
public interface MemberMapper {
	public int isId(String id, String pass);
	
	public int insert(Member m);
	
	public int isId(String id);
	
	public Member member_info(String id);
	
	public void delete(String id);
	
	public int update(Member m);
	
	public List<Member> getSearchList(int index, String search_word,
									  int page, int limit);
	
	public int getSearchListCount(int index, String search_word);
	
	
}
