package kr.or.member.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}
	
	public Member checkPhone(String phone) {
		Member m = dao.checkPhone(phone);
		return m;
	}

	public Member checkId(String memberId) {
		Member m = dao.checkId(memberId);
		return m;
	}

	public Member checkEmail(String email) {
		Member m = dao.checkEmail(email);
		return m;
	}
	
	@Transactional
	public int insertMember(Member member) {
		int result = dao.insertMember(member);
		return result;
	}

	public String findId(String email) {
		String memberId = dao.findId(email);
		return memberId;
	}
	
}
