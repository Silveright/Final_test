package com.project.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.test.domain.Member;
import com.project.test.mybatis.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	private MemberMapper dao;
	
	@Autowired
	public MemberServiceImpl(MemberMapper dao) {
		this.dao = dao;
	}

	@Override
	public int isId(String id, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int isId(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member member_info(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int update(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> getSearchList(int index, String search_word, int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSearchListCount(int index, String search_word) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	
}
